;;misc packages and extensions lay here

;remember the session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;isswitchb mode for fast switch between buffers
(iswitchb-mode 1)
(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

;hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)

(defun kill-all-buffer ()
  "kill all the buffer"
  (interactive)
  (mapcar 'kill-buffer (buffer-list)))
(global-set-key [f12] 'kill-all-buffer)

;paren match
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
 ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
 (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)
          
;yasnippet settings
(add-to-list 'load-path "/home/fortitude/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/home/fortitude/.emacs.d/yasnippet-0.6.1c/snippets")

;auto comment tools
(defun insert-comment-start ()
  (interactive)
  ;comment start
  (insert "/* Start: Impl. ipv4-labeled-unicast by foritude.zhang @ 2010.*/")
)
(defun insert-comment-stop ()
  ;comment stop"
  (interactive)
  (insert "/* Stop: Impl. ipv4-labeled-unicast by foritude.zhang @ 2010.*/")
)

;WTF,i will never comment like this way when i code at home:)
(global-set-key [f9] 'insert-comment-start)
(global-set-key [f10] 'insert-comment-stop)

;ido-mode
(add-to-list 'load-path "/home/fortitude/.emacs.d/ido/")
(require 'ido)
(ido-mode t)