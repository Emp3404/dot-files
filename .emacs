;;;; Emacs config
;;;; M.Akhmadullin

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (split-window-horizontally)

(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(setq next-line-add-newlines nil)
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t)
(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq scroll-step 1)
; (setq-default mode-line-format nil)

(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode python-mode))
(make-face 'font-lock-todo-face)
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-todo-face t)
	   ("\\<\\(FIXME\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-todo-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-fixme-face "Blue" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark green" nil nil t nil t nil nil)


(interactive)
(display-time)
(tooltip-mode      -1)
(menu-bar-mode     -1)
(tool-bar-mode     -1)
(scroll-bar-mode   -1)
(blink-cursor-mode -1)
(set-foreground-color "burlywood3")
(set-background-color "#161616")
(set-cursor-color "#40FF40")
(global-hl-line-mode 1)
(column-number-mode)
(set-face-background 'hl-line "midnight blue")

(set-frame-font "Inconsolata-13")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")

(delete-selection-mode t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
   
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(delete-auto-save-files nil)
 '(delete-old-versions (quote other))
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function (quote ignore))
 '(make-backup-files nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (5)))
 '(package-selected-packages
   (quote
    (lua-mode docker-tramp cpp-auto-include flymd 0blayout gh-md auto-complete counsel swiper typing-game company-irony-c-headers irony-eldoc company-irony company)))
 '(version-control nil))

(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; (setq url-debug t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun py-hook ()
  (defun py-source-format ()
     "Format the given file as a source file."
     (interactive)
     (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
     (insert "''' ========================================================================\n")
     (insert "   $File: $\n")
     (insert "   $Date: $\n")
     (insert "   $Revision: $\n")
     (insert "   $Creator: Marsel Akhmadullin $\n")
     (insert "   ======================================================================== '''\n")
     (insert "def main():\n")
     (insert "    pass\n\n")
     (insert "if __name__ == '__main__':\n")
     (insert "    main()\n")
  )

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]py" buffer-file-name) (py-source-format)))
  )


(defun c-hook ()
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
     (insert "   ======================================================================== */\n")
     (insert "#include <iostream>\n\n")
  )

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]hpp" buffer-file-name) (header-format))
        ((string-match "[.]c" buffer-file-name) (source-format))
        ((string-match "[.]h" buffer-file-name) (header-format))
        ((string-match "[.]cpp" buffer-file-name) (source-format)))
  )

(add-hook 'c-mode-common-hook 'c-hook)
(add-hook 'python-mode-hook 'py-hook)
