;;; core-gadgets.el --- Some gadgets
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; To use these gadgets, you must install corresponding program.

;;; Code:

;;------------------------------------------------------------------------------
;; Stardict(ensure stardict and sdcv are installed)
;;------------------------------------------------------------------------------
(defun kid-star-dict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (tooltip-show
     (shell-command-to-string
      (concat "sdcv -n "
              (buffer-substring begin end))))))
(global-set-key (kbd "C-c C-p") 'kid-star-dict)


(provide 'core-gadgets)
;;; core-gadgets.el ends here
