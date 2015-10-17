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

; GUI settings
(tool-bar-mode -1)
; (toggle-scroll-bar -1)
; (menu-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
