(setq user-full-name "hookbrother")
(setq user-mail-address "hookbrother@gmail.com")
(set-face-attribute 'tabbar-default nil
		    :family "DejaVu Sans Mono"
		    :background "gray80"
		    :foreground "gray30"
		    :height 1.0)
(set-face-attribute 'tabbar-selected nil
		    :inherit 'tabbar-default
		    :foreground "DarkGreen"
		    :background "LightGoldenrod"
		    :box '(:line-width 2 :color "DarkGoldenrod")
		    :overline "black"
		    :underline "black"
		    :weight 'bold)
(set-face-attribute 'tabbar-unselected nil
		    :inherit 'tabbar-default
		    :box '(:line-width 2 :color "#00B2BF"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow1")))))
