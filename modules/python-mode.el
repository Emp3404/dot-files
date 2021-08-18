(defun py-hook ()
  (use-package elpy
  :ensure t
  :init
  (elpy-enable))
  (defun py-source-format ()
    "Format the given file as a source file."
    (interactive)
    (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
    (insert "''' ========================================================================\n")
    (insert "   $File: $\n")
    (insert "   $Date: $\n")
    (insert "   $Revision: $\n")
    (insert "   $Creator: Marsel Akhmadullin $\n")
    (insert "   ======================================================================== '''\n\n")
    )

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]py" buffer-file-name) (py-source-format)))
  (autoload 'pylint "pylint")
  (add-hook 'python-mode-hook 'pylint-add-menu-items)
  (add-hook 'python-mode-hook 'pylint-add-key-bindings)
  )
