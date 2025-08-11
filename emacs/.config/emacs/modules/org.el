(use-package org
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-agenda-files '("~/.config/emacs/"))
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))

(use-package org-indent :hook org-mode)
(use-package org-tempo)
(use-package org-habit)
