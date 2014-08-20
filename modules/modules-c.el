;;; modules-c.el --- configs for c and c++ programing
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Use company-c-headers and company-clang to complete,  flymake-google-cpplint
;; to check syntax.

;;; Code:

;;------------------------------------------------------------------------------
;; Make sure clang is installed.
;;------------------------------------------------------------------------------
(require-package 'company-c-headers)
(require 'company-c-headers)
(add-hook 'c-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		 '(company-c-headers company-clang (company-dabbrev-code)))))
(add-hook 'c++-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		 '(company-c-headers company-clang (company-dabbrev-code)))))


;;------------------------------------------------------------------------------
;; "pip install cpplint"(Make sure python-pip is installed)
;;------------------------------------------------------------------------------
(defun hb:flymake-google-init()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "cpplint"))
  (flymake-google-cpplint-load))
(add-hook 'c-mode-hook 'hb:flymake-google-init)
(add-hook 'c++-mode-hook 'hb:flymake-google-init)


(provide 'modules-c)
;;; modules-c.el ends here
