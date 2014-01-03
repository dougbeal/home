(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun custom-persp/org ()
  (interactive)
  (custom-persp "@org"
                (find-file (first org-agenda-files))))

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "@emacs"
                (find-file (first (expand-file-name "~/.emacs")))
                )
  )
