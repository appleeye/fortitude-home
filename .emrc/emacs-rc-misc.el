;; Misc packages and extensions lay here.

;; Remember the session.
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; Isswitchb mode for fast switch between buffers.
(iswitchb-mode 1)
(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Hippie-expand.
(global-set-key (kbd "M-/") 'hippie-expand)

(defun my-kill-buffer (buffer)
  "kill buffer,but filter some special buffer which cannot be killed"
  (if (not (string-equal "\*Pymacs\*" (buffer-name buffer)))
      (kill-buffer buffer)))

(defun kill-all-buffer ()
  "kill all the buffer"
  (interactive)
  (mapcar 'my-kill-buffer (buffer-list))
  ;; When all buffer killed,create the scratch buffer.
  (switch-to-buffer (get-buffer-create "*scratch*")))
(global-set-key [f12] 'kill-all-buffer)

;; Paren match.
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
 ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
 (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)
          
;; Yasnippet settings.
(add-to-list 'load-path "/home/fortitude/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/home/fortitude/.emacs.d/yasnippet-0.6.1c/snippets")

;; Auto comment tools.
(defun insert-comment-start ()
  (interactive)
  (insert "/* Start: Impl. ipv4-labeled-unicast by foritude.zhang @ 2010.*/")
)
(defun insert-comment-stop ()
  (interactive)
  (insert "/* Stop: Impl. ipv4-labeled-unicast by foritude.zhang @ 2010.*/")
)

;; WTF,i will never comment like this way when i code at home.
(global-set-key [f9] 'insert-comment-start)
(global-set-key [f10] 'insert-comment-stop)

;; Ido-mode.
;;(add-to-list 'load-path "/home/fortitude/.emacs.d/ido/")
(require 'ido)
(ido-mode t)

(defun add-space-in-each-line-beginning-of-region(col)
  "Add space in the beginning of each line in a region.
  Usage:
C-u number-of-space-you-want-to M-x add-space-in-lines-begin-for-region.
Of course,you can bind this function to a command such as C-x s,then you can
type C-u 2 C-x s to insert spaces."
  (interactive "P")
  (let* ((rb (region-beginning))
	 (re (region-end))
  	 (lines (count-lines rb re)))
    (goto-char rb)
    (setq col (prefix-numeric-value col))
    (forward-line 0)
    (while (> lines 0)
      (beginning-of-line)
      (insert (make-string col ?\s))
      (forward-line)
      (setq lines (1- lines)))))

;; Load tea-time to get fancy notification:)
(add-to-list 'load-path "/home/fortitude/.emacs.d/tea-time/")
(require 'tea-time)

;; Test:
;;     Load ibus-el to support in-spot input
;;(add-to-list 'load-path "/home/fortitude/.emacs.d/ibus")
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)
