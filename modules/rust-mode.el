(defun rust-hook()
  (use-package rustic)
  ;; (setq rustic-lsp-client 'lsp-mode)
  (use-package lsp-mode
    :ensure
    :commands lsp
    :custom
    (lsp-eldoc-render-all t)
    (lsp-idle-delay 0.6)
    (lsp-rust-analyzer-server-display-inlay-hints t)
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    )

  (use-package lsp-ui
    :ensure
    :commands lsp-ui-mode
    :custom
    (lsp-ui-peek-always-show t)
    (lsp-ui-sideline-show-hover t))

  (use-package company
    :ensure
    :custom
    (company-idle-delay 0.5)
    :bind
    (:map company-active-map
	  ("C-n". company-select-next)
	  ("C-p". company-select-previous)
	  ("M-<". company-select-first)
	  ("M->". company-select-last))
    )

  (use-package flycheck
    :ensure)
  ;; uncomment to disable rustfmt on save
  ;; (setq rustic-format-on-save t)
  )
