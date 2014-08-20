;;; modules-elisp.el --- configs for emacs lisp programing
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; 

;;; Code:

;;------------------------------------------------------------------------------
;; Use yasnippet handily.
;;------------------------------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		 '((company-dabbrev-code company-yasnippet company-elisp)))))


(provide 'modules-elisp)
;;; modules-elisp.el ends here
