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
         ((string-match ".*-\\([^-.]+\\)\\(.[^-.]+\\)" name)
          (concat "|" (match-string 1 name) ))
         (t
          "|er"))))  ;(message system-name-abv))
        
      (setq rcirc-server-alist
            `(("irc.freenode.net"
               :nick
               ,(concat "dougbeal" system-name-abv)                        
               :port 6697
               :user-name "dougbeal"
               :password
               ,(concat "dougbeal: " dpb/sensitive/irc/nick/freenode.net)
               :full-name "Douglas Beal"
               :channels ("#rcirc" "#atpfm" "#relayfm" "#5by5" "#theincomparable" "#goodstuff", "#swift-lang", "#emacs")
               :encryption tls))))


(setq rcirc-authinfo
      `(("irc.freenode.net" nickserv "dougbeal" ,dpb/sensitive/irc/nick/freenode.net)))
(require 'emojify)
(global-emojify-mode)

;; Toggle window dedication

(defun toggle-window-dedicated ()

"Toggle whether the current active window is dedicated or not" ;;http://stackoverflow.com/questions/43765/pin-emacs-buffers-to-windows-for-cscope

(interactive)

(message 

 (if (let (window (get-buffer-window (current-buffer)))

       (set-window-dedicated-p window 

        (not (window-dedicated-p window))))

    "Window '%s' is dedicated"

    "Window '%s' is normal")

 (current-buffer)))
(provide 'dpb-config)

;;; dpb-config.el ends here
