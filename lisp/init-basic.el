;;; Code:
;;; 基础设置
(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; 个人信息
(setq user-full-name my-full-name)
(setq user-mail-address my-mail-address)

;; 键位设置
(when sys/win32p
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super)

  (setq w32-apps-modifer 'hyper)

  (w32-register-hot-key [s-]))

;; 环境
(when (or sys/mac-x-p sys/linux-x-p)
  (use-package exec-path-from-shell
    :init
    (setq exec-path-from-shell-check-startup-files nil)
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH"))
    (setq exec-path-from-shell-arguments '("-1"))
    (exec-path-from-shell-initialize)))

;; 启动服务
(use-package server
  :ensure nil
  :init (add-hook 'after-init-hook #'server-mode))

;; 历史
(use-package saveplace
  :ensure nil
  :init
  (if (fboundp 'save-place-mode)
      (add-hook 'after-init-hook #'save-place-mode)
    (setq save-place t)))

(use-package recentf
  :ensure nil
  :init
  (setq recentf-max-saved-items 200)

  (add-hook 'find-file-hook (lambda() (unless recentf-mode
					(recentf-mode)
					(recentf-track-opened-file))))
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "bookmarks")
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'"))

(use-package savehist
  :ensure nil
  :init
  (setq enable-recursive-minibuffers t
	history-length 1000
	savehist-additional-variables '(mark-ring
					global-mark-ring
					search-ring
					regexp-search-ring
					extended-command-history)
	savehist-autosave-interval 60)
  (add-hook 'after-init-hook #'savehist-mode))

(provide 'init-basic)
