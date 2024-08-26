(defun py-hook ()
  (use-package lsp-mode
    :ensure
    :commands lsp
    :config
    (setq lsp-idle-delay 0.5
          lsp-enable-symbol-highlighting t
          lsp-enable-snippet nil
          lsp-pyls-plugins-flake8-enabled t
	  lsp-completion-provider :none
	  )
    )

  (use-package lsp-ui
    :config (setq lsp-ui-sideline-show-hover t
                  lsp-ui-sideline-delay 0.5
                  lsp-ui-doc-delay 5
                  lsp-ui-sideline-ignore-duplicates t
                  lsp-ui-doc-position 'bottom
                  lsp-ui-doc-alignment 'frame
                  lsp-ui-doc-header nil
                  lsp-ui-doc-include-signature t
                  lsp-ui-doc-use-childframe t)
    :commands lsp-ui-mode)
  
  (lsp t)

  )
