



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren-on-screen t)
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(browse-url-text-browser "eww-browse-url")
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(coffee-args-compile (quote ("-c" "--bare")))
 '(coffee-tab-width 2)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(display-buffer-reuse-frames t)
 '(exec-path
   (quote
    ("/Users/dougbeal/bin" "/Users/dougbeal/sbin" "/usr/local/bin" "/usr/local/sbin" "/usr/local/opt/ruby/bin" "/usr/local/share/python" "/usr/local/share/npm/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/X11R6/bin" "/opt/local/bin")))
 '(flycheck-completion-system (quote grizzl))
 '(frame-background-mode (quote dark))
 '(haml-indent-offset 4)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-ubiquitous-mode t)
 '(indent-tabs-mode nil)
 '(inverse-video t)
 '(longlines-show-hard-newlines nil)
 '(longlines-wrap-follows-window-size t)
 '(mediawiki-site-default "Cine")
 '(message-log-max 1000)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(org-agenda-files (quote ("~/Google Drive/orgmode/")))
 '(org-default-notes-file "~/org/.notes")
 '(org-default-priority 71)
 '(org-directory "~/Google Drive/orgmode/")
 '(org-export-html-tag-class-prefix "orgtag")
 '(org-export-html-todo-kwd-class-prefix "orgtodo")
 '(org-export-html-validation-link "")
 '(org-hierarchical-todo-statistics nil)
 '(org-id-link-to-org-use-id t)
 '(org-link-search-must-match-exact-headline nil)
 '(org-link-to-org-use-id t)
 '(org-log-done (quote time))
 '(org-log-redeadline (quote time))
 '(org-log-refile (quote time))
 '(org-log-reschedule (quote time))
 '(org-lowest-priority 90)
 '(org-mobile-directory "~/org/mobile")
 '(org-mobile-encryption-tempfile "~/org/mobile/orgtmpcrypt")
 '(org-mobile-files
   (quote
    (org-agenda-files org-agenda-text-search-extra-files)))
 '(org-mobile-inbox-for-pull "~/org/inbox.org")
 '(org-mobile-use-encryption t)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 7))))
 '(org-refile-use-cache t)
 '(org-refile-use-outline-path (quote file))
 '(org-tab-follows-link t)
 '(org-todo-keyword-faces (quote (("FAIL" . "red") ("ERROR" . "red"))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NOW(n!)" "OPEN(o!)" "|" "DONE(d!)" "ABANDONED(a@)"))))
 '(org-track-ordered-property-with-tag t)
 '(osx-browse-prefer-background t)
 '(package-selected-packages
   (quote
    (package-build frame-purpose nginx-mode flymake-easy flymake-json flymake-yaml web-mode hideshowvis powershell csv-mode docker docker-api dockerfile-mode pymacs yaml-mode xml-rpc ws-butler w3m visual-regexp-steroids virtualenv undo-tree unbound swift-mode smex sass-mode ruby-interpolation rspec-mode rinari quelpa pylint php-mode paredit-menu osx-plist nose nav markdown-mode+ magit load-dir key-chord js2-mode jekyll-modes jedi idomenu highlight-parentheses help-fns+ handlebars-sgml-mode handlebars-mode grizzl google-this go-snippets go-complete gist flycheck-color-mode-line flx-ido expand-region erefactor emojify elnode edit-server-htmlize dsvn docker-tramp dash-at-point company-sourcekit company-go coffee-mode bug-hunter browse-kill-ring apples-mode apache-mode)))
 '(password-cache-expiry 600)
 '(persp-mode t)
 '(py-honor-comment-indentation nil)
 '(py-python-command "python2.6")
 '(python-indent-offset 2)
 '(python-python-command "python2.6")
 '(rcirc-authinfo nil)
 '(rcirc-bright-nicks
   (quote
    ("imyke" "dowdyism" "dmoren" "caseyliss" "jasonsnell" "ticci" "ismh" "Marco\\" "SamTheGeek" "ATPTipster" "thebaron66" "afwaller" "anexstacy" "slade401" "MrsSoup" "Pastaboy" "joesteel" "jsiracusa" "PenAddict")))
 '(rcirc-default-full-name "Douglas Beal")
 '(rcirc-default-user-name "dougbeal")
 '(rcirc-fill-column nil)
 '(rcirc-log-flag t)
 '(rcirc-log-process-buffers t)
 '(rcirc-omit-responses (quote ("JOIN" "PART" "QUIT" "NICK" "MODE +v")))
 '(rcirc-omit-threshold 1)
 '(rcirc-scroll-show-maximum-output t)
 '(rcirc-track-minor-mode t)
 '(safe-local-variable-values
   (quote
    ((esversion . 6)
     (c-indent-level . 2)
     (eval ignore-errors
           (push
            (quote
             ("Tests" "(\\(\\<ert-deftest\\)\\>\\s *\\(\\(?:\\sw\\|\\s_\\)+\\)?" 2))
            imenu-generic-expression)
           (when
               (string-match-p "test"
                               (buffer-file-name))
             (setq emojify-inhibit-emojify-in-current-buffer-p t)))
     (encoding . utf-8))))
 '(sass-indent-offset 4)
 '(sgml-basic-offset 4)
 '(sh-shell-file "/bin/bash")
 '(shell-command-default-error-buffer nil t)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(smerge-command-prefix (kbd "M-RET"))
 '(sourcekit-verbose t)
 '(standard-indent 4)
 '(tex-shell-file-name nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(tramp-auto-save-directory "~/.emacs.d/.emacs-tramp-autosave" nil (tramp))
 '(tramp-default-method "ssh" nil (tramp))
 '(tramp-default-user "dougbeal" nil (tramp))
 '(tramp-verbose 10 nil (tramp))
 '(transient-mark-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(visual-basic-mode-indent 4)
 '(w3m-confirm-leaving-secure-page nil)
 '(w3m-default-display-inline-images t)
 '(w3m-default-save-directory "~/Downloads")
 '(w3m-new-session-url "about://bookmark/")
 '(w3m-pop-up-windows nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil \.\.\.))))
 '(paren-face-match-light ((((class color)) (:background "gray15" :inverse-video nil))))
 '(smerge-refined-change ((t (:background "grey10"))) t))

; '(url-proxy-services (quote (("http" . "proxy:8888"))))
