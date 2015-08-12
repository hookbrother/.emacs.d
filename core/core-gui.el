;;; core-gui.el --- GUI optimizations and tweaks
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Make the appearance nicer.

;;; Code:

;;------------------------------------------------------------------------------
;; Mode line
;;------------------------------------------------------------------------------
;; Diminish minor mode if need
(require-package 'diminish)

;; Show total matches and current match position
(require-package 'anzu)
(global-anzu-mode)
(diminish 'anzu-mode)


;;------------------------------------------------------------------------------
;; Buffer
;;------------------------------------------------------------------------------
(setq inhibit-startup-screen t)
(set-scroll-bar-mode nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq-default fill-column 80)
(global-linum-mode t)
(setq-default cursor-type 'bar)

;; maximize the frame
(require-package 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; whitespace
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)
(diminish 'whitespace-cleanup-mode)

;; Highlight
(global-hl-line-mode t)


;; Frame operates
(global-set-key (kbd "M-0") 'kill-this-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-4") 'delete-window)
(global-set-key (kbd "M-o") 'other-window)

;; Tabbar
(require-package 'tabbar)
(tabbar-mode 1)
(global-set-key (kbd "M-n") 'tabbar-forward)
(global-set-key (kbd "M-p") 'tabbar-backward)


;;------------------------------------------------------------------------------
;; Echo area
;;------------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)


;;------------------------------------------------------------------------------
;; Zenburn theme
;;------------------------------------------------------------------------------
(require-package 'zenburn-theme)
(load-theme 'zenburn t)


(provide 'core-gui)
;;; core-gui.el ends here
