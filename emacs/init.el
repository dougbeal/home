;; Set the debug option to enable a backtrace when a
;; problem occurs.

(setq debug-on-error t)
(setq redisplay-dont-pause t)

;    
;     File:   /u3/ccmproc2/emacs/safe-load.el  (939 bytes) 
;     Date:   Tue Dec  1 09:26:25 1992
;     Author: Lawrence Buja <ccmproc2@sunny>
;    
(defvar safe-load-error-list ""
        "*List of files that reported errors when loaded via safe-load")

(defun safe-load (file &optional noerror nomessage nosuffix)
  "Load a file.  If error when loading, report back, wait for
   a key stroke then continue on"
  (interactive "f")
  (condition-case nil (load file noerror nomessage nosuffix) 
    (error 
      (progn 
       (setq safe-load-error-list  (concat safe-load-error-list  " " file))
       (message "****** [Return to continue] Error loading %s" safe-load-error-list )
        (sleep-for 1)
       nil))))

(defun safe-load-check ()
 "Check for any previous safe-load loading errors.  (safe-load.el)"
  (interactive)
  (if (string-equal safe-load-error-list "") () 
               (message (concat "****** error loading: " safe-load-error-list))))

;---end   of safe-load.el ----------snip---------------snip-----------snip-------------
 ;; -*- coding: utf-8 -*-
;; 2007-06, 2012-04-06
;; http://xahlee.org/emacs/xah_emacs_init.html
;; https://github.com/xahlee/xah_emacs_init


;; § ----------------------------------------
; loading custom commands and functions

(defun fullpath-relative-to-current-file (file-relative-path)
  "Returns the full path of FILE-RELATIVE-PATH, relative to file location where this function is called.

Example: If you have this line
 (fullpath-relative-to-current-file \"../xyz.el\")
in the file at
 /home/mary/emacs/emacs_lib.el
then the return value is
 /home/mary/xyz.el
Regardless how or where emacs_lib.el is called.

This function solves 2 problems.

 ① If you have file A, that calls the `load' on a file at B, and
B calls “load” on file C using a relative path, then Emacs will
complain about unable to find C. Because, emacs does not switch
current directory with “load”.

 To solve this problem, when your code only knows the relative
path of another file C, you can use the variable `load-file-name'
to get the current file's full path, then use that with the
relative path to get a full path of the file you are interested.

 ② To know the current file's full path, emacs has 2 ways:
`load-file-name' and `buffer-file-name'.  If the file is loaded
by “load”, then load-file-name works but buffer-file-name
doesn't.  If the file is called by `eval-buffer', then
load-file-name is nil. You want to be able to get the current
file's full path regardless the file is run by “load” or
interactively by “eval-buffer”."
  (concat (file-name-directory (or load-file-name buffer-file-name)) file-relative-path)
)

; end xahlee

;; disable safe-load for debugging
(defun safe-load (file &optional noerror nomessage nosuffix)
  (load file noerror nomessage nosuffix))


;; add ./development for elisp currently in development
(push (fullpath-relative-to-current-file "development") load-path)

(require 'edebug)
(setq edebug-trace t)
(edebug-trace "tracing")

(setq custom-file (fullpath-relative-to-current-file "dpb-custom.el"))
(load custom-file)

(load (fullpath-relative-to-current-file "dpb-packages.el"))

(safe-load (fullpath-relative-to-current-file "dpb-appearance.el"))
(when (equal system-type 'windows-nt) 
  (load (fullpath-relative-to-current-file "dpb-windows.el")))
(when (equal system-type 'darwin)  
  (load (fullpath-relative-to-current-file "dpb-osx.el")))

(safe-load (fullpath-relative-to-current-file "dpb-development.el"))
(safe-load (fullpath-relative-to-current-file "dpb-emacs.el"))
(safe-load (fullpath-relative-to-current-file "dpb-org.el"))
(safe-load (fullpath-relative-to-current-file "dpb-keybindings.el"))
(safe-load (fullpath-relative-to-current-file "dpb-perspective.el"))



(setenv "PYMACS_PYTHON" "python2.7")

(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)


(safe-load-check)
(setq debug-on-error nil)
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/lib/emacs/elpa/package.el"))
;;   (package-initialize))
;; (put 'narrow-to-defun 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
