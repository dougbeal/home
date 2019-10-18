
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
} elsif header :contains "to" ["_ad@dougbeal.com", ".ad@dougbeal.com", "+ad@dougbeal.com", "58472_ad"] {
    # redirect some messages
    if header :contains "to" ["58472_vi"] {
            redirect "vi_redirect@dougbeal.com";
        } elsif header :contains "to" ["58472_jo"] {
        redirect "jo_redirect@dougbeal.com";
    }
    fileinto "INBOX.tr.ads";
} elsif header :contains "to" ["+instapaper.tickytacky@dougbeal.com", "58472_in"] {
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
