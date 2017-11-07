;; init-company.el --- Initialize company configurations.
;;; Commentary: 补全配置
;;; Code:

(use-package company
  :diminish company-mode
  :bind (("M-/" . company-complete)
         ("C-c C-y" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . company-select-previous)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :init (add-hook 'after-init-hook #'global-company-mode)
  :config
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)

  ;; weight by frequency
  (setq company-transformers '(company-sort-by-occurrence))

  ;; Sort candidates using completion history
  (use-package company-statistics
    :init (company-statistics-mode 1))

  ;; Popup documentation for completion candidates
  (use-package company-quickhelp
    :if (display-graphic-p)
    :bind (:map company-active-map
                ("M-h" . company-quickhelp-manual-begin))
    :init (company-quickhelp-mode 1))

  ;; Support yas in commpany
  ;; Note: Must be the last to involve all backends
  (defvar company-enable-yas t
    "Enable yasnippet for all backends.")

  (defun company-backend-with-yas (backend)
    (if (or (not company-enable-yas)
            (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-backend-with-yas company-backends)))

(provide 'init-company)
