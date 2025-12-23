(recentf-mode)
(savehist-mode)
(save-place-mode)
(global-auto-revert-mode)

(use-package sudo-edit :ensure t)
(use-package magit :ensure t)

(use-package dired
  :config
  (setq dired-mouse-drag-files t)
  (setq dired-free-space nil)
  (setq dired-kill-when-opening-new-dired-buffer t)
  (setq dired-listing-switches "-Alh --group-directories-first")
  (require' dired-x))

(use-package dired-hide-details :hook dired-mode)
(use-package nerd-icons-dired :ensure t :hook dired-mode)
(add-hook 'proced-mode-hook (lambda () (proced-toggle-auto-update 1)))

(keymap-global-set "C-x C-o" #'recentf)
