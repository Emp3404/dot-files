;;; Package --- Core_config
;;; Commentary:
;;; root of Emacs config
;;; Code:

(defvar custom-modules-path)
(setq custom-modules-path (concat (getenv "HOME") "/.emacs.d/modules/"))

(defun load-module (file)
  (interactive "f")
  "Load custom modules"
  (load-file (expand-file-name file custom-modules-path)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" default))
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
   '(lsp-latex clang-format lsp-treemacs lua-mode yaml-mode vterm use-package typescript-mode toml-mode spacemacs-theme rustic qml-mode pylint protobuf-mode php-mode org-bullets nginx-mode nasm-mode meson-mode magit lsp-ui lsp-ivy leetcode json-mode iedit haskell-mode gruvbox-theme go-mode glsl-mode gh-md ggtags flycheck-rust flycheck-google-cpplint exec-path-from-shell elpy elcord dockerfile-mode djvu dart-mode csharp-mode counsel cmake-mode auto-complete arduino-mode 2048-game))
 '(pdf-view-midnight-colors '("#282828" . "#f9f5d7"))
 '(version-control nil)
 '(warning-suppress-log-types '((lsp-mode))))

(load-module "customization.el")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package magit)
(use-package gh-md)

;; (use-package org-bullets)
;; (add-hook 'org-mode-hook #'org-bullets-mode)

(require 'treesit)

(load-module "cpp-mode.el")
(load-module "rust-mode.el")
(load-module "python-mode.el")

(add-hook 'c++-mode-hook 'c-hook)
(add-hook 'c-mode-common-hook 'c-hook)
(add-hook 'python-mode-hook 'py-hook)
(add-hook 'rust-mode-hook 'rust-hook)
(add-hook 'after-init-hook 'global-company-mode)

(setq dired-listing-switches "-alh")
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 100000000)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(find-file (concat (getenv "HOME") "/todo.org"))
