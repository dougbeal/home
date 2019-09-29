(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\M-`" 'other-frame )
(define-key global-map (kbd "M-]") (lambda () (interactive (other-window +1 nil))))
(define-key global-map (kbd "M-[") (lambda () (interactive (other-window -1 nil))))
(define-key global-map (kbd "A-]") (lambda () (interactive (other-window +1 nil))))
(define-key global-map (kbd "A-[") (lambda () (interactive (other-window -1 nil))))
(define-key python-mode-map (kbd "C-x a") 'nose2-all)
(define-key python-mode-map (kbd "C-x m") 'nose2-module)
(global-set-key (kbd "C-x r v") 'list-register)
(global-set-key (kbd "C-`") 'next-error)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;;(define-key twittering-mode-map (kbd "C-c o") 'osx-browse-url)
;;(define-key twittering-mode-map (kbd "C-c e") 'browse-url-text-emacs)


(require 'key-chord)
(key-chord-mode 0)

                                        ;
;; generate template
; (progn (insert "\n") (mapcar (lambda (key) (insert (format "(\"%i\" . \"x\")\n" key))) (number-sequence 0 9)))


; sorted by kinesis layout

;; (setq dpb/key-chord-symbol-map '(
;;                                  ("`" . "~")
;;                                  ("\\" . "|")
;;                                  (";" . ":")
;;                                  ("'" . "\"")
;;                                  ("," . "<")
;;                                  ("." . ">")
;;                                  ("/" . "?")
;;                                  ("[" . "{")
;;                                  ("]" . "}")
;;                                  ("=" . "+")
;;                                  ("0" . ")")
;;                                  ("1" . "!")
;;                                  ("2" . "@")
;;                                  ("3" . "#")
;;                                  ("4" . "$")
;;                                  ("5" . "%")
;;                                  ("6" . "^")
;;                                  ("7" . "&")
;;                                  ("8" . "*")
;;                                  ("9" . "(")
;;                                  ("-" . "_")
;;                                  ))

;; (defun dpb/key-chord-clear ()
;;     (mapcar (lambda (tu)
;;               (key-chord-define-global
;;                (concat (car tu) (car tu)) nil))
;;             dpb/key-chord-symbol-map))

;; (mapcar (lambda (tu)
;;           (key-chord-define-global
;;            (concat (car tu) (car tu)) (cdr tu)))
;;         dpb/key-chord-symbol-map)

;; (defun disable-key-chord-mode ()
;;   (set (make-local-variable 'input-method-function) nil))

;; (add-hook 'minibuffer-setup-hook #'disable-key-chord-mode)

(require 'unbound)
