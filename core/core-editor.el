;;; core-editor.el --- enhanced core editing experience
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Refinements of the core editing experience in Emacs.

;;; Code:

;;------------------------------------------------------------------------------
;; Buffer
;;------------------------------------------------------------------------------
(delete-selection-mode t)
(global-auto-revert-mode t)

;; Ace jump mode
(require-package 'ace-jump-mode)
(global-set-key (kbd "M-g") 'ace-jump-mode)

;; Parentheses highlight and auto complement
(require-package 'mic-paren)
(paren-activate)
(require 'electric)
(electric-pair-mode t)

;; Set mark
(global-set-key (kbd "M-m") 'set-mark-command)

;; Use iedit mode
(require-package 'iedit)

;; use xsel to copy/paste in emacs-nox
(setq x-select-enable-clipboard t)
(unless window-system
  (when (getenv "DISPLAY")
    (defun xsel-cut-function (text &optional push)
      (with-temp-buffer
	(insert text)
	(call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
    (defun xsel-paste-function()
      (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
	(unless (string= (car kill-ring) xsel-output)
	  xsel-output )))
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)))

;; Cut/copy the current line if no region is active
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)

;; Time-stamp
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-format "%04y/%02m/%02d %02H:%02M:%02S");
(setq time-stamp-start "Updated: ")
(setq time-stamp-end "\n")


;;------------------------------------------------------------------------------
;; Echo area
;;------------------------------------------------------------------------------
(setq enable-recursive-minibuffers t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Ido
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-save-directory-list-file (expand-file-name ".ido.last" save-dir))

;; Smex
(require-package 'smex)
(setq smex-save-file (expand-file-name ".smex-items" save-dir))
(global-set-key (kbd "M-x") 'smex)


;;------------------------------------------------------------------------------
;; File
;;------------------------------------------------------------------------------
(setq make-backup-files nil)
(setq default-directory "~/workspace")

;; Use template with ido
(require 'template)
(template-initialize)
(dolist (cmd '(ido-select-text ido-magic-forward-char
			       ido-exit-minibuffer))
  (add-to-list 'template-find-file-commands cmd))


;;------------------------------------------------------------------------------
;; Git
;;------------------------------------------------------------------------------
(require 'git-emacs)


(provide 'core-editor)
;;; core-editor.el ends here
