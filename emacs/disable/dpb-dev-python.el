(require 'nose2)
(require 'python)

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

                                        ;(autoload 'python-mode "my-python-mode" "" t )
;(autoload 'python-mode "dpb-python-load-hook" "" t )
                                        ;(add-hook 'python-mode-hook 'jedi:setup)
;; (pymacs-load "ropemacs" "rope-")

(setq nose2-project-root-files '(".test_project_root"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  514  pip install rope ropemacs
;;  515  pip install -e "git+https://github.com/pinard/Pymacs.git#egg=Pymacs"

(eval-after-load "pymacs" '(progn
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/rope"))
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/ropemode"))
                             (add-to-list 'pymacs-load-path (expand-file-name "~/lib/emacs/ropemacs"))
                             )
                 )

(eval-after-load "python-mode"
  '(progn
     (load-ropemacs)))
(add-to-list 'nose2-project-names "")
(provide 'dpb-dev-python)
