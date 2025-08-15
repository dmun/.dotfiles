(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

(custom-set-faces
 '(default ((t :family "Iosevka SS14" :height 180)))
 '(fixed-pitch ((t :family "Iosevka SS14")))
 '(variable-pitch ((t :family "Aporetic Serif")))
 '(line-number ((t :background nil)))
 '(line-number-current-line ((t :background nil)))
 '(fringe ((t :background nil)))
 '(default ((t :foreground "white")))
 '(corfu-border ((t :background nil))))

(defun my/custom-faces ()
  "Theme tweaks that require references to other colors."
  (let ((active-bg (face-attribute 'mode-line :background))
        (inactive-bg (face-attribute 'mode-line-inactive :background)))
    (set-face-attribute 'mode-line nil
                        :box `(:line-width 4 :color ,active-bg))
    (set-face-attribute 'mode-line-inactive nil
                        :box `(:line-width 4 :color ,inactive-bg))))

(visual-line-mode -1)
(pixel-scroll-precision-mode)
(word-wrap-whitespace-mode)
(use-package whitespace-mode
  :hook (prog-mode text-mode)
  :init
  (setq whitespace-style '(face tabs tab-mark)))
(blink-cursor-mode 0)
;; (set-fringe-style 0)

(use-package show-font :ensure t)

(use-package ef-themes :ensure t
  :config
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
  (setq modus-themes-mode-line '(accented borderless padded))
  (load-theme 'ef-autumn t))

(global-display-line-numbers-mode -1)
(use-package display-line-numbers
  :disabled
  :hook (prog-mode conf-mode))

(use-package spacious-padding
  :disabled
  :ensure t
  :config
  (spacious-padding-mode 1))

(setq display-buffer-alist
      '(("\\*compilation\\*"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
         (window-height . 12)
         (body-function . select-window))

        ("magit: "
         (display-buffer-same-window))

        ((derived-mode . help-mode)
         nil
         (body-function . select-window))

        ((derived-mode . help-mode)
         nil
         (body-function . select-window))

        ("\\*Man"
         nil
         (body-function . select-window))))

(setq compilation-scroll-output t)

(use-package orderless
  :ensure t
  :custom
  (orderless-flex)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package colorful-mode
  :ensure t
  :config
  (global-colorful-mode))

(use-package consult :ensure t)
(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-w" . 'evil-delete-backward-word))
  :config
  (setq vertico-preselect 'first)
  (vertico-mode))

(use-package doom-modeline
  :disabled
  :ensure t
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-icon nil
        doom-modeline-major-mode-color-icon nil
        doom-modeline-height 20
        doom-modeline-bar-width 0
        doom-modeline-modal nil))

(use-package adaptive-wrap
  :ensure t
  :config
  (setq adaptive-wrap-extra-indent 2)
  (adaptive-wrap-prefix-mode))

(use-package visual-line :hook org-mode)
(use-package variable-pitch :hook (gptel-mode help-mode))

(use-package transient :ensure t)
;; (setq completions-preview-minimum-symbol 2)
;; (global-completion-preview-mode)

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.03)
  (corfu-quit-no-match 'separator)
  (corfu-max-width 36)
  ;; (corfu-min-width 36)
  :bind (:map corfu-map
         ("C-SPC" . 'corfu-info-documentation)
         ("RET" . nil))
  :init
  (setq corfu-count 6)
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (corfu-history-mode)
  :hook (evil-insert-exit . corfu-quit))
