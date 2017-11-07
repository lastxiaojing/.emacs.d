(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; 编码设置
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)

;; 字体设置
(set-default-font "-*-Courier New-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; Logo
(setq fancy-splash-image my-logo)

;; Title
(setq frame-title-format
      '("GNU Emacs " emacs-version "@" user-login-name " : "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(setq icon-title-format frame-title-format)

;; Menu/Tool/Scroll bars
(unless sys/mac-x-p
  (when (and (fboundp 'menu-bar-mode) menu-bar-mode)
    (menu-bar-mode -1)))
(when (and (fboundp 'tool-bar-mode) tool-bar-mode)
  (tool-bar-mode -1))
(when (and (fboundp 'scroll-bar-mode) scroll-bar-mode)
  (scroll-bar-mode -1))

;; Theme
(cond
 ((eq my-theme 'default)
  (use-package monokai-theme
    :init (load-theme 'monokai t)))
 ((eq my-theme 'dark)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-dark t)))
 ((eq my-theme 'light)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-light t)))
 ((eq my-theme 'daylight)
  (use-package leuven-theme
    :init (load-theme 'leuven t))))

;; Line and Column
(setq-default fill-column 80)
(setq column-number-mode t)
(setq line-number-mode t)

;; Show native line numbers if possible, otherwise use linum
(if (fboundp 'display-line-numbers-mode)
    (use-package display-line-numbers
      :ensure nil
      :init (add-hook 'prog-mode-hook #'display-line-numbers-mode))
  (use-package linum-off
    :after linum
    :init (add-hook 'after-init-hook #'global-linum-mode)
    :config (setq linum-format "%4d ")))

;; Mouse & Smooth Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1
      scroll-margin 1
      scroll-conservatively 100000)

(use-package smooth-scrolling
  :init (add-hook 'after-init-hook #'smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 0))

;; Display Time
(use-package time
  :ensure nil
  :unless (display-graphic-p)
  :preface
  (setq display-time-24hr-format t)
  (setq display-time-day-and-date t)
  :init (add-hook 'after-init-hook #'display-time-mode))

;; Misc
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(size-indication-mode 1)
;; (blink-cursor-mode -1)
(setq track-eol t)                      ; Keep cursor at end of lines. Require line-move-visual is nil.
(setq line-move-visual nil)

;; Don't open a file in a new frame
(when (boundp 'ns-pop-up-frames)
  (setq ns-pop-up-frames nil))

;; Don't use GTK+ tooltip
(when (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

;; Toggle fullscreen
(bind-keys ([(control f11)] . toggle-frame-fullscreen)
           ([(control super f)] . toggle-frame-fullscreen) ; Compatible with macOS
           ([(super return)] . toggle-frame-fullscreen)
           ([(meta shift return)] . toggle-frame-fullscreen))

(provide 'init-ui)
