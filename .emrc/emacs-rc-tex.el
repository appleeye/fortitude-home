;;tex settings here

;;auc tex 	
(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(defun my-auctex-hook ()
  (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex %(mode) %t" TeX-run-TeX nil (latex-mode)))
  (setq TeX-command-default "XeLaTeX")
  (setq TeX-save-query  nil )
  (setq TeX-show-compilation t)
  (setq TeX-PDF-mode t))

(add-hook 'TeX-mode-hook 'my-auctex-hook)
