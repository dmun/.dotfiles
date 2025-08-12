(electric-pair-mode)

(use-package dabbrev :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package dtrt-indent
  :ensure t
  :config
  (dtrt-indent-global-mode))

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
  :hook
  (after-init . evil-mode)
  :init
  ;; (setq evil-highlight-closing-paren-at-point-states nil)
  (setq evil-search-module 'evil-search)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-keybinding nil)
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-fine-undo nil)
  (setq evil-undo-system 'undo-tree)
  (setq evil-insert-state-cursor '(box))
  (setq evil-leader/in-all-states t)
  :config
  (evil-set-undo-system 'undo-tree))

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
  :disabled
  :ensure t
  :hook paredit-mode)
(define-prefix-command 'evil-leader)
(evil-define-key '(motion normal) 'global
  (kbd "SPC") 'evil-leader)

(evil-define-key 'insert 'global
  (kbd "C-w") 'evil-delete-backward-word)

(evil-define-key 'normal 'global
  "u" 'undo
  (kbd "C-r") 'redo
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  "-"  'dired-jump
  "g/" 'consult-grep
  "gs" 'consult-imenu
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

(use-package multiple-cursors
  :disabled
  :ensure t
  :bind (("C->" . 'mc/mark-next-lines)
         ("C-<" . 'mc/mark-previous-lines))
  :config
  (setq mc/always-run-for-all t)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-previous-lines)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-next-lines))

(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode)
  (evil-define-key 'visual evil-mc-key-map
    "A" #'evil-mc-make-cursor-in-visual-selection-end
    "I" #'evil-mc-make-cursor-in-visual-selection-beg)
  (evil-define-key 'normal evil-mc-key-map
    (kbd "C-n") 'evil-mc-make-and-goto-next-match
    (kbd "C-p") 'evil-mc-make-and-goto-prev-match))

(add-hook 'prog-mode-hook 
	  (lambda ()
	    (modify-syntax-entry ?_ "w")
	    (modify-syntax-entry ?- "w")))

(defvar my/evil-mc-blacklisted-commands
  '(evil-search-next
    evil-search-previous
    evil-ex
    undo
    redo
    evil-undo
    evil-redo
    evil-goto-line
    evil-goto-first-line
    evil-jump-backward
    evil-jump-forward
    )
  "Commands that should NOT be executed across multiple cursors.")

(defun my/evil-mc-known-command-p (cmd)
  "Return t if CMD should be executed across cursors (whitelist approach)."
  (and (commandp cmd)
       (not (memq cmd my/evil-mc-blacklisted-commands))
       (or (eq (evil-get-command-property cmd :repeat) 'motion)
           t)))

(advice-add 'evil-mc-known-command-p :override #'my/evil-mc-known-command-p)
(advice-add 'newline :after (lambda (&rest args) (indent-according-to-mode)))
(advice-add 'evil-open-below :after (lambda (&rest args) (indent-according-to-mode)))
(advice-add 'evil-open-above :after (lambda (&rest args) (indent-according-to-mode)))

(defun my/evil-mc-quit-or-q ()
  "If evil-mc has active cursors, undo them, otherwise run normal `q`."
  (interactive)
  (if (evil-mc-has-cursors-p)
      (evil-mc-undo-all-cursors)
    (call-interactively (keymap-lookup evil-normal-state-map "q"))))

(evil-define-key 'normal evil-mc-key-map
  "q" 'my/evil-mc-quit-or-q)
