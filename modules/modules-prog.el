;;; modules-prog.el --- configs for programming
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Use flymake to check syntax, company to complete codes, yasnippet to
;; generate codes, projectil to manager projects, and git to control version.
;;

;;; Code:

;;------------------------------------------------------------------------------
;; Flymake
;;------------------------------------------------------------------------------
(require-package 'flymake-cursor)
(setq flymake-no-changes-timeout 600)


;;------------------------------------------------------------------------------
;; Yasnippet
;;------------------------------------------------------------------------------
(require-package 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" personal-dir))
(diminish 'yas-minor-mode)


;;------------------------------------------------------------------------------
;; Comanpy
;;------------------------------------------------------------------------------
(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)


;;------------------------------------------------------------------------------
;; Format codes
;;------------------------------------------------------------------------------
(defun indent-region-or-buffer ()
  "Indent a region if selected or the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end)))
      (progn
	(indent-region (point-min) (point-max))))))
(add-hook 'after-save-hook 'indent-region-or-buffer)


;;------------------------------------------------------------------------------
;; Projectil
;;------------------------------------------------------------------------------
(require-package 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)


;;------------------------------------------------------------------------------
;; Git
;;------------------------------------------------------------------------------
(require 'git-emacs)


(provide 'modules-prog)
;;; modules-prog.el ends here
