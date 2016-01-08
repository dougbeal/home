require 'exiftool'
require 'digest/md5'
require 'thread'
require 'io/console'
require 'pry'


Encoding.default_external = Encoding::UTF_8
PHOTO_INCOMING_DIRECTORY = '/Volumes/Aperture 2014/live/Incomming Photos'
#PHOTO_INCOMING_DIRECTORY = '/Volumes/Aperture 2014/live/Incomming Photos/2014'
#PHOTO_INCOMING_DIRECTORY = '/Volumes/Aperture 2014/live/Incomming Photos/2015'
#PHOTO_INCOMING_DIRECTORY = '/Volumes/Aperture 2014/live/Incomming Photos/2015/01'
#PHOTO_INCOMING_DIRECTORY = '/Volumes/Aperture 2014/live/Incomming Photos/2015/01/29'

PHOTO_OUTGOING_DIRECTORY = '/Volumes/Aperture 2014/live/Google Drive/Google Photos'
PHOTO_TRASH_DIRECTORY = "/Volumes/Aperture 2014/.Trashes/#{Process.uid}"
EXIFTOOL_OPTS = "-time:Creat* -time:File*" # only grab fields that will be used
ARG_MAX = Integer(`getconf ARG_MAX`)
CSI = "\e["
Thread::abort_on_exception = true

ACTIVE = ["-", "\\", "|", "/"]

THREAD_INITIAL_STATUS = "waiting"

PHOTO_THREAD_NAMES = ['md5', 'exif']

def generate_unique_name(hash, path)
  filename = hash[:filename]
  date = hash[:date]
  ext = File.extname filename
  name = File.basename filename, ext
  uniq = ""
  uniq = date.strftime('%Y_%m_%d') if date
  newname = name + uniq + ext
  count = 0
  while File.exist? File.join(path, newname)
    raise "Failed to find a unique name for #{hash.to_hash} #{path}" if count > 99
    newname = name + uniq + "%02d" % count + ext
  end
  return newname
end

def path_from_photo_hash( photo_hash )
  date = photo_hash[:date]
  raise "No date to convert to path: #{photo_hash}" unless date
  return File.join( date.strftime('%Y'), date.strftime('%m'), date.strftime('%d') )
end

def scan_photo_directory(target)
  
end

def extract_exif_date(exif)
  exif[:create_date_civil] or exif[:file_modify_date_civil]
end

def exif_scan_photo_directories(target)
    glob = "./**/*"
    files = Dir.glob(File.join(target, glob)).select { |f| File.file?(f) }
    return {}, {} unless files and files.length > 0
    max_length = files.max_by(&:length).length * 2 # spaces will be escaped
    file_chunk_count = (ARG_MAX / max_length).floor
    incomming_hash = {}
    destination_hash = {}
    names = PHOTO_THREAD_NAMES
    queue_hash = {}
    queue_hash['md5'] = md5_queue = Queue.new
    queue_hash['exif'] = exif_queue = Queue.new
    #queue_hash['dest'] = dest_queue = Queue.new
    destination_dir_set = Set.new
    complete_hash = {}
    names.each { |n| complete_hash[n] = false }
    status = {}
    queuemax = {}    
    names.each do |n|
      status[n] = THREAD_INITIAL_STATUS
    end

    threads = {}

    def state
      names = PHOTO_THREAD_NAMES
      names.map { |name|  "#{name} alive #{threads[name].alive?} queue size #{queue_hash[name].size}, max #{queuemax[name]} complete #{complete_hash[name]} status '#{status[name]};"  }.join("\n")
    end
      
    name = 'exif'
    threads[name] = Thread.new(name) do |name|
      log("#{name} started.")      
      while exif_queue.size > 0 or not complete_hash[name] do
        file_chunk = exif_queue.pop
        status[name] = "started" if status[name].eql? THREAD_INITIAL_STATUS
        begin
          exiftool = Exiftool.new(file_chunk, EXIFTOOL_OPTS)
          exiftool.files_with_results.each do |filename|
            exif = exiftool.result_for(filename)
            date = extract_exif_date(exif)
            filename = exif[:source_file]
            if not date or not filename
              log(exif.to_hash)
            end
            photo_hash = { :incomming => true, :filename => filename, :date => date }
            md5_queue << photo_hash
            destination_path = File.join(PHOTO_OUTGOING_DIRECTORY, path_from_photo_hash(photo_hash))
            if destination_dir_set.add? destination_path
              Dir.glob(File.join(destination_path, glob)).each do |f|
                md5_queue << { :incomming => false, :filename => f } if File.file?(f)
              end
            end
            status[name] = "#{filename}: #{date}"
          end
        rescue Exiftool::ExiftoolNotInstalled
          log "exiftool internal error with file_chunk #{file_chunk}"
        end
        
      end
      status[name] = "complete #{status[name]}"
      if md5_queue.size == 0 and md5_queue.num_waiting == 1
        # no work, terminate!
        threads['md5'].terminate
      end
      complete_hash['md5'] = true
      log "#{name} complete"
    end

    name = 'md5'
    threads[name] = Thread.new(name) do |name|

      queue = md5_queue
      log("#{name} started.")
      while queue.size > 0 or not complete_hash[name] do
        val = queue.pop
        status[name] = "started" if status[name].eql? THREAD_INITIAL_STATUS        
        filename = val[:filename]
        key = Digest::MD5.hexdigest(IO.read(filename)).to_sym
        status[name] = "#{filename}: #{key}"
        hash = destination_hash
        if val[:incomming]
          hash = incomming_hash
        end
        if hash.has_key? key
          hash[key].push val
        else
          hash[key] = [val]
        end
      end
      status[name] = "complete"
      log "#{name} complete"
    end    
    
    files.each_slice(file_chunk_count) do |file_chunk|
      exif_queue << file_chunk
    end

    complete_hash['exif'] = true


    queue_hash.each do |name, q|
      queuemax[name] = q.size
    end
    
    console = IO.console

    lines = 2*names.length    
    console.write "\n"*lines
    active_state = 0
    while threads.reduce(false) { |m, (name, thread)| m || thread.alive? } do
      console.write "\r#{CSI}#{lines}A"
      rows,cols = console.winsize
      status_length = cols - 4
      #console.write "threads " + threads.reduce("") { |s, t| "#{s} #{t.alive?}" } + "\n"
      queuemax.each do |name, max|
        complete = complete_hash[name]
        alive = threads[name].alive?
        size = queue_hash[name].size
        if size > max
          max = queuemax[name] = size
        end
        if max == 0 and not complete
          progress = 0
        else
          if max == 0 and complete
            percentage = 1.0
          else
            percentage = (max-size.to_f)/max
          end
          progress = (percentage * status_length).ceil
        end
        line = "#{name}[#{size}:#{progress}/#{max}|#{complete}|#{alive}]$ #{status[name]}."
        console.write line + " " * (cols-line.length) + "\n"
        if progress == status_length 
          console.write " |" + "X" * progress + "| " + "\n"
        else
          console.write " |" + "X" * progress + ACTIVE[active_state] + "_" * (status_length-progress-1) + "| " + "\n"
        end
      end
      sleep(0.1)
      active_state = (active_state + 1) % ACTIVE.length
    end
    log("threads complete")
    return incomming_hash, destination_hash
end


# goals
# - don't duplicate files
# - don't duplicate files even if renamed
# - handle name collisions of different files
# - organize into YEAR/MONTH/DAY file structure
# - put processed files elsewhere so they don't have to be reprocessed?

# - work directly off sd card?

# - need to scan all files in destination directory before moving anything

# - TODO: clean up empty incomming directories

Maid.rules do
  def osx_trash(filename)
    path = Pathname.new(file)
    url = NSURL.fileURLWithPath(path.realpath.to_s)
    item = finder.items.objectAtLocation(url)
    if @file_options[:noop]
      log("trash #{url}")
    else
      #item.delete
    end
  end
  
  def sync_and_organize_photos
    log("incomming directory #{ PHOTO_INCOMING_DIRECTORY }, #{Dir.pwd}")
    incomming_hash, destination_hash = exif_scan_photo_directories(PHOTO_INCOMING_DIRECTORY)
    log("incomming scanned")

    destination_hash.each do |md5, photo_array|
      if photo_array.length > 1
        log "=== Duplicate Destination Files [#{md5}]==="
        photo_array.each { |h| log '  '+h[:filename] }
      end
    end
    incomming_hash.each do |incomming_md5, photo_array|
      if photo_array.length > 1
        puts "=== Identical Files ===\n"
        photo_array.each { |h| puts '  '+h[:filename] }
      end
      photo_array.each do |photo_hash|
        filename = photo_hash[:filename]
        destination_directory = File.join PHOTO_OUTGOING_DIRECTORY, path_from_photo_hash(photo_hash)
        destination = File.join destination_directory, File.basename(photo_hash[:filename])
        if File.exist?(destination)
          #log(photo_hash.to_hash)
          if destination_hash.key? incomming_md5
            # already at destination, dispose of incomming file
            move(filename, PHOTO_TRASH_DIRECTORY)
          else
            # move incomming to outgoing with new name
            new_name = generate_unique_name(photo_hash, destination_directory)
            rename(filename, File.join(destination, new_name))
          end
        else
          mkdir(destination_directory)
          move(filename, destination_directory)
        end
      end
    end
  end

  rule 'sync and organize photos' do
    sync_and_organize_photos()
  end  

  watch PHOTO_INCOMING_DIRECTORY do
    rule 'on watch sync and organize photos' do
      sync_and_organize_photos()
    end
  end
end

#  if !@file_options[:noop]
