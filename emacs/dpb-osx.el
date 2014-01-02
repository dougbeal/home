;; shouldn't be necessary with /etc/paths setup properly
;; read in PATH from .bashrc
;; (if (not (getenv "TERM_PROGRAM"))
;;     (setenv "PATH"
;;             (shell-command-to-string "source $HOME/.profile && printf $PATH")))
;; (if (not (getenv "TERM_PROGRAM"))
;;     (setenv "PYTHONPATH"
;;             (shell-command-to-string "source $HOME/.profile && printf $PYTHONPATH")))
