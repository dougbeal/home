#!/bin/bash
if [[ $OS =~ Window.*  ]]; then
    win_path="""$( cd $(dirname "${BASH_SOURCE[0]}"); cygpath -ma . )"""
    unix_path="""$( cd $(dirname "${BASH_SOURCE[0]}"); pwd -P )"""
else
    unix_path="""$( cd $(dirname "${BASH_SOURCE[0]}"); pwd -P )"""
fi
paths=( "$unix_path" "$win_path" )
repo="git/home"
init_file="emacs/init.el"
home_dirname=
locations=( """$(dirname "$HOME")""" "/Volumes/Macintosh HD/Users/" "/Users" "/home" "C:/cyginw/home" "/" $paths )

############################################################
# generate .emacs file, which load repo init.el  

location_list=""
# create lisp strings
for location in "${locations[@]}"; do
    location_list="$location_list \"${location}\""
done
echo """
(require 'cl)
(defun load-init-file ()
  (let* (
        (user (getenv \"USER\"))
        (repo \"${repo}\")
        (locations 
        (mapcar (lambda (location) (concat 
                                     (file-name-as-directory (concat 
                                                              (file-name-as-directory location) 
                                                              user)) 
                                     repo))
          (list ${location_list})
          ))
	(path nil)
        )
    (catch 'break
      (loop for location in locations
	    do
	    (setq path (concat (file-name-as-directory location) \"${init_file}\"))
            (add-to-list 'load-path path)
	    (if (load path t) 
		(throw 'break path)
              (message (concat \"Load failed \" path))
	      )
	    )
      )
    )
)
          
(let ((file (load-init-file)))
	(message (concat \"load-init-file: \" file (if file \" succeeded.\" \" failed.\"))))
"""
