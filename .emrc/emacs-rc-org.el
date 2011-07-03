;org settings here

;;switch to the dev branch to manage my our modifications.
(add-to-list 'load-path "~/Source/org-mode/lisp")
(add-to-list 'load-path "~/Source/org-mode/contrib/lisp")
(require 'org-install)
;;(require 'org-habbit)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)