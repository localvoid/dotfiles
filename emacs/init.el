(when (daemonp)
  (defadvice desktop-restore-file-buffer
    (around my-desktop-restore-file-buffer-advice)
    "Be non-interactive while starting a daemon."
    (let ((noninteractive t))
      ad-do-it))
  (ad-activate 'desktop-restore-file-buffer)

  (setq desktop-dirname             "~/.emacs.d/desktop/"
        desktop-base-file-name      (concat (daemonp) ".desktop")
        desktop-base-lock-name      (concat (daemonp) ".lock")
        desktop-path                (list desktop-dirname)
        desktop-save                t
        desktop-files-not-to-save   "^$" ;reload tramp paths
        desktop-load-locked-desktop t)
  (desktop-save-mode 1))


(setq frame-title-format (list (daemonp) ": %b"))

(setq dotfiles-dir (expand-file-name "~/.emacs.d/"))

(add-to-list 'load-path dotfiles-dir)

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq bookmark-default-file (concat dotfiles-dir "data/bookmark"))
(setq auto-save-list-file-prefix
      (concat dotfiles-dir "data/auto-save-list/s-"))
(setq save-place-file (concat dotfiles-dir "data/places"))

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq frame-background-mode 'dark)
(load-theme 'sanityinc-tomorrow-night t)

;; == Ubiquitous packages
;;  These should be loaded on startup rather than autoloaded on demand
;;  since they are likely to be used in every session
;;
(require 'cl)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'flymake)
(require 'flymake-cursor)

;; == Load Major Customizations
;;
(require 'void-c)

(when (daemonp)
  (require 'session-manager)
  (session-manager-init (daemonp)))

;; == Customizations
;;
(prefer-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)
(random t)

(blink-cursor-mode -1)
(menu-bar-mode -1)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-11"))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))

(setq initial-frame-alist default-frame-alist)
(setq special-display-frame-alist default-frame-alist)

(cua-mode t)
(setq cua-enable-cua-keys nil)

(line-number-mode t)
(column-number-mode t)

(setq visible-bell t)
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t)
(setq transient-mark-mode t)
(setq delete-by-moving-to-trash nil)
(setq make-backup-files nil)
(setq truncate-partial-width-windows nil)
(setq uniquify-buffer-name-style 'forward)
(setq next-line-add-newlines nil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq split-width-threshold most-positive-fixnum)
(setq resize-mini-windows t)
(setq default-fill-column 72)
(setq create-lockfiles nil)
(setq require-final-newline nil)
(put 'downcase-region 'disabled nil)

(show-paren-mode t)
(global-auto-revert-mode t)

(set-default 'indent-tabs-mode nil)

(put 'upcase-region 'disabled nil)

(electric-pair-mode -1)
(electric-indent-mode -1)
(electric-layout-mode -1)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 72)

(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-mode)))

;; == ispell
;;
(setq ispell-program-name "hunspell")

;; == easypg
;;
(setq epg-gpg-program "gpg2")

;; == man pages
;;
(setq Man-notify-method 'pushy)

;; == ido mode
;;
(ido-mode t)
(setq ido-enable-prefix t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-everywhere t
      ido-enable-flex-matching nil
      ido-save-directory-list-file (concat dotfiles-dir "data/ido-last"))

;; == winner-mode
;;
(winner-mode t)

;; == dired mode
;;
(setq dired-dwim-target t
      dired-recursive-deletes 'top
      dired-recursive-copies 'always)

;; == Default to unified diffs
;;
(setq diff-switches "-u"
      ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; == Compile mode
;;
(setq compile-auto-highlight t
      compilation-scroll-output t
      compilation-window-height 25)

;; == iBuffer
;;
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")
            (ibuffer-do-sort-by-filename/process)))

;; == Eshell mode
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit nil)

(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; == Css mode
(autoload 'css-mode "css-mode")
(setq cssm-indent-function #'cssm-c-style-indenter)

;; == Bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "^z") 'undo)

(global-set-key [\S-f1] (lambda () (interactive)
                          (switch-to-buffer "*scratch*")))
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-cr" 'revert-buffer)

(global-set-key [f3] 'kmacro-end-or-call-macro)
(global-set-key [f4] 'kmacro-start-macro-or-insert-counter)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)

(global-set-key [f1] 'ibuffer)

(windmove-default-keybindings 'meta)

(global-set-key [(control meta up)] 'enlarge-window)
(global-set-key [(control meta down)] 'shrink-window)
(global-set-key [(control meta left)] 'shrink-window-horizontally)
(global-set-key [(control meta right)] 'enlarge-window-horizontally)

(global-set-key [f12] 'delete-window)

(global-set-key [f11] 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key "\C-xc" 'comment-or-uncomment-region)

(global-set-key [(f7)] 'recompile)
(global-set-key [(shift f7)] 'compile)
(global-set-key [(f8)] 'next-error)
(global-set-key [(shift f8)] 'previous-error)

(global-set-key [(f6)] 'gud-step)
(global-set-key [(control f6)] 'gud-next)


;; == Associate modes with file extensions
;;
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("wscript" . python-mode))
(add-to-list 'auto-mode-alist '("activate" . shell-script-mode))
(add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;; == emacs lisp
;;
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (turn-on-eldoc-mode)))

;; == javascript
;;
(setq js-indent-level 2)
(require 'flymake-jshint)

(add-hook 'js-mode-hook
          (lambda ()
            (flymake-mode t)
            (yas-minor-mode t)))

;; == python
;;
(add-hook 'python-mode-hook
          (lambda ()
            (yas-minor-mode t)))

;; == shell-script mode
;;
(add-hook 'shell-script-mode-hook
          (lambda ()
            (flymake-shell-load)))
