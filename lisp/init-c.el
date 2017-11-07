;; C/C++ Mode
(use-package cc-mode
  :ensure nil
  :init
  (add-hook 'c-mode-common-hook
            (lambda ()
              (c-set-style "bsd")
              (setq tab-width 4)
              (setq c-basic-offset 4)

              ;; (local-set-key "\C-m" 'reindent-then-newline-and-indent)
              (local-set-key "\C-cc" 'compile)))
  :config
  ;; Company mode backend for C/C++ header files
  (with-eval-after-load 'company
    (use-package company-c-headers
      :init (cl-pushnew (company-backend-with-yas 'company-c-headers) company-backends))))

(provide 'init-c)
