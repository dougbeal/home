

;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)
(setq redisplay-dont-pause t)

;; read in PATH from .bashrc
(if (not (getenv "TERM_PROGRAM"))
    (setenv "PATH"
            (shell-command-to-string "source $HOME/.profile && printf $PATH")))
(if (not (getenv "TERM_PROGRAM"))
    (setenv "PYTHONPATH"
            (shell-command-to-string "source $HOME/.profile && printf $PYTHONPATH")))

(setenv "PYMACS_PYTHON" "python2.6")

(add-to-list 'load-path (expand-file-name "~/lib/emacs"))
(add-to-list 'load-path (expand-file-name "~/bin"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/cedet"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/org-mode/lisp"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/org-mode/contrib/lisp"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/emacs-w3m"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/pymacs"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/nosemacs"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/auto-complete"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/tramp-2.2.2/lisp"))

(require 'buff-menu+)
(require 'nose)
(require 'auto-complete-config)
;(require 'pymacs)
;(require 'perspective)
(require 'tramp)
(require 'list-register)

(if (and 
     (locate-library "edit-server")
     (display-graphic-p))
    (progn
      (require 'edit-server)
      (setq edit-server-new-frame nil)
      (edit-server-start)))

;; (require 'psvn)
(require 'dsvn)
(require 'vc-svn)
(require 'mediawiki)
(require 'uniquify)
(require 'w3m-load)

(require 'visual-basic-mode)
(require 'php-mode)
(require 'org-install)
(require 'python)

;(load "package")
;(package-initialize)




(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\M-`" 'other-frame )
(define-key python-mode-map (kbd "C-x a") 'nosetests-all)
(define-key python-mode-map (kbd "C-x m") 'nosetests-module)
(global-set-key (kbd "C-x r v") 'list-register)





;; (global-set-key (kbd "C-x C-b") 'ibuffer)


(setq ropemacs-enable-shortcuts nil)
(setq ropemacs-local-prefix "C-c C-p")


(defun ac-ropemacs-setup ()
  (ac-ropemacs-require)
  ;(setq ac-sources (append (list 'ac-source-ropemacs) ac-sources))
  (setq ac-omni-completion-sources '(("\\." ac-source-ropemacs))))

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  (require 'pymacs)
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t)
  (ac-ropemacs-setup)
  (ropemacs-mode t)
  (pymacs-load "ropemacs" "rope-")
  ;; Automatically save project python buffers before refactorings
  (setq ropemacs-confirm-saving 'nil)
  )

(define-derived-mode cheetah-alf-mode tcl-mode "Cheetah"
  (make-face 'cheetah-alf-variable-face)
  (font-lock-add-keywords
   nil
   '(
     ("\\(#\\(from\\|else\\|include\\|extends\\|set\\|def\\|import\\|for\\|if\\|end\\)+\\)\\>" 1 font-lock-type-face)
     ("\\(#\\(from\\|for\\|end\\)\\).*\\<\\(for\\|import\\|def\\|if\\|in\\)\\>" 3 font-lock-type-face)
     ("\\(##.*\\)\n" 1 font-lock-comment-face)
     ("\\(\\$\\(?:\\sw\\|}\\|{\\|\\s_\\)+\\)" 1 font-lock-variable-name-face))
   )
  (font-lock-mode 1)
  )




(autoload 'apache-mode "apache-mode" nil t)
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
;(autoload 'python-mode "my-python-mode" "" t ) 
(autoload 'mel-mode "mel-mode" "Mel mode" t )

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("tractor\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . cheetah-alf-mode ))
(add-to-list 'auto-mode-alist '("\\.j\\'" . javascript-mode ))
(append '("\\.mel\\'" . 'mel-mode) auto-mode-alist)
(append '("\\.alf\\'" . 'tcl-mode) auto-mode-alist)
(append '("\\.applescript$" . 'applescript-mode) auto-mode-alist)


(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(add-to-list 'nose-project-names "")

(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))




;; (pymacs-load "ropemacs" "rope-")




;(persp-mode)


(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun custom-persp/org ()
  (interactive)
  (custom-persp "@org"
                (find-file (first org-agenda-files))))

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "@emacs"
                (find-file (first (expand-file-name "~/.emacs")))
                )
  )



(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

;(add-hook 'org-after-refile-insert-hook
;          ())

(setq org-log-done t)

;;(setq org-directory "~/org")
;;(setq org-agenda-files (quote ("~/org/agenda.org"))
;;(setq org-mobile-inbox-for-pull "~/org/inbox.org")
;;(setq org-mobile-directory "~/org/mobile")


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

(if (display-graphic-p)
    (progn
      (global-set-key (kbd "C-z") nil)
      (require 'desktop)
      (add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))
      (setq desktop-restore-eager 50)
      (setq desktop-save-mode t)
      (server-start)
      )
  )

(setq nose-project-root-files '(".test_project_root"))

(eval-after-load "pymacs" '(progn
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/rope"))
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/ropemode"))
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/ropemacs"))
                             )
                 )

(eval-after-load "python-mode"
  '(progn
     (load-ropemacs)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren-on-screen t)
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(desktop-path (quote ("/home/dbeal" "." "~")))
 '(display-buffer-reuse-frames t)
 '(exec-path (quote ("/opt/local/bin" "/opt/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin" "/usr/X11R6/bin" "/opt/local/bin")))
 '(frame-background-mode (quote dark))
 '(ibuffer-saved-filter-groups (quote (("default" ("svn.ThirdParty.Tractor Source" (filename . "Source/Tractor")) ("svn.Engineering.config" (filename . "Source/Engineering/config")) ("svn.Engineering.script" (filename . "Source/Engineering/script")) ("svn.Engineering" (filename . "Source/Engineering")) ("svn.dev.Python.Tractor" (filename . "Source/dev/Bfd/Libs/Python/BFD/lib/Tractor")) ("svn.dev.ThirdParty.Tractor" (filename . "Source/dev/ThirdParty/Apps/Tractor")) ("svn.dev" (filename . "Source/dev")) ("unixAdmin" (filename . "/corp.blizzard.net/BFD/unixAdmin")) ("org-mode" (mode . org-mode)) ("pipetest.dbeal" (filename . "BFD/Projects/pipetest") ("completion-list-mode" (mode . completion-list-mode))) ("mode" ("Custom-mode" (mode . Custom-mode)) ("emacs-lisp-mode" (mode . emacs-lisp-mode)) ("occur-mode" (mode . occur-mode)) ("python-mode" (mode . python-mode)) ("fundamental-mode" (mode . fundamental-mode)) ("sh-mode" (mode . sh-mode)) ("help-mode" (mode . help-mode)) ("dired-mode" (mode . dired-mode)) ("org-mode" (mode . org-mode)) ("svn-status-diff-mode" (mode . svn-status-diff-mode)) ("svn-status-mode" (mode . svn-status-mode)) ("Info-mode" (mode . Info-mode)) ("org-agenda-mode" (mode . org-agenda-mode)) ("svn-info-mode" (mode . svn-info-mode)) ("awk-mode" (mode . awk-mode)) ("html-mode" (mode . html-mode)) ("calc-mode" (mode . calc-mode)) ("grep-mode" (mode . grep-mode)) ("lisp-interaction-mode" (mode . lisp-interaction-mode)) ("calendar-mode" (mode . calendar-mode)) ("tcl-mode" (mode . tcl-mode)) ("conf-space-mode" (mode . conf-space-mode)) ("conf-unix-mode" (mode . conf-unix-mode)) ("conf-xdefaults-mode" (mode . conf-xdefaults-mode)) ("perl-mode" (mode . perl-mode)) ("conf-colon-mode" (mode . conf-colon-mode)) ("text-mode" (mode . text-mode)) ("wisent-grammar-mode" (mode . wisent-grammar-mode)) ("sgml-mode" (mode . sgml-mode)) ("c++-mode" (mode . c++-mode)) ("outline-mode" (mode . outline-mode)) ("calc-trail-mode" (mode . calc-trail-mode)) ("completion-list-mode" (mode . completion-list-mode)))))))
 '(indent-tabs-mode nil)
 '(inverse-video t)
 '(jira-url "http://irvut033:8090/bugger/rpc/xmlrpc ")
 '(longlines-show-hard-newlines nil)
 '(longlines-wrap-follows-window-size t)
 '(mediawiki-site-alist (quote (("Cine" "https://wiki.corp.blizzard.net/cinematics/index.php" "dbeal" "" "Engineering_Pipeline"))))
 '(mediawiki-site-default "Cine")
 '(message-log-max 1000)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(org-agenda-files (quote ("~/org/inbox.org" "~/org/health.org" "~/org/reviews.org" "~/org/meetings.org" "~/org/work.org" "~/org/home.org" "~/org/tractor.org" "~/org/siggraph2011.org" "~/org/siggraph2010.org" "~/org/tractor_test.org" "~/org/projects.org" "~/org/report_tractor_test_15rc2.org")))
 '(org-default-notes-file "~/org/.notes")
 '(org-default-priority 71)
 '(org-directory "~/org")
 '(org-export-html-tag-class-prefix "orgtag")
 '(org-export-html-todo-kwd-class-prefix "orgtodo")
 '(org-export-html-validation-link "")
 '(org-hierarchical-todo-statistics nil)
 '(org-link-search-must-match-exact-headline nil)
 '(org-link-to-org-use-id t)
 '(org-log-done (quote time))
 '(org-log-redeadline (quote time))
 '(org-log-refile (quote time))
 '(org-log-reschedule (quote time))
 '(org-lowest-priority 90)
 '(org-mobile-directory "~/org/mobile")
 '(org-mobile-encryption-password "snarkisagreedylittlekittycat")
 '(org-mobile-encryption-tempfile "~/org/mobile/orgtmpcrypt")
 '(org-mobile-files (quote (org-agenda-files org-agenda-text-search-extra-files)))
 '(org-mobile-inbox-for-pull "~/org/inbox.org")
 '(org-mobile-use-encryption t)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 7))))
 '(org-refile-use-cache t)
 '(org-refile-use-outline-path (quote file))
 '(org-tab-follows-link t)
 '(org-todo-keyword-faces (quote (("FAIL" . "red") ("ERROR" . "red"))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "OPEN(o!)" "|" "DONE(d!)" "ABANDONED(a@)"))))
 '(org-track-ordered-property-with-tag t)
 '(password-cache-expiry 600)
 '(persp-mode t)
 '(py-honor-comment-indentation nil)
 '(py-python-command "python2.6")
 '(python-python-command "python2.6")
 '(sh-shell-file "/bin/bash")
 '(shell-command-default-error-buffer nil t)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(smerge-command-prefix (kbd "M-RET"))
 '(standard-indent 4)
 '(tex-shell-file-name nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(tramp-auto-save-directory "/home/~dbeal/.emacs-tramp-autosave")
 '(tramp-default-method "scp")
 '(tramp-default-user "root")
 '(tramp-verbose 10)
 '(transient-mark-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(url-proxy-services (quote (("http" . "proxy:3128"))))
 '(visual-basic-mode-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil \.\.\.))))
 '(paren-face-match-light ((((class color)) (:background "gray15" :inverse-video nil))))
 '(smerge-refined-change ((t (:background "grey10")))))


(setq debug-on-error nil)
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/lib/emacs/elpa/package.el"))
;;   (package-initialize))
;; (put 'narrow-to-defun 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
