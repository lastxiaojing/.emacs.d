;;; Code:

(use-package go-mode
  :bind (:map go-mode-map
              ("M-." . godef-jump)
              ("<f1>" . godoc-at-point))
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)

  (use-package golint)
  (use-package go-dlv)
  (use-package go-impl)

  ;;  (use-package go-eldoc
  ;;  :init (add-hook 'go-mode-hook #'go-eldoc-setup))

  (use-package go-guru
    :bind (:map go-mode-map
                ("M-." . go-guru-definition)
                ("M-?" . go-guru-referrers)))

  (use-package go-add-tags
    :bind (:map go-mode-map
                ("C-c t" . go-add-tags)))

  (use-package gotest
    :bind (:map go-mode-map
                ("C-c a" . go-test-current-project)
                ("C-c m" . go-test-current-file)
                ("C-c ." . go-test-current-test)
                ("C-c x" . go-run)))

  (with-eval-after-load 'company
    (use-package company-go
      :init (cl-pushnew (company-backend-with-yas 'company-go) company-backends)))

  (with-eval-after-load 'projectile
    ;; M-x `go-projectile-install-tools'
    (use-package go-projectile
      :commands (go-projectile-mode go-projectile-switch-project)
      :init
      (add-hook 'projectile-after-switch-project-hook #'go-projectile-switch-project)
      (add-hook 'go-mode-hook #'go-projectile-mode))))

(provide 'init-go)
