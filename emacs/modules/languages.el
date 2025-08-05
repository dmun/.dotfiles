(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
(use-package lsp-mode
  :ensure t
  :config
  (add-to-list 'lsp-language-id-configuration '("*.qml" . "qml")))
(use-package lua-mode :ensure t)
(use-package kdl-mode :ensure t)
(use-package sxhkdrc-mode :ensure t)

(use-package markdown-mode
  :config
  (setq markdown-header-scaling t)
  (setq markdown-list-indent-width 20))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(python-mode . "python"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("pyrefly" "lsp"))
    :major-modes '(python-mode python-ts-mode)
    :server-id 'pyrefly)))
