;////////////////////////////////////////////////NOTES BEGIN/////////////////////////////////
;AUTHOR:fortitude.zhang@gmail.com
;COMMENT STYLE: use 1 semicolon to start comment.
;ELISP STYLE: use 2 space to seperate code,close bracket should follow the last sentence.
;BLOCK MARK:use ///// style to start/end block
;////////////////////////////////////////////////NOTES END///////////////////////////////////

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

;load net
(load "~/.emrc/emacs-rc-net.el")

;load tex
(load "~/.emrc/emacs-rc-tex.el")

;load python
(load "~/.emrc/emacs-rc-python.el")

;load misc
(load "~/.emrc/emacs-rc-misc.el")

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
