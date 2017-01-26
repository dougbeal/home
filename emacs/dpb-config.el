;;; dpb-config.el --- one line config items that haven't graduated to their own file
;;; 
;;; 


;;; Commentary:
;; 

;;; Code:
(let* ((name (system-name)) ;(name "doubeal-mb") moc-mb1
       (match-index (string-match ".*-\\(.[^-.]+\\)" name))
       (match (match-string 1 name))
       (system-name-abv
        (cond
         ((equal name "macnboss")
          "")
         (match
          (concat "|"  ))
         (t
          "|fail"))))
  (message "irc abv %s %s %s" name match-index match system-name-abv)
  (setq rcirc-server-alist
        `(("irc.freenode.net"
           :nick
           ,(concat "dougbeal" system-name-abv)
           :port 6697
           :user-name "dougbeal"
           :password
           ,(concat "dougbeal: " dpb/sensitive/irc/nick/freenode.net)
           :full-name "Douglas Beal"
           :channels ("#rcirc" "#atpfm" "#relayfm" "#5by5" "#theincomparable" "#goodstuff", "#swift-lang")
           :encryption tls))))


(setq rcirc-authinfo
      `(("irc.freenode.net" nickserv "dougbeal" ,dpb/sensitive/irc/nick/freenode.net)))
(require 'emojify)
(global-emojify-mode)
(provide 'dpb-config)

;;; dpb-config.el ends here
