;; based on https://github.com/mknittig/emacs-config/blob/master/elpa.el
(load "package.el")
(package-initialize)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))



(defvar packages-default (list
			  'load-dir
			  'org
			  'melpa
			  'magit
			  'auto-complete
                          'ido-better-flex
                          'ido-ubiquitous
                          'ido-yes-or-no
                          'idomenu
                          'smex
)
  "Libraries that should be installed by default.")

(defvar packages-development (list
                              'apache-mode
                              'coffee-mode
                              'css-mode
                              'dsvn
                              'erefactor
                              'flymake
                              'flymake-coffee
                              'flymake-css
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
                              'visual-regex
                              'visual-regex-steroids
                              'xml-rpc
                              'yaml-mode
                              'yasnippet-bundle
                              )
  "Libraries for development that should be installed by default.")

(defun elpa-install (list)
  "Install all packages that aren't installed."
  (interactive)
  (dolist (package list)
    (unless (or (member package package-activated-list)
		(package-built-in-p package)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(with-demoted-errors (package-refresh-contents))
(with-demoted-errors (elpa-install packages-default))
(with-demoted-errors (elpa-install packages-development))
