;c setting here
;offset customizations not in my-c-style
;This will take precedence over any setting of the syntactic symbol
;made by a style.
(setq c-offsets-alist '((member-init-intro . ++)))

;Create my personal style.
(defconst my-c-style
  '((c-tab-always-indent . t)
    (c-comment-only-line-offset . 2)
    (c-hanging-colons-alist . ((member-init-intro before)
                                         (inher-intro)
					 (case-label after)
					 (label after)
					 (access-label after)))
    (c-cleanup-list .  (scope-operator
			     empty-defun-braces
			     defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
			     (substatement . 0)
			     (substatement-open . 0)
			     (statement-cont . 0)
			     (case-label . 2)
			     (block-open . 0)
			     (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

(defun my-c-mode-common-hook ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '((?\(()_ ")" )
			                 (?\[()_ "]")
					 ;{} auto complete is very usefull for me :)
					 (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  ;currently change to gnu mode,'cause i am working on quagga:\)
  (c-set-style "gnu")
  (setq tab-width 2
	c-basic-offset 2
	indent-tabs-mode nil))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cb" 'semantic-mrub-switch-tags)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
  ;(local-set-key "." 'semantic-complete-self-insert)
  ;(local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ch" 'eassist-switch-h-cpp)
  (local-set-key "\C-cm" 'eassist-list-methods)
  (local-set-key "\C-cr" 'semantic-symref))
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)