;; based on https://github.com/mknittig/emacs-config/blob/master/elpa.el
;;(load "package.el")
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") )
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") )
;;(add-to-list 'package-archives 
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))



(defvar packages-default (list
                          'auto-complete
                          'dash
                          'edit-server
                          'edit-server-htmlize
                          'emojify
                          'epl
                          'flx
                          'flx-ido
                          'google-this
                          'grizzl
                          'help-fns+
                          'idomenu
                          'key-chord
                          'load-dir
                          'magit
                          'org
                          'smex
                          'unbound
                          'w3m
)
  "Libraries that should be installed by default.")

(defvar packages-development (list
                              'apache-mode
                              'apples-mode
                              'coffee-mode 
                              'css-mode
                              'dsvn
                              'elnode
                              'erefactor
                              'flycheck
                              'flycheck-coffee
                              'flycheck-color-mode-line
                              'gist
                              'go-mode
                              'highlight-parentheses
                              'inf-ruby
                              'jedi
                              'jekyll-modes
                              'js2-mode
                              'json
                              'jump
                              'markdown-mode
                              'markdown-mode+
                              'nav
                              'nose
                              'nxml
                              'osx-plist
                              'paredit
                              'paredit-menu
                              'php-mode
                              'pylint
                              'pymacs
                              'rinari
                              'ruby-compilation
                              'ruby-mode
                              'sass-mode
                              'swift-mode
                              'virtualenv
                              'visual-regexp
                              'visual-regexp-steroids
                              'ws-butler
                              'xml-rpc
                              'yaml-mode
                              )
  "Libraries for development that should be installed by default.")


                          ;; 'ido-better-flex
                          ;; 'ido-ubiquitous
                          ;; 'ido-yes-or-no
;;                              'yasnippet-bundle

(defun elpa-install (list)
  "Install all packages that aren't installed."
  (interactive)
  (dolist (package list)
    (unless (or (member package package-activated-list)
                (package-built-in-p package)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (condition-case err
          (package-install package)
        (error
         (setq message-log-max t)
         (message "error: %s" (error-message-string err)))))))

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors "ERROR during init %s" (package-refresh-contents))))
(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors "ERROR during init %s" (elpa-install packages-default))))

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors "ERROR during init %s" (elpa-install packages-development))))



(require 'cl-lib)
(defun dpb-missing-packages ()
  "List packages that are installed but missing from lists."
  (delete-dups
   (set-difference  (set-difference package-activated-list packages-default) 
                    packages-development)))
(message "Installed packages not in packages list: %s" (dpb-missing-packages))
