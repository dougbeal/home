# elsif  header :contains [
#"Sender", "X-Sender", "Mailing-List", "X-Apparently-From", "X-Version", "X-Sender-IP", "Received", "Return-Path", "Delivered-To", "List-Post", "Date", "Subject", "To", "Cc", "From", "Reply-to", "X-AntiAbuse", "Content-Type", "Received", "X-LinkName", "X-Resolved-to", "X-Delivered-to", "X-Mail-from", "X-Spam-hits"] "rawfish@cs.washington.edu"


require ["envelope", "imapflags", "fileinto", "reject", "notify", "vacation", "regex", "relational", "comparator-i;ascii-numeric", "body", "copy"];

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
}elsif header :contains "from" "news@email.kayak.com" {
  fileinto "INBOX.ads";
}elsif header :contains "List-Id" "studiosysadmins.com" {
  fileinto "INBOX.lists.ssa";
}elsif header :contains "from" "Sale@Sales.Overstock.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "promo@e.newegg.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "service@cs.frys.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "specials@email.officedepot.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "Dell Direct" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "offers@deepdiscountpromotions.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "dell.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "mp.member@alaskaair.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "CostcoNews@online.costco.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "zappos@zappos.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "service@outpost.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "growers@harrisseeds.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "promo@email.newegg.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "e-statement@mymileageplan.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "enews.becu.org" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "cstacey.SouthTacomaHonda@gs.reyrey.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "emeraldfortestsugar.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "plentyoffish.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "eventful.com" {
  fileinto "INBOX.spam";
}elsif header :contains "to" "southtacmoahonda@dougbeal.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "capovw.com" {
  fileinto "INBOX.ads";
}elsif header :contains "from" "vw.com" {
  fileinto "INBOX.ads";
}elsif header :contains "to" "monkey@gritmonkey.com" {
  fileinto "INBOX.spam.manual";
}elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "dell@dougbeal.com" {
  fileinto "INBOX.ads";
} elsif  header :contains "subject" "Mac-users" {
  fileinto "INBOX.mac";
} elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "@cs.wisc.edu" {
  fileinto "INBOX.edu.wisconsin";
#} elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "dougbeal@cs.wisc.edu" {
#  fileinto "INBOX.edu.wisconsin";
#} elsif  header :contains [ "Delivered-To", "To", "Cc", "X-Resolved-to", "X-Delivered-to"] "cs-wisc@dougbeal.com" {
#  fileinto "INBOX.edu.wisconsin";
} elsif  header :contains ["to", "cc", "resent-to"] "uw-systems@cs.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains "subject" "cs-grads" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains "subject" "\[Cse" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "rawfish@cs.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "ieee@dougbeal.com" {
  fileinto "INBOX.subscriptions.ieee";
} elsif  header :contains "subject" "Cs-macusers" {
  fileinto "INBOX.mac";
} elsif  header :contains "from" "ameritrade" {
  fileinto "INBOX.finances.ameritrade";
} elsif  header :contains ["to", "x-delivered-to"] "ameritrade.com@dougbeal.com" {
  fileinto "INBOX.finances.ameritrade.spam";
} elsif  header :contains "subject" "\[Plex86-" {
  fileinto "INBOX.software.plex86";
} elsif header :contains ["Newsgroups"] "uw-cs.ugrads.openforum" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads-general@cs.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "cs-ugrads-openforum@cs.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains "subject" "\[Cs-ugrads-openforum\]" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "movies@cs.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "engr_students@engr.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif  header :contains ["to", "cc", "resent-to"] "students@engr.washington.edu" {
  fileinto "INBOX.edu.washington";
} elsif allof( header :contains ["from"] "cust.service03@amazon.com", header :contains "subject" "Your Amazon Kindle document is here") {
  fileinto "INBOX.amazon.kindle-documents";
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
#   fileinto "INBOX.mac";
# } elsif header :contains "subject" "Cs-macusers" {
#   fileinto "INBOX.mac";
# } elsif header :contains ["to", "cc", "resent-to"] "uw-systems@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads" {
#   fileinto "INBOX";
# } elsif header :contains "subject" "cs-grads" {
#   fileinto "INBOX";
# } elsif header :contains ["To", "Cc", "From", "Subject", "Date", "Content-Type", "Delivered-To", "In-Reply-To", "List-Post", "Mailing-List", "Message-ID", "Received", "References", "Reply-to", "Return-Path", "Sender", "X-AntiAbuse", "X-Apparently-From", "X-Attached", "X-Delivered-to", "X-LinkName", "X-Mail-from", "X-Resolved-to", "X-Sender", "X-Sender-IP", "X-Spam-charsets", "X-Spam-hits", "X-Spam-known-sender", "X-Spam-source", "X-Version"] "rawfish@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "ieee@dougbeal.com" {
#   fileinto "INBOX.subscriptions.ieee";
# } elsif header :contains "subject" "[Cse" {
#   fileinto "INBOX";
# } elsif header :contains "from" "ameritrade" {
#   fileinto "INBOX.finances.Datek";
# } elsif header :contains ["to", "cc", "resent-to"] "dougbeal+dball@fastmail.fm" {
#   fileinto "Inbox";
# } elsif header :contains "subject" "[Plex86-" {
#   fileinto "INBOX.software.plex86";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads-general@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["Newsgroups"] "uw-cs.ugrads.openforum" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "cs-ugrads-openforum@cs.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains "subject" "[Cs-ugrads-openforum]" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "engr_students@engr.washington.edu" {
#   fileinto "INBOX";
# } elsif header :contains ["to", "cc", "resent-to"] "tomorrows-professor@lists.Stanford.EDU" {
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
