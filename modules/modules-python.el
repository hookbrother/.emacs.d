;;; modules-python.el --- configs for python programing
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Use jedi to complete, flate8 to check syntax, and last mainly use elpy to
;; program python.

;;; Code:

;;------------------------------------------------------------------------------
;; "pip install jedi flake8 elpy"
;;------------------------------------------------------------------------------
(require-package 'elpy)
(require 'elpy nil t)
(elpy-enable)
(setq elpy-rpc-backend "jedi")


(provide 'modules-python)
;;; modules-python.el ends here
