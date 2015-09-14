(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;font setting
(set-default-font "Dejavu Sans Mono 13")

; line numbers
(global-linum-mode t)

; indent settings
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

; emacs backup behavior
(setq backup-directory-alist `(("." . "~/.emacs_auto_backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 7
      kept-old-versions 2
      version-control t)

; uncomment if absolutely must have no backup files
; (setq make-backup-files nil)

(load "~/.emacs.d/plugins/ats-mode/ats-mode.el")

