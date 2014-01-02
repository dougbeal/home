
(require 'auto-complete-config)
(require 'tramp)
;(require 'list-register)
;(require 'buff-menu+) 
(require 'uniquify)

(if (and 
     (locate-library "edit-server")
     (display-graphic-p))
    (progn
      (require 'edit-server)
      (setq edit-server-new-frame nil)
      (edit-server-start)))

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;(add-hook 'ibuffer-mode-hook
;  (lambda ()
;    (ibuffer-switch-to-saved-filter-groups "default")))

(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
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

(require 'ido)
;(require 'ido-ubiquitous)
(require 'ido-yes-or-no)
(require 'ido-better-flex)
(ido-mode 'both)

(require 'smex)
(smex-initialize)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
