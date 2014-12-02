;;; dpb-config.el --- one line config items that haven't graduated to their own file
;;; 
;;; 


;;; Commentary:
;; 

;;; Code:

(setq rcirc-server-alist
      `(("irc.freenode.net"
        :nick "dougbeal"
        :port 6697
        :user-name "dougbeal"
        :password
        ,(concat "dougbeal: " dpb/sensitive/irc/nick/freenode.net)
        :full-name "Douglas Beal"
        :channels ("#rcirc" "#atp" "#relayfm")
        :encryption tls)))

(setq rcirc-authinfo
      `(("irc.freenode.net" nickserv "dougbeal" ,dpb/sensitive/irc/nick/freenode.net)))
(provide 'dpb-config)

;;; dpb-config.el ends here
