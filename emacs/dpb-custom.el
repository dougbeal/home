



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
 '(completion-auto-help (quote lazy))
 '(desktop-path (quote ("~/.emacs.d/")))
 '(display-buffer-reuse-frames t)
 '(emojify-display-style (quote image))
 '(emojify-emoji-styles (quote (github unicode)))
 '(exec-path
   (quote
    ("/usr/bin" "/Users/dougbeal/bin" "/Users/dougbeal/sbin" "/usr/local/bin" "/usr/local/sbin" "/usr/local/opt/ruby/bin" "/usr/local/share/python" "/usr/local/share/npm/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/X11R6/bin" "/opt/local/bin" "/Users/dougbeal/go/bin")))
 '(flycheck-completion-system (quote grizzl))
 '(frame-background-mode (quote dark))
 '(haml-indent-offset 4)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-ubiquitous-mode t)
 '(indent-tabs-mode nil)
 '(inverse-video t)
 '(ledger-reports
   (quote
    (("accounts" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
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
    (bazel-mode toml toml-mode mediawiki go-dlv unfill request-deferred python-mode zones yaml-mode xml-rpc ws-butler web-mode w3m visual-regexp-steroids virtualenv use-package urlenc undo-tree unbound swift-mode smex sass-mode ruby-interpolation rspec-mode rinari quelpa pylint powershell php-mode paredit-menu package-build osx-plist nose nginx-mode nav markdown-mode+ magit lv load-dir ledger-import js2-mode jekyll-modes jedi idomenu highlight-parentheses hideshowvis help-fns+ handlebars-sgml-mode handlebars-mode grizzl google-this go-tag go-snippets go-complete gist ghub frame-purpose flymake-yaml flymake-json flycheck-color-mode-line flx-ido expand-region erefactor emojify elnode edit-server-htmlize dsvn dockerfile-mode docker-api docker dash-at-point csv-mode company-sourcekit company-go coffee-mode bug-hunter browse-kill-ring apples-mode apache-mode)))
 '(password-cache-expiry 600)
 '(persp-mode t)
 '(py-honor-comment-indentation nil)
 '(py-python-command "python2.6")
 '(python-indent-offset 4)
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
 '(rcirc-omit-responses
   (quote
    ("JOIN" "PART" "QUIT" "NICK" "MODE +v" "MODE" "KICK")))
 '(rcirc-omit-threshold 1)
 '(rcirc-scroll-show-maximum-output t)
 '(rcirc-track-minor-mode t)
 '(safe-local-variable-values
   (quote
    ((c-style-alist
      ("ledger"
       (indent-tabs-mode)
       (c-basic-offset . 2)
       (c-comment-only-line-offset 0 . 0)
       (c-hanging-braces-alist
        (substatement-open before after)
        (arglist-cont-nonempty))
       (c-offsets-alist
        (statement-block-intro . +)
        (knr-argdecl-intro . 5)
        (substatement-open . 0)
        (substatement-label . 0)
        (label . 0)
        (case-label . 0)
        (statement-case-open . 0)
        (statement-cont . +)
        (arglist-intro . +)
        (arglist-close . +)
        (inline-open . 0)
        (brace-list-open . 0)
        (topmost-intro-cont first c-lineup-topmost-intro-cont c-lineup-gnu-DEFUN-intro-cont))
       (c-special-indent-hook . c-gnu-impose-minimum)
       (c-block-comment-prefix . "")))
     (engine . go)
     (esversion . 6)
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
 '(tramp-auto-save-directory "~/.emacs.d/.emacs-tramp-autosave")
 '(tramp-default-method "ssh")
 '(tramp-default-user "dougbeal")
 '(tramp-verbose 10)
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
