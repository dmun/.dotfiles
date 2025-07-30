(setq custom-file "~/.emacs.custom")
(menu-bar-mode -1)

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-short-answers t)

(defun rc/new-frame-setup (&optional frame)
  (when (display-graphic-p frame)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))
(mapc 'rc/new-frame-setup (frame-list))
(add-hook 'after-make-frame-functions 'rc/new-frame-setup)

(if (and (fboundp 'native-comp-available-p) (native-comp-available-p))
    (message "Native compilation is available")
  (message "Native compilation is NOT available"))
(setq gc-cons-threshold (* 64 1000 1000))
(setq read-process-output-max (* 8 1024 1024))

;;; UI
(setq ef-themes-mixed-fonts t)
(setq ef-themes-variable-pitch-ui t)
(setq ef-themes-headings
      '((0 default 1.2)
	(1 default 1.1)
	(2 default 1.0)
	(3 default 1.0)
	(4 default 1.0)
	(5 default 1.0)
	(6 default 1.0)
	(7 default 1.0)
	(t default 1.0)))

(custom-set-faces
 `(default
   ((t :family "Aporetic Sans Mono"
       :height 170)))
 `(fixed-pitch
   ((t :family "Aporetic Sans Mono"
       :height 150)))
 `(variable-pitch
   ((t :family "Aporetic Serif"
       :height 150)))
 `(fringe ((t :background nil))))

(load-theme 'ef-autumn t)

(global-display-line-numbers-mode -1)

(visual-line-mode -1)
(word-wrap-whitespace-mode)
(recentf-mode)
(savehist-mode)
(save-place-mode)
(global-auto-revert-mode)

(setq use-short-answers t)
(setq mouse-wheel-scroll-amount '(5)
      mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 1
      scroll-margin 0
      maximum-scroll-margin 0
      scroll-preserve-screen-position t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq word-wrap t)
(blink-cursor-mode 0)

;;; Packages
(require 'package)
(require 'use-package)
(setq use-package-always-ensure nil)
(setq inhibit-startup-message t)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(use-package sudo-edit :ensure t)
(use-package vterm :ensure t)
(use-package magit :ensure t)

(setq display-buffer-alist nil)
(setq display-buffer-alist
      '(("\\*compilation\\*"
	 (display-buffer-reuse-mode-window
	  display-buffer-below-selected)
	 (window-height . fit-window-to-buffer))

	("magit: "
	 (display-buffer-same-window))

	("\\*Help\\*"
	 nil
	 (body-function . select-window))

	("\\*Man"
	 nil
	 (body-function . select-window))
	))

(use-package org-tempo
  :ensure nil
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t))

(setq org-agenda-files '("~/.config/emacs/"))

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . 'mc/mark-next-lines)
	 ("C-<" . 'mc/mark-previous-lines))
  :config
  (setq mc/always-run-for-all t)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-previous-lines)
  (add-to-list 'mc/cmds-to-run-once 'mc/mark-next-lines)) 

(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))
(use-package eglot)
(use-package org)
(use-package org-indent :hook org-mode)
(use-package lsp-mode :ensure t)
(use-package lua-mode :ensure t)
(use-package kdl-mode :ensure t)

(use-package evil
  :demand
  :ensure t
  :bind ("<escape>" . keyboard-escape-quit)
  :init
  (setq evil-want-keybinding nil
	;; evil-disable-insert-state-bindings t
	evil-want-C-i-jump t
	evil-want-C-u-scroll t
	evil-undo-system 'undo-fu
	evil-move-beyond-eol nil
	evil-move-cursor-back t)
  :config
  (setq evil-insert-state-cursor '(box))
  (evil-mode 1))

(use-package evil-collection :after evil
  :ensure t
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-org :after evil
  :ensure t
  :hook (org-mode)
  :config
  (require 'evil-org)
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)) 

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (orderless-flex)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(advice-add 'spacious-padding-set-faces
	    :after
	    (lambda () (custom-set-faces `(fringe ((t :background nil))))))

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode 1))

(use-package consult :ensure t)
(use-package vertico
  :ensure t
  :bind (:map vertico-map
	      ("C-w" . 'evil-delete-backward-word))
  :config
  (setq vertico-preselect 'first)
  (vertico-mode)
  (savehist-mode))

(use-package paredit
  :ensure t
  :hook (lisp-mode emacs-lisp-mode))

(use-package enhanced-evil-paredit
  :ensure t
  :hook paredit-mode)

(use-package dabbrev :ensure t)
(use-package transient :ensure t)

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-icon nil
	doom-modeline-major-mode-color-icon nil
	doom-modeline-bar-width 0
	doom-modeline-modal nil))

(keymap-global-set "C-x C-o" 'recentf)

(use-package adaptive-wrap
  :ensure t
  :config
  (setq adaptive-wrap-extra-indent 2)
  (adaptive-wrap-prefix-mode))

;;; LLM
(use-package gptel
  :ensure t
  :config
  (setf (alist-get 'markdown-mode gptel-prompt-prefix-alist) "# ")
  (setf (alist-get 'markdown-mode gptel-response-prefix-alist) "")
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*** ")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "")
  (add-hook 'gptel-mode-hook (lambda () (variable-pitch-mode)))
  (setq rc/gptel-anthropic
	(gptel-make-anthropic "Claude"
	  :stream t
	  :key (getenv "ANTHROPIC_API_KEY")
	  :models '("claude-sonnet-4-0")))
  (setq rc/gptel-mistral
	(gptel-make-openai "MistralLeChat"
	  :host "api.mistral.ai"
	  :stream t
	  :endpoint "/v1/chat/completions"
	  :protocol "https"
	  :key (getenv "MISTRAL_API_KEY")
	  :models '("mistral-large-latest")))
  (setq rc/gptel-deepseek
	(gptel-make-deepseek "Deepseek"
	  :stream t
	  :key (getenv "DEEPSEEK_API_KEY")
	  :models '("deepseek-chat")))
  (setq gptel-default-mode 'org-mode
	gptel-backend rc/gptel-anthropic))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.03)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
	      ("C-SPC" . 'corfu-info-documentation)
	      ("RET" . nil))
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (corfu-history-mode)
  :hook (evil-insert-exit . corfu-quit))

(use-package dired
  :config
  (setq dired-listing-switches "-Alh --group-directories-first"))

(use-package dired-hide-details :hook dired-mode)
(use-package nerd-icons-dired :ensure t :hook dired-mode)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;;; Leader
(define-prefix-command 'evil-leader)
(evil-define-key '(motion normal) 'global
  (kbd "SPC") 'evil-leader)

(evil-define-key 'insert 'global
  (kbd "C-w") 'evil-delete-backward-word)

(evil-define-key 'normal 'global
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  "-"  'project-dired
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

(use-package markdown-mode
  :config
  (setq markdown-header-scaling t)
  (setq markdown-list-indent-width 20))

(evil-set-initial-state 'vterm-mode 'emacs)
(evil-set-initial-state 'gptel-mode 'emacs)
