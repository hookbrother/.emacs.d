;;; modules-java.el --- configs for java programing
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Mainly use eclim to complete, check syntax and others.

;;; Code:

;;------------------------------------------------------------------------------
;; "yaourt -S eclim-git"
;;------------------------------------------------------------------------------
(require-package 'emacs-eclim)
(require 'eclim)
(global-eclim-mode)
(require 'eclimd)
(setq eclim-auto-save t
      eclimd-default-workspace "~/workspace/java")
(add-hook 'java-mode-hook
	  (lambda ()
	    (setq company-eclim-executable eclim-executable)
	    (set (make-local-variable 'company-backends) '(company-eclim))))

;;------------------------------------------------------------------------------
;; Use the common fundition by handier key map.
;;------------------------------------------------------------------------------
(require 'eclim-java)
(define-key eclim-mode-map (kbd "M-.") 'eclim-java-find-declaration)
(define-key eclim-mode-map (kbd "M-,") 'eclim-java-find-references)
(define-key eclim-mode-map (kbd "C-i") 'eclim-java-import-organize)
(define-key eclim-mode-map (kbd "M-h") 'eclim-java-hierarchy)
(define-key eclim-mode-map (kbd "M-s M-i") 'eclim-java-implement)
(define-key eclim-mode-map (kbd "C-h C-h") 'eclim-java-doc-comment)
(define-key eclim-mode-map (kbd "C-S-f") 'eclim-java-format)
(define-key eclim-mode-map (kbd "M-s M-s") 'eclim-java-generate-getter-and-setter)
(define-key eclim-mode-map (kbd "M-r") 'eclim-run-class)


(provide 'modules-java)
;;; modules-java.el ends here
