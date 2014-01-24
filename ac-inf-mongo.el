;; Enable using:
;;
;; (require 'ac-inf-mongo)
;; (eval-after-load 'auto-complete
;;   '(add-to-list 'ac-modes 'inf-mongo-mode))
;; (add-hook 'inf-mongo-mode-hook 'ac-inf-mongo-enable)

;;; Code:

(require 'inf-mongo)
(require 'auto-complete)

(defun ac-inf-mongo-candidates ()
  (inf-mongo-get-completions-at-point ac-prefix))

(defun ac-inf-mongo-prefix ()
  (save-excursion
    (skip-syntax-backward ".w_")
    (point)))

(defun ac-inf-mongo-available ()
  (eq 'inf-mongo-mode major-mode))

(defvar ac-source-inf-mongo
  '((available . ac-inf-mongo-available)
    (candidates . ac-inf-mongo-candidates)
    (symbol . "r")
    (prefix . ac-inf-mongo-prefix)))

;;;###autoload
(defun ac-inf-mongo-enable ()
  (make-local-variable 'ac-sources)
  (add-to-list 'ac-sources 'ac-source-inf-mongo))

(provide 'ac-inf-mongo)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; ac-inf-mongo.el ends here
