;java setting here

(defun my-java-mode-common-hook ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '((?\(()_ ")" )
			       (?\[()_ "]")
			       (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (setq tab-width 4
	c-basic-offset 4
	indent-tabs-mode nil
	default-tab-width 4))
(add-hook 'java-mode-hook 'my-java-mode-common-hook)