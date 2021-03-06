
(require 'dsvn)
(require 'vc-svn)
(require 'magit)
;(require 'w3m-load)
;(require 'visual-basic-mode)
(require 'php-mode)

(require 'github-issues)
(require 'ws-butler)





(autoload 'apache-mode "apache-mode" nil t)
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)

(autoload 'mel-mode "mel-mode" "Mel mode" t )
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("tractor\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . cheetah-alf-mode ))
(add-to-list 'auto-mode-alist '("\\.j\\'" . javascript-mode ))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(append '("\\.mel\\'" . 'mel-mode) auto-mode-alist)
(append '("\\.alf\\'" . 'tcl-mode) auto-mode-alist)
(append '("\\.applescript$" . 'applescript-mode) auto-mode-alist)


;(load-file "~/lib/emacs/django-html-mode.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; BEGIN CEDET
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;(load-file "~/lib/emacs/cedet/common/cedet.el")


;; Enable EDE (Project Management) features
;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END CEDET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'erefactor)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (define-key emacs-lisp-mode-map (kbd "C-c C-v") erefactor-map)))


;;And set these variables correctly.
 `erefactor-lint-path-alist', `erefactor-lint-by-emacsen'

;; Put the following in your .emacs, if you desire highlighting local variable.

(add-hook 'emacs-lisp-mode-hook 'erefactor-lazy-highlight-turn-on)
(add-hook 'lisp-interaction-mode-hook 'erefactor-lazy-highlight-turn-on)


(add-hook 'emacs-lisp-mode-hook 'ws-butler-mode)




(require 'atomic-chrome)
(atomic-chrome-start-server)

(setq inferior-js-program-command "node --interactive") ;; run-js
(setenv "NODE_NO_READLINE" "1")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))


;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing tabs space-before-tab indentation empty space-after-tab))

(add-hook 'coffee-mode-hook
          '(lambda ()
             (define-key coffee-mode-map (kbd "C-c <") 'coffee-indent-shift-left)
             (define-key coffee-mode-map (kbd "C-c >") 'coffee-indent-shift-right)
             (whitespace-mode 't)
             ))

(add-hook 'coffee-mode-hook 'ws-butler-mode)

(autoload 'apples-mode "apples-mode" "Happy AppleScripting!" t)
(autoload 'apples-open-scratch "apples-mode" "Open scratch buffer for AppleScript." t)
(add-to-list 'auto-mode-alist '("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode))

(require 'flycheck) 
(add-to-list 'load-path (expand-file-name "~/git/swift-mode"))
(add-to-list 'auto-mode-alist '("\\.swift$" . swift-mode))
(add-to-list 'flycheck-checker 'swift)
(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3"))

(require 'company-sourcekit)
(add-to-list 'company-backends 'company-sourcekit)
(add-hook 'after-init-hook 'global-company-mode)
;(add-to-list 'dash-at-point-mode-alist '(swift-mode . "swift iOS"))
                                        ;(add-to-list 'dash-at-point-mode-alist '(ruby-mode . "ruby"))


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.liquid\\'" . web-mode))

(require 'js-mode)
(add-to-list 'auto-mode-alist '("\\.omnijs\\'". js-mode))

(add-to-list 'auto-mode-alist '("go.mod\\'" . go-mode))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'dpb-development)
;;; dpb-development.el ends here (emacs-lisp-checkdoc)
