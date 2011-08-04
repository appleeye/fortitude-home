;////////////////////////////////////////////////NOTES BEGIN/////////////////////////////////
;AUTHOR:fortitude.zhang@gmail.com
;COMMENT STYLE: use one  semicolon to start comment.
;ELISP STYLE: use 2 space to seperate code,close bracket should follow the last sentence.
;BLOCK MARK:use ///// style to start/end block
;////////////////////////////////////////////////NOTES END///////////////////////////////////

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
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

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

;////////////////////////////////LOAD RC////////////////////////////////////////////////
;load look and feel rc
(load "~/.emrc/emacs-rc-look-feel.el")

;load org-mode rc
(load "~/.emrc/emacs-rc-org.el")

;load html rc
(load "~/.emrc/emacs-rc-html.el")

;load mew rc
(load "~/.emrc/emacs-rc-mew.el")

;load cedet-ecb rc
(load "~/.emrc/emacs-rc-ecb-cedet.el")

;load c rc
(load "~/.emrc/emacs-rc-c.el")

;load java rc
(load "~/.emrc/emacs-rc-java.el")

;load muse
(load "~/.emrc/emacs-rc-muse.el")

;////////////////////////////////LOAD RC END///////////////////////////////////////////

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-add-path-for-not-matching-files (quote (nil)) t)
 '(ecb-layout-window-sizes (quote (("my-left-right" (0.14912280701754385 . 0.4772727272727273) (0.14912280701754385 . 0.5) (0.14912280701754385 . 0.4772727272727273) (0.14912280701754385 . 0.25) (0.14912280701754385 . 0.25)))) t)
 '(ecb-options-version "2.40" t)
 '(ecb-source-path (quote ((#("/home/fortitude/org" 0 19 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/home/fortitude/org" 0 19 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))) ("/mnt/work/006-reddit/reddit-git" "reddit-code") ("/mnt/work/007-pylons/mypylonssite/zhamiao" "zhamiao") ("/mnt/work/001-android" "android") ("/mnt/work/007-pylons/wurdig/wurdig" "wurdig-pylons"))))
 '(org-agenda-files (quote ("~/org/201108M.org")))
 '(weblogger-config-alist (quote (("default" "http://blog.4nian.com/xmlrpc.php" "admin" "" "1")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
