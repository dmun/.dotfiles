(electric-pair-mode)

(use-package dabbrev :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package undo-fu :ensure t)
(use-package undo-tree
  :ensure t
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
  (setq undo-tree-enable-undo-in-region nil)
  (global-undo-tree-mode))

;;; Evil
(use-package evil
  :demand
  :ensure t
  :bind ("<escape>" . keyboard-escape-quit)
  :init
  (setq evil-want-keybinding nil
   evil-disable-insert-state-bindings t
   evil-want-C-i-jump t
   evil-want-C-u-scroll t
   evil-want-fine-undo nil
   evil-undo-system 'undo-tree)
  :config
  (setq evil-insert-state-cursor '(box))
  (evil-mode 1))

(use-package evil-collection :after evil
  :ensure t
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-org
  :ensure t
  :hook (org-mode)
  :config
  (require 'evil-org)
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)) 

(use-package paredit
  :ensure t
  :hook (lisp-mode emacs-lisp-mode))

(use-package enhanced-evil-paredit
  :ensure t
  :hook paredit-mode)
(define-prefix-command 'evil-leader)
(evil-define-key '(motion normal) 'global
  (kbd "SPC") 'evil-leader)

(evil-define-key 'insert 'global
  (kbd "C-w") 'evil-delete-backward-word)

(evil-define-key 'normal 'global
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  "-"  'dired-jump
  "g/" 'consult-grep
  "gs" 'consult-outline
  "gl" 'evil-end-of-line
  "gh" 'evil-first-non-blank
  "gw" 'other-window)

(evil-define-key nil evil-leader
  "t"  'vterm
  "h"  'customize-face
  "a"  'org-agenda
  "c"  'gptel
  "g"  'magit
  "mR" 'compile
  "mr" 'recompile
  "e"  'find-file
  "f"  'project-find-file
  "b"  'switch-to-buffer
  "o"  'recentf
  "pf" 'project-switch-project
  "ps" 'shell-command)

(evil-set-initial-state 'vterm-mode 'emacs)
(evil-set-initial-state 'eat-mode 'emacs)
(evil-set-initial-state 'gptel-mode 'emacs)

;;; Multiple Cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . 'mc/mark-next-lines)
         ("C-<" . 'mc/mark-previous-lines))
  :config
  (setq mc/always-run-for-all t)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-previous-lines)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-next-lines)) 
