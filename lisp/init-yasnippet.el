;; init-yasnippet.el --- Initialize yasnippet configurations.
;;; Commentary: yasnippet
;;; Code:
(use-package yasnippet
  :diminish yas-minor-mode
  :init (add-hook 'after-init-hook #'yas-global-mode)
  :config
  (use-package dropdown-list :commands dropdown-list)

  (setq yas-prompt-functions '(yas-dropdown-prompt
                               yas-maybe-ido-prompt
                               yas-completing-prompt)))

(provide 'init-yasnippet)
