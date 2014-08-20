;;; core-elpa.el --- handier to use package
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; Use packages handily.

;;; Code:

;;------------------------------------------------------------------------------
;; Package repositories
;;------------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))


;;------------------------------------------------------------------------------
;; On-demand installation of packages
;;------------------------------------------------------------------------------
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;------------------------------------------------------------------------------
;; Fire up package.el
;;------------------------------------------------------------------------------
(package-initialize)


(provide 'core-elpa)
;;; core-elpa.el ends here
