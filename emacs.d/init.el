(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
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
(ensure-package-installed ;; 'evil
                          ;; 'evil-leader
                          'auto-complete
                          ;; 'key-chord
                          ;; 'iedit
                          ;; 'helm
                          ;; 'flycheck
                          ;; 'flycheck-ats2
                          'org
                          ;; 'powerline
                          ;; 'ag
                          ;; 'yasnippet
                          ;; 'magit
                          )

;; evil-leader
;; (require 'evil-leader)
;; (global-evil-leader-mode)
;; (evil-leader/set-leader ",")
;; (setq evil-leader/in-all-states 1)
;; (evil-leader/set-key
;;  "w"  'save-buffer
;;  "q"  'kill-this-buffer
;;  "1"  'delete-other-windows  ;; C-w o
;;  ;; "a"  'ag-project            ;; Ag search from project's root
;;  ;; "t"  'gtags-reindex
;;  ;; "T"  'gtags-find-tag
;;  "x"  'helm-M-x)

;; evil mode
;; (require 'evil)
;; (evil-mode t)

;; (require 'key-chord)
;; ;;Exit insert mode by pressing j and then j quickly
;; (setq key-chord-two-keys-delay 0.5)
;; (key-chord-mode 1)
;; (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; swap : and ;
;; (define-key evil-motion-state-map ";" 'evil-ex)
;; (define-key evil-motion-state-map ":" 'evil-repeat-find-char)

;; auto-complete
(global-auto-complete-mode t)

;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; helm
;; (setq helm-buffers-fuzzy-matching t)
;; (setq helm-autoresize-mode t)
;; (helm-mode 1)

;; powerline
;; (powerline-default-theme)

;; font setting
(set-default-font "Dejavu Sans Mono 14")

;; no splash screen and startup message etc
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; line numbers
(global-linum-mode t)

;; indent settings
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; emacs backup behavior
(setq backup-directory-alist `(("." . "~/.emacs_auto_backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 7
      kept-old-versions 2
      version-control t)

;; uncomment if absolutely must have no backup files
;; (setq make-backup-files nil)

;; ats-mode
;; (load "~/.emacs.d/plugins/ats-mode/ats-mode.el")

(setq load-path
  (cons "~/.emacs.d/plugins/ats-mode" load-path))
;;;
(setq auto-mode-alist
  (cons '("\\.sats" . ats-mode) auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\.dats" . ats-mode) auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\.hats" . ats-mode) auto-mode-alist))
;;;
(autoload 'ats-mode
          "ats-mode" "Major mode for editing ATS code" t)

;; GUI settings
(tool-bar-mode -1)
;; (toggle-scroll-bar -1)
;; (menu-bar-mode -1)

