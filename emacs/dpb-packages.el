;; based on https://github.com/mknittig/emacs-config/blob/master/elpa.el
(load "package.el")
(package-initialize)
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
			 'nose
			 'coffee-mode
			 'flymake
			 'flymake-coffee
			 'flymake-css
                         'dsvn
			 'virtualenv
                         'php-mode
			  'gist
			  'css-mode
                          'markdown-mode
                          'markdown-mode+
			  'highlight-80+
			  'highlight-parentheses
			  'inf-ruby
			  'js2-mode
			  'json
			  'jump
			  'nav
			  'nxml
			  'rinari
			  'ruby-compilation
			  'ruby-mode
			  'xml-rpc
			  'apache-mode
			  'yasnippet-bundle
                          )
  "Libraries that should be installed by default.")

(defun elpa-install (list)
  "Install all packages that aren't installed."
  (interactive)
  (dolist (package list)
    (unless (or (member package package-activated-list)
		(package-built-in-p package)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(package-refresh-contents)
(elpa-install packages-default)
(elpa-install packages-development)
