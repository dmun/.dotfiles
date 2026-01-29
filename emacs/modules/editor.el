(electric-pair-mode)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package dtrt-indent
  :ensure t
  :config
  (dtrt-indent-global-mode))

(use-package undo-fu :ensure t)
(use-package undo-fu-session
  :ensure t
  :config
  (undo-fu-session-global-mode))
(use-package undo-tree
  :disabled t
  :ensure t
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
  (setq undo-tree-enable-undo-in-region nil)
  (global-undo-tree-mode))

(use-package paredit
  :ensure t
  :hook (lisp-mode emacs-lisp-mode))

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(setq mac-command-modifier 'meta)
(global-set-key (kbd "C-,") 'rc/duplicate-line)
(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-p") 'scroll-down-command)

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . 'mc/mark-next-lines)
         ("C-<" . 'mc/mark-previous-lines)
         ("C-M-c" . 'mc/mark-all-in-region)
         ("C-M-n" . 'mc/mark-next-like-this)
         ("C-M-p" . 'mc/mark-previous-like-this))
  :config
  (setq mc/always-run-for-all t)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-previous-lines)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-next-lines))

(add-hook 'prog-mode-hook 
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (modify-syntax-entry ?- "w")))

(use-package nix-mode
  :ensure t)
