(defun go-hook ()
  (setq lsp-gopls-staticcheck t)
  (setq lsp-eldoc-render-all t)
  (setq lsp-gopls-complete-unimported t)

  (use-package lsp-mode
	:ensure t
	:commands (lsp lsp-deferred)
	:hook (go-mode . lsp-deferred))

  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
	(add-hook 'before-save-hook #'lsp-format-buffer t t)
	(add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; Optional - provides fancier overlays.
  (use-package lsp-ui
	:ensure t
	:commands lsp-ui-mode)

  ;; Company mode is a standard completion package that works well with lsp-mode.
  (use-package company
	:ensure t
	:config
	;; Optionally enable completion-as-you-type behavior.
	(setq company-idle-delay 0)
	(setq company-minimum-prefix-length 1))

  (setq tab-width 4)
)
