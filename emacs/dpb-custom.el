(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren-on-screen t)
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(desktop-path (quote ("~/.emacs.d/")))
 '(display-buffer-reuse-frames t)
 '(exec-path (quote ("/opt/local/bin" "/opt/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin" "/usr/X11R6/bin" "/opt/local/bin")))
 '(frame-background-mode (quote dark))
 '(ibuffer-saved-filter-groups (quote (("default" ("svn.ThirdParty.Tractor Source" (filename . "Source/Tractor")) ("svn.Engineering.config" (filename . "Source/Engineering/config")) ("svn.Engineering.script" (filename . "Source/Engineering/script")) ("svn.Engineering" (filename . "Source/Engineering")) ("svn.dev.Python.Tractor" (filename . "Source/dev/Bfd/Libs/Python/BFD/lib/Tractor")) ("svn.dev.ThirdParty.Tractor" (filename . "Source/dev/ThirdParty/Apps/Tractor")) ("svn.dev" (filename . "Source/dev")) ("unixAdmin" (filename . "/corp.blizzard.net/BFD/unixAdmin")) ("org-mode" (mode . org-mode)) ("pipetest.dbeal" (filename . "BFD/Projects/pipetest") ("completion-list-mode" (mode . completion-list-mode))) ("mode" ("Custom-mode" (mode . Custom-mode)) ("emacs-lisp-mode" (mode . emacs-lisp-mode)) ("occur-mode" (mode . occur-mode)) ("python-mode" (mode . python-mode)) ("fundamental-mode" (mode . fundamental-mode)) ("sh-mode" (mode . sh-mode)) ("help-mode" (mode . help-mode)) ("dired-mode" (mode . dired-mode)) ("org-mode" (mode . org-mode)) ("svn-status-diff-mode" (mode . svn-status-diff-mode)) ("svn-status-mode" (mode . svn-status-mode)) ("Info-mode" (mode . Info-mode)) ("org-agenda-mode" (mode . org-agenda-mode)) ("svn-info-mode" (mode . svn-info-mode)) ("awk-mode" (mode . awk-mode)) ("html-mode" (mode . html-mode)) ("calc-mode" (mode . calc-mode)) ("grep-mode" (mode . grep-mode)) ("lisp-interaction-mode" (mode . lisp-interaction-mode)) ("calendar-mode" (mode . calendar-mode)) ("tcl-mode" (mode . tcl-mode)) ("conf-space-mode" (mode . conf-space-mode)) ("conf-unix-mode" (mode . conf-unix-mode)) ("conf-xdefaults-mode" (mode . conf-xdefaults-mode)) ("perl-mode" (mode . perl-mode)) ("conf-colon-mode" (mode . conf-colon-mode)) ("text-mode" (mode . text-mode)) ("wisent-grammar-mode" (mode . wisent-grammar-mode)) ("sgml-mode" (mode . sgml-mode)) ("c++-mode" (mode . c++-mode)) ("outline-mode" (mode . outline-mode)) ("calc-trail-mode" (mode . calc-trail-mode)) ("completion-list-mode" (mode . completion-list-mode)))))))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-ubiquitous-mode t)
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
 '(org-log-done (quote time) t)
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
 '(visual-basic-mode-indent 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil \.\.\.))))
 '(paren-face-match-light ((((class color)) (:background "gray15" :inverse-video nil))))
 '(smerge-refined-change ((t (:background "grey10")))))

; '(url-proxy-services (quote (("http" . "proxy:8888"))))
