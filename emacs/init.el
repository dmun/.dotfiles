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
(setq modus-themes-common-palette-overrides '((fringe unspecified)))
(load-theme 'ef-autumn)
(set-face-attribute 'default nil :family "Iosevka SS11" :height 170)
(set-face-attribute 'fixed-pitch nil :family "Iosevka SS11" :height 140)
(set-face-attribute 'modus-themes-fixed-pitch nil :family "Iosevka SS11" :height 140)
(set-face-attribute 'variable-pitch nil :family "Aporetic Serif" :height 140)
(set-face-attribute 'fringe nil :foreground (face-attribute 'shadow :foreground))

(global-display-line-numbers-mode -1)

(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq mouse-wheel-scroll-amount '(5)
      mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 1)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq yes-or-no-p 'y-or-n-p)
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

(use-package org-bullets
  :ensure t
  :hook (org-mode))

(use-package org-tempo
  :ensure nil
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t))

(custom-theme-set-faces 'user '(org-indent ((t (:inherit (org-hide fixed-pitch))))))
(custom-theme-set-faces
 'user
 '(org-level-8 ((t (,@headline ,@variable-tuple))))
 '(org-level-7 ((t (,@headline ,@variable-tuple))))
 '(org-level-6 ((t (,@headline ,@variable-tuple))))
 '(org-level-5 ((t (,@headline ,@variable-tuple))))
 '(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
 '(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
 '(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
 '(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
 '(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))

(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))
(use-package eglot :ensure t)
(use-package org :ensure t)
(use-package lsp-mode :ensure t)
(use-package lua-mode :ensure t)

(use-package evil
  :demand
  :ensure t
  :bind ("<escape>" . keyboard-escape-quit)
  :init
  (setq evil-want-keybinding nil
  ;; evil-disable-insert-state-bindings t
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

(defun rc/disable-window-fringes ()
  (set-window-fringes (selected-window) 0 0))
;; (add-hook 'minibuffer-setup-hook #'rc/disable-window-fringes)

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode))

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
  :hook ((lisp-mode emacs-lisp-mode) . paredit-mode))

(use-package enhanced-evil-paredit
  :ensure t
  :hook (paredit-mode))

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
  (word-wrap-whitespace-mode)
  (setq adaptive-wrap-extra-indent 2)
  (adaptive-wrap-prefix-mode))

;;; LLM
(use-package gptel
  :ensure t
  :config
  (setf (alist-get 'markdown-mode gptel-prompt-prefix-alist) "# ")
  (setf (alist-get 'markdown-mode gptel-response-prefix-alist) "")
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*** ")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "\n")
  (add-hook 'gptel-mode-hook (lambda () (variable-pitch-mode)))
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
   gptel-backend rc/gptel-mistral))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.03)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
         ("RET" . nil))
  :init
  (global-corfu-mode 1)
  (corfu-history-mode 1)
  :hook (evil-insert-exit . corfu-quit))

(use-package which-key
  :ensure t
  :config
  (which-key-mode -1))

;;; Leader
(define-prefix-command 'evil-leader)

(evil-define-key '(motion normal) 'global
  (kbd "SPC") 'evil-leader
  (kbd "SPC") 'evil-leader
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line)

(evil-define-key 'insert 'global
  (kbd "C-w") 'evil-delete-backward-word)

(evil-define-key 'normal 'global
  "-"  'project-dired
  "g/" 'consult-grep
  "gs" 'consult-outline
  "gl" 'evil-end-of-line
  "gh" 'evil-first-non-blank
  "gw" 'other-window)

(evil-define-key nil evil-leader
  "t"  'vterm
  "h"  'customize-face
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
