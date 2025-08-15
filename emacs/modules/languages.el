(setq treesit-font-lock-level 4)
(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)
  (add-to-list 'treesit-auto-recipe-list
               (make-treesit-auto-recipe
                :lang 'hyprlang
                :ts-mode 'hyprlang-ts-mode
                :remap 'conf-mode
                :url "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"
                :ext "\\.conf\\'"))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package lua-mode :ensure t)
(use-package kdl-mode :ensure t)
(use-package sxhkdrc-mode :ensure t)
(use-package qml-mode :ensure t)
(use-package treesit-langs
  :ensure (:host github
           :repo "emacs-tree-sitter/treesit-langs")
  :config
  (require 'treesit-langs))

