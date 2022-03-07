
;;-----------------------package-setting-------------------------------------------
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;put your installed package here
(defvar myPackages
  '(better-defaults      ;; small changes
    ;; flycheck             ;; for python syntax checking
    ;; ein                  ;; for ipython notebook
    ;; elpy                 ;; for python ide
    ;; jedi                 ;; python autocomplete
    auto-complete        ;; auto complete
    ;; auto-complete-config
    ;; auto-complete-auctex
    ;; auctex               ;; Emacs latex
    ;; reftex               ;; For better citation in emacs    
    ;; ac-math
    python-mode          ;;
    material-theme       ;;for theme
    zenburn-theme
    dracula-theme
    afternoon-theme
    vscode-dark-plus-theme
    ;; conda                ;;for conda env management
    dashboard            ;;for emacs initial open buffer
    ;; nlinum               ;;for better line number
    ido-vertical-mode    ;; Make ido display vertically
    smex                 ;; M-x enhancement for Emacs
    neotree              ;; File manager tree like
    ;; ido-completing-read ;; enable ido in as many places as possible
    ;; helm
    ;; pyvenv
))    

;;check whether each package is installed
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; ;;MAC os----------------- cmd key for meta--------------------------------------
;; (setq mac-option-key-is-meta nil
;;       mac-command-key-is-meta t
;;       set-keyboard-coding-system nil
;;       mac-command-modifier 'meta
;;       mac-option-modifier 'none)


;; BASIC CUSTOMIZATION----------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(show-paren-mode 1) ;; enable the brace matching
(setq blink-matching-delay 0.3);;prevent cursor jump back when close brace
(setq inhibit-startup-message t) ;; hide the startup message

(global-visual-line-mode 1) ;; Proper line wrapping
(global-hl-line-mode 1); Highlight current row
(setq line-number-mode t)
(setq column-number-mode t)
(global-set-key "\C-x\C-g" 'goto-line)
;;(display-time-mode 1) ;; display time 

;; load material theme----------------------------------------------------
(load-theme 'vscode-dark-plus t)

;; line number mode-------------------------------------------------------
(global-linum-mode t) ;; enable line numbers globally
;; (use-package nlinum
;; 	     :config
;; 	     (global-nlinum-mode))
;; (add-hook 'shell-mode-hook(lambda ()
;; 			    (linum-mode -1))

;; dashboard setting------------------------------------------------------
(require 'dashboard)
(dashboard-setup-startup-hook)
;; (setq dashboard-startup-banner 1)
;; (setq dashboard-items '((recents . 10)  ;;has bugs
;; 			(projects .5)
;; 			(bookmarks .5))) 
;; (setq initial-buffer-choice 'helm-recentf)


;;auto complete
;;-----------------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;;(global-auto-complete-mode t)
;;(setq ac-modes (delq 'python-mode ac-modes)) ;; ac mode will conflict with jedi in python||elpy mode

;;Interactively Do Things
;;-----------------------------------------------------------------------
(require 'ido)
(ido-mode t)
(ido-everywhere t)

;;(require 'ido-complete-read+)
;;(ido-ubiquitous-mode 1)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)  ;; list items vertically
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;;Meta-X enhancement
;;----------------------------------------------------------------------
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay  when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;------------------------neotree----------------------------------------
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(neotree smex ido-vertical-mode dashboard vscode-dark-plus-theme afternoon-theme dracula-theme zenburn-theme material-theme python-mode auto-complete better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
