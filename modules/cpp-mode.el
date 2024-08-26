;;; cpp-mode --- major modes for cpp development
;;; Commentary:
;;; Code:
(defun c-hook ()
  (use-package lsp-mode
    :ensure
    :commands lsp
    :config (setq
	     lsp-idle-delay 0.5 ;; default value
	     lsp-enable-symbol-highlighting t
	     lsp-enable-snippet nil
	     lsp-lens-enable nil
	     lsp-headerline-breadcrumb-enable t
	     lsp-signature-render-documentation nil
	     lsp-signature-auto-activate nil
	     lsp-eldoc-enable-hover nil
	     lsp-completion-provider :none))

  (use-package lsp-ui
    :commands lsp-ui-mode)
    :config (setq
	     lsp-ui-sideline-show-hover nil
	     lsp-ui-sideline-show-diagnostics t
	     lsp-ui-sideline-show-code-actions t
	     lsp-ui-doc-enable nil
	     lsp-ui-doc-show-with-mouse nil
	     lsp-ui-doc-show-with-cursor nil
	     lsp-ui-sideline-ignore-duplicates t)
    (lsp t))
;;; cpp-mode.el ends here
