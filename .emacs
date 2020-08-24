(setq modules-dir "~/.emacs.d/modules/")
(defun load-module (file)
  (interactive "f")
  "Load modules in current configuration"
  (load-file (expand-file-name file modules-dir)))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(load-module "customization.el")
(load-module "cpp-mode.el")
(load-module "python-mode.el")

(use-package magit)
(use-package gh-md)

(add-hook 'c++-mode-hook 'c-hook)
(add-hook 'python-mode-hook 'python-hook)
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
 '(delete-old-versions 'other)
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function 'ignore)
 '(make-backup-files nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(1))
 '(package-selected-packages
   '(nginx-mode haskell-mode go-mode lsp-ivy lsp-ui lsp-mode flycheck magit lua-mode docker-tramp flymd gh-md auto-complete counsel swiper))
 '(version-control nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
