(defun c-hook ()
  (use-package lsp-mode)
  (use-package lsp-ui)
  (use-package lsp-ivy)
  (use-package ggtags)
  (defun header-format ()
    "Format the given file as a header file."
    (interactive)
    (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
    (insert "#if !defined(")
    (push-mark)
    (insert BaseFileName)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H)\n")
    (insert "/* ========================================================================\n")
    (insert "   $File: $\n")
    (insert "   $Date: $\n")
    (insert "   $Revision: $\n")
    (insert "   $Creator: Marsel Akhmadullin $\n")
    (insert "   ======================================================================== */\n")
    (insert "\n")
    (insert "#define ")
    (push-mark)
    (insert BaseFileName)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H\n")
    (insert "#endif")
    )

  (defun source-format ()
    "Format the given file as a source file."
    (interactive)
    (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
    (insert "/* ========================================================================\n")
    (insert "   $File: $\n")
    (insert "   $Date: $\n")
    (insert "   $Revision: $\n")
    (insert "   $Creator: Marsel Akhmadullin $\n")
    (insert "   ======================================================================== */\n\n")
    )

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]hpp" buffer-file-name) (header-format))
        ((string-match "[.]c" buffer-file-name) (source-format))
        ((string-match "[.]h" buffer-file-name) (header-format))
        ((string-match "[.]cpp" buffer-file-name) (source-format))
	((string-match "[.]cc" buffer-file-name) (source-format)))
  (lsp t)
  (ggtags-mode 1)
  )
