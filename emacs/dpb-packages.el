;; based on https://github.com/mknittig/emacs-config/blob/master/elpa.el
;;(load "package.el")
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))



(defvar packages-default (list
                          'auto-complete
                          'dash
                          'flx
                          'flx-ido
                          'google-this
                          'grizzl
                          'idomenu
                          'load-dir
                          'magit
                          'melpa
                          'org
                          'smex
)
  "Libraries that should be installed by default.")

(defvar packages-development (list
                              'apache-mode
                              'apples-mode
                              'coffee-mode 
                              'css-mode
                              'css-mode
                              'dsvn
                              'erefactor
                              'flycheck
                              'flycheck-color-mode-line
                              'gist
                              'highlight-80+
                              'highlight-parentheses
                              'inf-ruby
                              'jedi
                              'js2-mode
                              'json
                              'jump
                              'markdown-mode
                              'markdown-mode+
                              'nav
                              'nose
                              'nxml
                              'paredit
                              'paredit-menu
                              'php-mode
                              'pylint
                              'pymacs
                              'rinari
                              'ruby-compilation
                              'ruby-mode
                              'virtualenv
                              'visual-regexp
                              'visual-regexp-steroids
                              'w3m
                              'xml-rpc
                              'yaml-mode

                              )
  "Libraries for development that should be installed by default.")


                              ;; 'flymake
                              ;; 'flymake-coffee
                              ;; 'flymake-jslint
                              ;; 'flymake-jshint
                              ;; 'flymake-json
                              ;; 'flymake-python
                              ;; 'flymake-ruby
                              ;; 'flymake-shell
                              ;; 'flymake-css
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

(with-demoted-errors (package-refresh-contents))
(with-demoted-errors (elpa-install packages-default))
(with-demoted-errors (elpa-install packages-development))


(require 'cl)
(message "Installed packages not in packages list: %s" 
         (delete-dups
          (set-difference  (set-difference package-activated-list packages-default) 
                           packages-development)))
