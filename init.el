 ;;; init.el --- configuration entry point
;;
;; Copyright (c) 2014 hookbrother
;;
;; Author: hookbrother <hookbrother@gmail.com>
;; URL: https://github.com/hookbrother/.emacs.d

;;; Commentary:

;; This file simply sets up the load path and requires the various modules.

;;; Code:

;;------------------------------------------------------------------------------
;; Sets up the load path
;;------------------------------------------------------------------------------
;; Define the directory names.
(defvar core-dir (expand-file-name "core" user-emacs-directory)
  "The home of core functionality.")
(defvar modules-dir (expand-file-name  "modules" user-emacs-directory)
  "This directory houses all of the modules.")
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory)
  "This directory houses packages that are not yet available in MELPA.")
(defvar personal-dir (expand-file-name "personal" user-emacs-directory)
  "This directory is for your personal configuration.")
(defvar save-dir (expand-file-name "save" user-emacs-directory)
  "This folder stores all the automatically generated save/history-files.")

;; If these directorys don't exist, create them.
(unless (file-exists-p personal-dir)
  (make-directory personal-dir))
(unless (file-exists-p save-dir)
  (make-directory save-dir))

;; Add these directorys to Emacs's 'load-path'.
(defun add-subdirs-to-load-path (parent-dir)
  "Add every subdir of PARENT-DIR to `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
        (add-subdirs-to-load-path name)))))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)
(add-subdirs-to-load-path vendor-dir)


;;------------------------------------------------------------------------------
;; The core stuff
;;------------------------------------------------------------------------------
(require 'core-elpa)
(require 'core-gui)
(require 'core-editor)
(require 'core-gadgets)
(require 'core-modules)


;;------------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;------------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" personal-dir))
(when (file-exists-p custom-file)
  (load custom-file))


;;; init.el ends here
