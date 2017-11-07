;;; 版本

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(when (version< emacs-version "24.4")
  (error "This requires Emacs 24.4 and above!"))

;;; 加载速度优化
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 30000000)
(add-hook 'emacs-startup-hook
      (lambda()
        "Restore default values after init"
        (setq file-name-handler-alist default-file-name-handler-alist)
        (setq gc-cons-threshold 800000)))

;; 设置加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; 设置常量
(require 'init-const)

;; 定制
(require 'init-custom)

;; 插件设置
(require 'init-package)

;; 偏好设置 个性设置
(require 'init-basic)
(require 'init-ui)

(require 'init-edit)
(require 'init-ivy)
(require 'init-company)
(require 'init-yasnippet)

(require 'init-dired)
(require 'init-highlight)
(require 'init-ibuffer)
(require 'init-kill-ring)
(require 'init-window)

(require 'init-shell)
(require 'init-eshell)

;; 编程设置
(require 'init-flycheck)
(require 'init-c)
(require 'init-go)
(require 'init-python)
(require 'init-web)

;; 恢复
;; (require 'init-restore)
