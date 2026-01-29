(setq scroll-conservatively 101)
(setq scroll-step 1)
(setq scroll-margin 5)
(setq maximum-scroll-margin 0)

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

(defun my/evil-save-nohl ()
  (interactive)
  (save-buffer)
  (evil-ex-nohighlight))

(defun my/evil-mc-known-command-p (cmd)
  "Return t if CMD should be executed across cursors (whitelist approach)."
  (and (commandp cmd)
       (not (memq cmd my/evil-mc-blacklisted-commands))
       (or (eq (evil-get-command-property cmd :repeat) 'motion)
           t)))

(defun my/evil-mc-quit-or-q ()
  (interactive)
  (cond ((evil-mc-has-cursors-p) (evil-mc-undo-all-cursors))
        ((or (derived-mode-p 'special-mode) 'dired-mode) (quit-window))
        (evil-mode (call-interactively 'evil-record-macro))))

(defun my/evil-mc-visual-cursors ()
  (interactive)
  (evil-mc-make-cursor-in-visual-selection-beg)
  (evil-normal-state))

(defvar my/autosave-timer nil)
(defvar my/autosave-delay 0.2)

(defun my/auto-save (&rest args)
  (interactive)
  (when (and buffer-file-name (buffer-modified-p))
    (when my/autosave-timer
      (cancel-timer my/autosave-timer))
    (setq my/autosave-timer
          (run-with-timer my/autosave-delay nil
                          (lambda ()
                            (when (and buffer-file-name (evil-normal-state-p))
                              (let ((inhibit-message t))
                                (evil-update)))
                            (setq my/autosave-timer nil))))))

;;; Evil
(use-package evil
  :demand
  :ensure t
  :bind ("<escape>" . keyboard-escape-quit)
  :init
  ;; (setq evil-highlight-closing-paren-at-point-states nil)
  ;; (setq evil-want-C-w-delete t)
  (setq evil-search-module 'evil-search)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-keybinding nil)
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-fine-undo nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-insert-state-cursor '(box))
  (setq evil-leader/in-all-states t)
  :config
  (evil-mode)
  (define-prefix-command 'evil-leader)
  (evil-define-key '(motion normal) 'global
    (kbd "SPC") 'evil-leader)

  (evil-define-key 'insert 'global
    (kbd "C-w") 'evil-delete-backward-word)

  (evil-define-key 'normal 'global
    ;; "u" 'undo
    ;; (kbd "C-r") 'redo
    (kbd "<escape>") 'my/evil-save-nohl
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
    "d"  'diff-hl-mode
    "c"  'gptel
    "/"  'occur
    "g"  'magit
    "mR" 'compile
    "mr" 'recompile
    "e"  'find-file
    "f"  'project-find-file
    "b"  'switch-to-buffer
    "j"  'recentf
    "pf" 'project-switch-project
    "ps" 'shell-command)

  (add-hook 'evil-insert-state-exit-hook #'my/auto-save)
  (add-hook 'after-change-functions #'my/auto-save)

  (evil-set-initial-state 'vterm-mode 'emacs)
  (evil-set-initial-state 'eat-mode 'emacs)
  (evil-set-initial-state 'gptel-mode 'emacs))

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

(use-package evil-mc :after evil
  :ensure t
  :config 
  (global-evil-mc-mode)
  (evil-define-key 'visual evil-mc-key-map
    "q" 'my/evil-mc-visual-cursors)
  (evil-define-key 'normal evil-mc-key-map
    "q" 'my/evil-mc-quit-or-q
    "ga" 'evil-mc-make-all-cursors
    (kbd "C-n") 'evil-mc-make-and-goto-next-match
    (kbd "C-p") 'evil-mc-make-and-goto-prev-match)
  (advice-add 'evil-mc-known-command-p :override #'my/evil-mc-known-command-p)
  (advice-add 'newline :after (lambda (&rest args) (indent-according-to-mode)))
  (advice-add 'evil-open-below :after (lambda (&rest args) (indent-according-to-mode))))
