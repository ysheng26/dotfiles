(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'auto-complete
                          'helm
                          'flycheck
                          'flycheck-ats2
                          'org
                          'magit)


;font setting
(set-default-font "Dejavu Sans Mono 16")

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

; ats-mode
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
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
