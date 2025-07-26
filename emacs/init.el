(setq custom-file "~/.emacs.custom")
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)
;; (delete-selection-mode)

(if (and (fboundp 'native-comp-available-p) (native-comp-available-p))
    (message "Native compilation is available")
  (message "Native compilation is NOT available"))
(setq gc-cons-threshold (* 50 1000 1000))
(setq read-process-output-max (* 4 1024 1024))

;;; Theme
(setq modus-themes-common-palette-overrides '((fringe unspecified)))
(load-theme 'modus-vivendi)
(set-face-attribute 'default nil :family "Iosevka SS11" :height 180)
(set-face-attribute 'fixed-pitch nil :family "Iosevka SS11" :height 150)
(set-face-attribute 'variable-pitch nil :family "Aporetic Serif" :height 150)

(global-display-line-numbers-mode -1)

(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq mouse-wheel-scroll-amount '(5)
      mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 0)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq yes-or-no-p 'y-or-n-p)
(setq word-wrap t)
(blink-cursor-mode 0)

;;; Packages
(require 'package)
(require 'use-package)
(setq use-package-always-ensure t)
(setq inhibit-startup-message t)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(use-package sudo-edit)
(use-package vterm)

(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))
(use-package eglot)
(use-package org)
(use-package lsp-mode)
(use-package lua-mode)
;; (use-package avy
;;   :bind ("C-;" . 'avy-goto-char-2))

(use-package evil
  :demand
  :bind ("<escape>" . keyboard-escape-quit)
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-fu)
  :config
  (setq evil-insert-state-cursor '(box))
  (add-to-list 'desktop-locals-to-save 'evil-markers-alist)
  (cl-pushnew 'evil-markers-alist desktop-locals-to-save)
  (evil-mode 1))

(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(use-package evil-collection :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package consult)
(use-package vertico
  :init
  (vertico-mode)
  (savehist-mode))

(use-package paredit
  :hook (lisp-mode . paredit-mode))

(use-package enhanced-evil-paredit
  :hook (paredit-mode . enhanced-evil-paredit-mode))

(use-package dabbrev)
(use-package transient)

(set-face-attribute 'mode-line nil
        :box '(:line-width 1 :color "slate gray" :style nil))
(set-face-attribute 'mode-line-inactive nil
        :box '(:line-width 1 :color "SlateGray4" :style nil))
(use-package doom-modeline
  :init
  (setq doom-modeline-icon t)
  (setq doom-modeline-height 36)
  (setq doom-modeline-bar-width 1)
  (setq doom-modeline-major-mode-color-icon nil)
  (setq doom-modeline-spc-face-overrides (list :family (face-attribute 'fixed-pitch :family)))
  (set-face-attribute 'doom-modeline-bar nil)
  (doom-modeline-mode 1))

(global-set-key (kbd "C-x C-o") 'recentf)

;;; LLM
(use-package gptel
  :config
  (setf (alist-get 'markdown-mode gptel-prompt-prefix-alist) "# ")
  (setf (alist-get 'markdown-mode gptel-response-prefix-alist) "")
  (add-hook 'gptel-mode-hook (lambda () (variable-pitch-mode)))
  (gptel-make-openai "MistralLeChat"
    :host "api.mistral.ai"
    :endpoint "/v1/chat/completions"
    :protocol "https"
    :key (getenv "MISTRAL_API_KEY")
    :models '("mistral-small"))
  (setq gptel-model 'deepseek-chat
   gptel-default-mode 'markdown-mode
   gptel-backend (gptel-make-deepseek "Deepseek"
                  :stream t
                  :key (getenv "DEEPSEEK_API_KEY"))))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
        ;; ("C-j" . corfu-next)
        ;; ("C-k" . corfu-previous)
         ("RET" . nil))
  :init
  (global-corfu-mode 1)
  (corfu-history-mode 1))

(use-package which-key
  :init
  (setq doom-modeline-modal nil)
  (setq doom-modeline-spc-face-overrides 'fixed-pitch)
  (which-key-mode))

;;; Leader
(define-prefix-command 'my-leader-map)
(keymap-set evil-motion-state-map "SPC" 'my-leader-map)
(keymap-set evil-normal-state-map "SPC" 'my-leader-map)
(keymap-set evil-motion-state-map "j" 'evil-next-visual-line)
(keymap-set evil-motion-state-map "k" 'evil-previous-visual-line)
;; (keymap-set evil-insert-state-map "C-w" 'evil-delete-backward-word)

(evil-define-key 'normal 'global
  "-"  'project-dired
  "g/" 'consult-grep
  "gs" 'consult-outline
  "gl" 'evil-end-of-line
  "gh" 'evil-first-non-blank
  "gw" 'other-window)

;; (global-set-key (kbd "C-x C-a") 'vterm)
(evil-define-key nil my-leader-map
  "t"  'vterm
  "c"  'gptel
  "g"  'magit
  "e"  'find-file
  "f"  'project-find-file
  "b"  'switch-to-buffer
  "o"  'recentf
  "pf" 'project-switch-project
  "ps" 'shell-command)

(setq markdown-header-scaling t)
(setq markdown-list-indent-width 20)

(evil-set-initial-state 'vterm-mode 'emacs)
(evil-set-initial-state 'gptel-mode 'emacs)
