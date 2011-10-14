;; Main emacs configuration files.
;; This file will try to load all kinds specific extensions.

;; Load look and feel rc.
(load "~/.emrc/emacs-rc-look-feel.el")

;; Load org-mode rc.
(load "~/.emrc/emacs-rc-org.el")

;; Load html rc.
(load "~/.emrc/emacs-rc-html.el")

;; Load mew rc
(load "~/.emrc/emacs-rc-mew.el")

;; Load cedet-ecb rc.
(load "~/.emrc/emacs-rc-ecb-cedet.el")

;; load c rc.
(load "~/.emrc/emacs-rc-c.el")

;; Load java rc.
(load "~/.emrc/emacs-rc-java.el")

;; Load muse rc.
(load "~/.emrc/emacs-rc-muse.el")

;; Load net rc.
(load "~/.emrc/emacs-rc-net.el")

;; Load tex rc.
(load "~/.emrc/emacs-rc-tex.el")

;; Load python rc.
(load "~/.emrc/emacs-rc-python.el")

;; Load lisp rc.
(load "~/.emrc/emacs-rc-lisp.el")

;; Load misc rc.
(load "~/.emrc/emacs-rc-misc.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-add-path-for-not-matching-files (quote (nil)) t)
 '(ecb-layout-window-sizes (quote (("my-left-right" (0.14912280701754385 . 0.4772727272727273) (0.14912280701754385 . 0.5) (0.14912280701754385 . 0.4772727272727273) (0.14912280701754385 . 0.25) (0.14912280701754385 . 0.25)))) t)
 '(ecb-options-version "2.40" t)
 '(ecb-source-path (quote ((#("/home/fortitude/org" 0 19 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/home/fortitude/org" 0 19 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))) ("/mnt/work/006-reddit/reddit-git" "reddit-code") ("/mnt/work/007-pylons/mypylonssite/zhamiao" "zhamiao") ("/mnt/work/001-android" "android") ("/mnt/work/007-pylons/wurdig/wurdig" "wurdig-pylons"))))
 '(org-agenda-files (quote ("~/org/201110M.org")))
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
