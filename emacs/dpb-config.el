;;; dpb-config.el --- one line config items that haven't graduated to their own file
;;;
;;;


;;; Commentary:
;;

;; TODO: no windows naming support
;; (system-name)
;; (message "%s" system-type)
;;                                         ; darwin
;;                                         ; windows-nt
;; (pcase system-type
;;   ('darwin (message "mac"))
;;   ('windows-nt (message "win"))
;;   (_ (message "unk")))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(defun --set-emoji-font (frame)
  "Adjust the font settings of FRAME so Emacs can display emoji properly."
  (if (eq system-type 'darwin)
      ;; For NS/Cocoa
      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
    ;; For Linux
    (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))

;; For when Emacs is started in GUI mode:
(--set-emoji-font nil)
;; Hook for when a frame is created with emacsclient
;; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html
(add-hook 'after-make-frame-functions '--set-emoji-font)

;;; Code:
(let* ((irc-base-name "dougbeal")
       (name (system-name)) ;(name "doubeal-mb") moc-mb1
       (match-index (string-match ".*-\\(.[^-.]+\\)" name))
       (system-name-extracted-abbreviation (match-string 1 name))
       )
  (defvar dpb/config/system-name-extracted-abbreviation system-name-extracted-abbreviation)
  (defvar dpb/config/irc-nick (concat irc-base-name "|" system-name-extracted-abbreviation))
  (message "irc config irc-nick %s system-name-extracted-abbreviation %s %s %s %s"
           dpb/config/irc-nick
           dpb/config/system-name-extracted-abbreviation
           irc-base-name
           name
           match-index))

(setq rcirc-server-alist
      `(("irc.freenode.net"
         :nick
         ,dpb/config/irc-nick
         :port 6697
         :user-name "dougbeal"
         :password
         ,(concat "dougbeal: " dpb/sensitive/irc/nick/freenode.net)
         :full-name "Douglas Beal"
         :channels ("#rcirc" "#atpfm" "#relayfm" "#theincomparable" "#indieweb" "#indieweb-dev"  "#indieweb-wordpress" "#indieweb-meta" "#indieweb-chat" "#microformats" )
         :encryption tls)))


(setq rcirc-authinfo
      `(("irc.freenode.net" nickserv "dougbeal" ,dpb/sensitive/irc/nick/freenode.net)))
(setq rcirc-bright-nicks
   (quote
    (
     "ATPTipster"
     "Marco\\"
     "MrsSoup"
     "Pastaboy"
     "PenAddict"
     "SamTheGeek"
     "afwaller"
     "anexstacy"
     "caseyliss"
     "dowdyism"
     "imyke"
     "ismh"
     "jasonsnell"
     "joesteel"
     "jamesthomson"
     "jsiracusa"
     "slade401"
     "thebaron66"
     "msthebaron"
     "ticci"
     )))

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
