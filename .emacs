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
(add-hook 'c-mode-common-hook 'c-hook)
(add-hook 'python-mode-hook 'python-hook)

(custom-set-variables
 '(custom-safe-themes
   '("123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" default))
 '(package-selected-packages
   '(ggtags flycheck-google-cpplint
	    arduino-mode glsl-mode
	    qml-mode protobuf-mode
	    vterm cmake-mode meson-mode
	    yaml-mode csharp-mode dart-mode
	    djvu iedit elpy dockerfile-mode
	    org-bullets pylint nginx-mode
	    haskell-mode go-mode lsp-ivy
	    lsp-ui lsp-mode flycheck magit
	    lua-mode docker-tramp
	    flymd gh-md auto-complete
	    counsel swiper))
 '(version-control nil))

(use-package org-bullets)
(add-hook 'org-mode-hook #'org-bullets-mode)

(find-file (concat (getenv "HOME") "/todo.org"))

(global-set-key [f5] 'recompile)

(custom-set-faces)
