(setq gc-cons-threshold (* 64 1024 1024))
(setq read-process-output-max (* 8 1024 1024))

(require 'xdg)
(require 'package)
(require 'use-package)

(defmacro expand-xdg-data-home (file)
  (expand-file-name (concat "emacs/" file) (xdg-data-home)))

(setq package-user-dir (expand-file-name "emacs/elpa" (xdg-data-home)))
(startup-redirect-eln-cache (expand-file-name "emacs/eln-cache" (xdg-cache-home)))
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq no-littering-etc-directory (expand-file-name "emacs/etc" (xdg-data-home)))
(setq no-littering-var-directory (expand-file-name "emacs" (xdg-state-home)))
(use-package no-littering :ensure t)

(setq custom-file (expand-file-name "emacs/custom.el" (xdg-state-home)))
(if (file-exists-p custom-file)
    (load custom-file))

(dolist (variable '(initial-frame-alist default-frame-alist))
  (set variable `((horizontal-scroll-bars . nil)
		  (vertical-scroll-bars . nil)
		  (menu-bar-lines . 0)
		  (tool-bar-lines . 0))))
