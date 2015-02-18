;;; dpb-config.el --- one line config items that haven't graduated to their own file
;;; 
;;; 


;;; Commentary:
;; 

;;; Code:
(let* ((name (system-name)) ;(name "doubeal-mb")
       (system-name-abv
        (cond 
         ((equal name "macnboss")
          "")
         ((string-match ".*-\\([^-]+\\)$" name)
          (match-string 1 name))
         (t
          "er"))))  ;(message system-name-abv))
        
      (setq rcirc-server-alist
            `(("irc.freenode.net"
               :nick
               ,(concat "dougbeal" system-name-abv)
               :port 6697
               :user-name "dougbeal"
               :password
               ,(concat "dougbeal: " dpb/sensitive/irc/nick/freenode.net)
               :full-name "Douglas Beal"
               :channels ("#rcirc" "#atp" "#relayfm" "#5by5" "#theincomparable")
               :encryption tls))))

(setq rcirc-authinfo
      `(("irc.freenode.net" nickserv "dougbeal" ,dpb/sensitive/irc/nick/freenode.net)))
(provide 'dpb-config)

;;; dpb-config.el ends here
