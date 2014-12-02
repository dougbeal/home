;;; one line config items that haven't graduated to their own file

(setq rcirc-server-alist
      `(("irc.freenode.net"
        :nick "dougbeal"
        :port 6697
        :user-name "dougbeal"
        :password
        ,dpb/sensitive/irc/nick/freenode.net
        :full-name "Douglas Beal"
        :channels ("#rcirc" "#atp" "#relayfm")
        :encryption tls)))
