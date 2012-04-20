(require 'nose)
(require 'python)
(require 'dsvn)
(require 'vc-svn)
(require 'magit)
;(require 'w3m-load)
;(require 'visual-basic-mode)
(require 'php-mode)

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
(append '("\\.mel\\'" . 'mel-mode) auto-mode-alist)
(append '("\\.alf\\'" . 'tcl-mode) auto-mode-alist)
(append '("\\.applescript$" . 'applescript-mode) auto-mode-alist)
;; (pymacs-load "ropemacs" "rope-")

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
(add-to-list 'nose-project-names "")
