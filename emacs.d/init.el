(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'cl)
;; Guarantee all packages are installed on start
(defvar packages-list
  '(auto-complete
    expand-region
    flycheck
    flycheck-ats2
   )
  "List of packages needs to be installed at launch")

(defun has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

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

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
