;; 插件/包设置
(eval-when-compile (require 'init-custom))

;; FIXME: DO NOT copy package-selected-packages to init-custom file forcibly.
(with-eval-after-load 'package
  (defun package--save-selected-packages (&optional value)
    "Set and (don't!) save `package-selected-packages' to VALUE."
    (when value
      (setq package-selected-packages value))
    (unless after-init-time
      (add-hook 'after-init-hook #'package--save-selected-packages))))

;; 包下载源设置
(cond
 ((eq my-package-archives 'melpa)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("melpa" . "http://melpa.org/packages/"))))
 ((eq my-package-archives 'emacs-china)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
 ((eq my-package-archives 'tuna)
  (setq packages-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))))

(if (= emacs-minor-version 0)
    (setq package-user-dir (locate-user-emacs-file "elpa-devel")))

;; 初始化
(setq package-enable-at-startup nil) ; 防止初始化两次
(package-initialize)

;; 使用use-package 来更新包 use-package: 一个插件包配置宏
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-expand-minimally t)
(setq use-package-enable-imenu-support t)

(when my-benchmark-enabled
  ;; 使用benchmark-init 记录require 和 load 消耗的时间
  (use-package benchmark-init
	       :init
	       (benchmarkinit/activate)
	       (add-hook 'after-init-hook #'benchmark-init/deactivate)))

;; 使用paradox 包管理器  比默认的list-packages 好用
(use-package paradox
	     :init (defalias 'upgrade-packages 'paradox-upgrade-packages)
	     :config
	     (setq paradox-github-token t)
	     (setq paradox-execute-asynchronously t)
	     (setq paradox-automatically-star nil)
	     (setq paradox-display-star-count nil))

(provide 'init-package)
	     


