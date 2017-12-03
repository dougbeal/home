require ["fileinto", "reject", "vacation", "imapflags", "notify", "envelope", "body", "relational", "regex", "subaddress", "copy", "mailbox", "mboxmetadata", "servermetadata", "date", "index", "comparator-i;ascii-numeric", "variables"];

### 1. Sieve generated for save-on-SMTP identities
# You do not have any identities with special filing.

### 2. Sieve generated for discard rules
# You do not have any discard rules.

### 3. Sieve generated for spam protection
if not header :matches "X-Spam-Known-Sender" "yes*" {
  if 
    allof(
    header :contains "X-Backscatter" "yes",
    not header :matches "X-LinkName" "*"
    )
  {
    fileinto "INBOX.spam";
    stop;
  }
}



### 4. Sieve generated for forwarding rules
# You do not have any forwarding rules.

### 5. Sieve generated for vacation responses
# You do not have vacation responses enabled.



### 6. Sieve generated for calendar preferences
if 
  allof(
  header :is "X-ME-Cal-Method" "request",
  not exists "X-ME-Cal-Exists",
  header :contains "X-Spam-Known-Sender" "in-addressbook"
  )
{
  notify :method "addcal";
}
elsif exists "X-ME-Cal-Exists" {
  notify :method "updatecal";
}

### 7. Sieve generated for organise rules
# if header :contains "Subject" "Mac-users" {
#   fileinto "INBOX.tr.mac";
# }
# if header :contains "Subject" "Cs-macusers" {
#   fileinto "INBOX.tr.mac";
# }
# if header :contains "Subject" "cs-grads" {
#   fileinto "INBOX";
# }
# if header :contains ["To","Cc","From","Subject","Date","Content-Type","Delivered-To","In-Reply-To","List-Post","List-Id","Mailing-List","Message-Id","Received","References","Reply-To","Return-Path","Sender","X-AntiAbuse","X-Apparently-From","X-Attached","X-Delivered-To","X-LinkName","X-Mail-From","X-Resolved-To","X-Sender","X-Sender-IP","X-Spam-Charsets","X-Spam-Hits","X-Spam-Known-Sender","X-Spam-Source","X-Version"] "rawfish@cs.washington.edu" {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "uw-systems@cs.washington.edu",
#   header :contains "Cc" "uw-systems@cs.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "cs-ugrads",
#   header :contains "Cc" "cs-ugrads"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "ieee@dougbeal.com",
#   header :contains "Cc" "ieee@dougbeal.com"
#   )
# {
#   fileinto "INBOX.tr.subscriptions.ieee";
# }
# if header :contains "Subject" "[Cse" {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "dougbeal+dball@fastmail.fm",
#   header :contains "Cc" "dougbeal+dball@fastmail.fm"
#   )
# {
#   fileinto "INBOX";
# }
# if header :contains "From" "ameritrade" {
#   fileinto "INBOX.tr.finances.Datek";
# }
# if header :contains "Subject" "[Plex86-" {
#   fileinto "INBOX.tr.software.plex86";
# }
# if header :contains "Subject" "[Cs-ugrads-openforum]" {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "cs-ugrads-openforum@cs.washington.edu",
#   header :contains "Cc" "cs-ugrads-openforum@cs.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }
# if header :contains ["Newsgroups"] "uw-cs.ugrads.openforum" {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "cs-ugrads-general@cs.washington.edu",
#   header :contains "Cc" "cs-ugrads-general@cs.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "tomorrows-professor@lists.Stanford.EDU",
#   header :contains "Cc" "tomorrows-professor@lists.Stanford.EDU"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "engr_students@engr.washington.edu",
#   header :contains "Cc" "engr_students@engr.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "movies@cs.washington.edu",
#   header :contains "Cc" "movies@cs.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }
# if 
#   anyof(
#   header :contains "To" "students@engr.washington.edu",
#   header :contains "Cc" "students@engr.washington.edu"
#   )
# {
#   fileinto "INBOX";
# }

### 8. Sieve generated for pop-link filing


# You were using Advanced Rules (custom sieve script). We disabled all
# the converted rules and appended your existing script below

# require is autogenerated
# require ["envelope", "imapflags", "fileinto", "reject", "notify", "vacation", "regex", "relational", "comparator-i;ascii-numeric", "body", "copy"];

#             header :matches["X-Backscatter"] "NotFound*"
 if anyof( allof( header :contains ["X-Backscatter"] "yes",
                     not header :matches ["X-LinkName"] "*" )

 ) {
   fileinto "INBOX.spam.backscatter";
   stop;
 }

if  header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["10"]  {
  discard;
  stop;
}

if  header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["8"]  {
   fileinto "INBOX.spam.spam";
   stop;
}

if  anyof( header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["5"], header :regex ["X-Spam-score"] ["^4\\.[2-9]$"])  {
    fileinto "INBOX.spam";
    stop;
}  elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "catchthismail@gritmonkey.com" {
  fileinto "INBOX.spam";
  stop;
}elsif header :contains "X-Delivered-to" ["gritmonkey@gritmonkey.com"] {
  # since monkey@ needs to be tossed, and it can appear as <monkey@g...>, explicitly match gritmonkey
  # has to be contains, for foobar <gritmonkey@gritmonkey.com>
  stop;
# leaked email addresses
}elsif header :contains "X-Delivered-to" ["monkey@gritmonkey.com", "adboe.com@dougbeal.com", "ameritrade.com@dougbeal.com", "gearfordean@dougbeal.com", "emerald.forest@dougbeal.com", "caskers.com@dougbeal.com"] {
  fileinto "INBOX.spam.manual";
}elsif header :contains "from" ["eventful.com"] {
  fileinto "INBOX.spam.manual";
}elsif header :contains "List-Id" "studiosysadmins.com" {
  fileinto "INBOX.monitor.ssa";
}elsif header :contains "Sender" "sender@lists.bigtent.com" {
  fileinto "INBOX.tr.lists.ckd";
}elsif header :contains "from" [
                                 "AlaskaairNewsletter@myalaskaair.com",
                                 "CostcoNews@online.costco.com",
                                 "Dell Direct",
                                 "Sale@Sales.Overstock.com",
                                 "TargetNews@emails.target.com",
                                 "americansciencesurplus@sciplus.com",
                                 "amtrak@e-mail.amtrak.com",
                                 "att@e.att-mail.com",
                                 "capovw.com",
                                 "chefmail@bigoven.com",
                                 "consumerreports_online@email.consumerreports.org",
                                 "contact@zapier.com",
                                 "cstacey.SouthTacomaHonda@gs.reyrey.com",
                                 "deals@deals.frys.com",
                                 "deals@ifly.alaskaair.com",
                                 "deals@ifly.alaskaair.com",
                                 "dell.com",
                                 "do-not-reply@jetpens.com",
                                 "e-statement@mymileageplan.com",
                                 "emeraldfortestsugar.com",
                                 "enews.becu.org",
                                 "growers@harrisseeds.com",
                                 "hello@cottonbureau.com",
                                 "hello@getpocket.com",
                                 "help@stickermule.com",
                                 "hhonors@h1.hiltonhhonors.com",
                                 "ikea-usa@mail.ikea-usa.com",
                                 "info@okeeffescompany.com",
                                 "info@pce.uw.edu",
                                 "info@supercook.com",
                                 "info@unexpectedproductions.org",
                                 "linkedin@e.linkedin.com",
                                 "mail@humansolution.com",
                                 "mileage.plan@ifly.alaskaair.com",
                                 "monoprice@news.monoprice.com",
                                 "mp.member@alaskaair.com",
                                 "news@americandiabeteswholesale.com",
                                 "newsletter@cajuncreations.com",
                                 "newsletter@email.raise.com",
                                 "newsletter@ifttt.com",
                                 "newsletters@zenvilla.com",
                                 "no-reply@keyringapp.com",
                                 "no-reply@mgo.com",
                                 "no-reply@woot.com",
                                 "offers@deepdiscountpromotions.com",
                                 "overlords@email.thinkgeek.com",
                                 "plentyoffish.com",
                                 "promo@e.newegg.com",
                                 "promo@email.newegg.com",
                                 "rei_gearmail@notices.rei.com",
                                 "rei_gearmail@notices.rei.com",
                                 "rei_storeevents@notices.rei.com",
                                 "reply@e.taxact.com",
                                 "sales@andersonpens.com",
                                 "sales@penchalet.com",
                                 "salesmrk@gardenersedge.com",
                                 "school@unexpectedproductions.org",
                                 "service@cs.frys.com",
                                 "service@outpost.com",
                                 "shop@email.macys.com",
                                 "specials@email.officedepot.com",
                                 "staples@easy.staples.com",
                                 "starbucks@e.starbucks.com",
                                 "starwood@starwood.delivery.net",
                                 "subscribe@sleepez.com",
                                 "swansonhealthproducts@e-mail.swanson-vitamins.com",
                                 "costco@online.costco.com",
                                 "news@macrofab.com",
                                 "sierratradingpost@sierratradingpost.com",
                                 "newsletter@gouletpens.com",
                                 "cs@injinji.com",
                                 "specials@penchalet.com",
                                 "sierratradingpost@sierratradingpost.com",
                                 "targetnews@e.target.com",
                                 "fandangonow@movies.fandangonow.com",
                                 "cartwheel@e.target.com",
                                 "tor-forge@mail.macmillan.com",
                                 "tordotcom@mail.macmillan.com",
                                 "updates@amtrakguestrewards.com",
                                 "vimeo@email.vimeo.com",
                                 "vw.com",
                                 "wyndhamrewards@e-mails.wyndhamrewards.com",
                                 "zappos@zappos.com",
                                 "zennioptical@reply.bronto.com",
                                 "news@email.kayak.com",
                                 "goodgrowing@harrisseeds.com",
                                 "help+newsletter@threadless.com",
                                 "newsletters@obsidian.net",
                                 "support@setapp.com",
                                 "newsletter@asmallorange.com",
                                 "discover@new.itunes.com",
                                 "hello@rye51.com",
                                 "DisneyDVD@disney.dvdmailcenter.com",
                                 "redmail@redfin.com"
                                 ] {
  fileinto "INBOX.tr.ads";
}elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] [
                                                                                           "dell@dougbeal.com",
                                                                                           "geico.com@dougbeal.com",
                                                                                           "pensketruckrental.com@dougbeal.com",
                                                                                           "southtacmoahonda@dougbeal.com",
                                                                                           "ikea.costa.mesa@dougbeal.com",
                                                                                           "mtjc.fm@dougbeal.com",
                                                                                           "steamcarnival.com@dougbeal.com"
                                                                                           ] {
  fileinto "INBOX.tr.ads";
} elsif header :contains "to" "+ad@dougbeal.com" {
  fileinto "INBOX.tr.ads";
} elsif header :contains "to" "+instapaper.tickytacky@dougbeal.com" {
  fileinto "INBOX.monitor";
  redirect "readlater.gscfox1g4is@instapaper.com";
} elsif header :contains "from" "notifications@github.com" {
  fileinto "INBOX.monitor.github";
} elsif  header :contains "subject" "Mac-users" {
  fileinto "INBOX.tr.mac";
} elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "@cs.wisc.edu" {
  fileinto "INBOX.tr.edu.wisconsin";
} elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "cs-wisc@dougbeal.com" {
  fileinto "INBOX.tr.edu.wisconsin";
} elsif  header :contains ["to", "cc", "resent-to"] "uw-systems@cs.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains "subject" "cs-grads" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains "subject" "\[Cse" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "rawfish@cs.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "ieee@dougbeal.com" {
  fileinto "INBOX.tr.subscriptions.ieee";
} elsif  header :contains "subject" "Cs-macusers" {
  fileinto "INBOX.tr.mac";
} elsif  header :contains "from" "ameritrade" {
  fileinto "INBOX.tr.finances.ameritrade";
} elsif  header :contains "subject" "\[Plex86-" {
  fileinto "INBOX.tr.software.plex86";
} elsif header :contains ["Newsgroups"] "uw-cs.ugrads.openforum" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads-general@cs.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads-openforum@cs.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains "subject" "\[Cs-ugrads-openforum\]" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "movies@cs.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "engr_students@engr.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "students@engr.washington.edu" {
  fileinto "INBOX.tr.edu.washington";
} elsif allof( header :contains ["from"] "cust.service03@amazon.com", header :contains "subject" "Your Amazon Kindle document is here") {
  fileinto "INBOX.tr.amazon.kindle-documents";
} elsif header :contains "list-id" "oversight.foolscap.org" {
  fileinto "INBOX.foolscap.oversight";
} elsif header :contains "list-id" "*.foolscap.org" {
  fileinto "INBOX.foolscap.catchall";
} elsif header :contains ["to"] ["foolscap.org", "foolscapcon.org", "littlecatz.org"] {
    if header :contains ["X-Delivered-to"] ["@dougbeal.com"] {
            fileinto "INBOX";
        }
    else {    
        fileinto "INBOX.foolscap";
    }
}
 

 



# ===BEGIN-GENERATED=== Text between markers will be automatically replaced
#
# This is the sieve script that would be used if you weren't using
# custom rules.  Note that it has been commented out, so it has no actual
# effect on your mail, we've just placed it here for your reference.
# Also note that any changes you make between the BEGIN and END tags
# may be overwritten at any time, so if you want to add your own
# comments and code, don't do it in here!
#
# require ["envelope", "imapflags", "fileinto", "reject", "notify", "vacation", "regex", "relational", "comparator-i;ascii-numeric", "body", "copy"];
# 
# if allof(
#   header :contains ["X-Backscatter"] "yes",
#   not header :matches ["X-LinkName"] "*" 
# ) {
#   fileinto "INBOX.spam.backscatter";
#   stop;
# }
# if  header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["13"]  {
#   discard;
#   stop;
# }
# if  anyof( header :value "ge" :comparator "i;ascii-numeric" ["X-Spam-score"] ["5"], header :regex ["X-Spam-score"] ["^4\\.[2-9]$"])  {
#   fileinto "INBOX.spam";
#   stop;
# }
# if header :contains "subject" "Mac-users" {
#   fileinto "INBOX.tr.mac";
# } elsif header :contains "subject" "Cs-macusers" {
#   fileinto "INBOX.tr.mac";
# } elsif header :contains "subject" "cs-grads" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "uw-systems@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads" {
#   fileinto "INBOX";
# } elsif header :contains ["To", "Cc", "From", "Subject", "Date", "Content-Type", "Delivered-To", "In-Reply-To", "List-Post", "List-ID", "Mailing-List", "Message-ID", "Received", "References", "Reply-to", "Return-Path", "Sender", "X-AntiAbuse", "X-Apparently-From", "X-Attached", "X-Delivered-to", "X-LinkName", "X-Mail-from", "X-Resolved-to", "X-Sender", "X-Sender-IP", "X-Spam-charsets", "X-Spam-hits", "X-Spam-known-sender", "X-Spam-source", "X-Version"] "rawfish@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "ieee@dougbeal.com" {
#   fileinto "INBOX.tr.subscriptions.ieee";
# } elsif header :contains "subject" "[Cse" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "dougbeal+dball@fastmail.fm" {
#   fileinto "Inbox";
# } elsif header :contains "from" "ameritrade" {
#   fileinto "INBOX.tr.finances.Datek";
# } elsif header :contains "subject" "[Plex86-" {
#   fileinto "INBOX.tr.software.plex86";
# } elsif header :contains "subject" "[Cs-ugrads-openforum]" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads-openforum@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["Newsgroups"] "uw-cs.ugrads.openforum" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads-general@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "tomorrows-professor@lists.Stanford.EDU" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "engr_students@engr.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "movies@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "students@engr.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["x-resolved-to"] "+chatlogs@" {
#   addflag "$ChatLog";
#   addflag "\\Seen";
#   fileinto "INBOX.Chats";
#   removeflag "$ChatLog";
#   removeflag "\\Seen";
# } 
# ===END-GENERATED=== Text between markers will be automatically replaced
