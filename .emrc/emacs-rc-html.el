;html settings here
;for html mode helper
; Emacs Load Path
(add-to-list 'load-path "~/.emacs.d/html-helper-mode/")
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;(add-to-list 'load-path "~/.emacs.d/weblogger/")
;(require 'weblogger)
(load-file "~/.emacs.d/weblogger/xml-rpc.el")
(load-file "~/.emacs.d/weblogger/weblogger.el")

;(setq weblogger-config-alist (quote (("default" ("Server URL" . "http://blog.4nian.com/xmlrpc.php")  ("Username" . "admin") ("Password" . "19851007") ("Weblog ID" . "1")))))

;Switch to the new org2blog interface to post to my wordpress
 (setq load-path (cons "~/Source/org2blog/" load-path))
 (require 'org2blog-autoloads)
;set my blog info
(setq blog (netrc-machine (netrc-parse "~/.netrc") "wordpress" t))
(setq org2blog/wp-blog-alist
       '(("wordpress"
          :url "http://blog.4nian.com/xmlrpc.php"
          :username (netrc-get blog "login")
	  :password (netrc-get blog "password")
          :default-title "新Blog"
          :default-categories ("编辑利器")
          :tags-as-categories nil)))
(setq org2blog/wp-confirm-post t)


;add my self function to show image in bbs browsing
(defun show-image-url-internal (urladdr)
  "xxxx"
  (interactive)
  (save-excursion
     (if (not (stringp urladdr))
       (error "url invalid,please try again.")
     (require 'url)
     (setq image-buffer (url-retrieve-synchronously urladdr))
     ;(setq image-buffer (url-retrieve-synchronously "http://att.newsmth.net/att.php?p.382.611656.221.jpg"))
     ;(setq image-buffer (url-retrieve-synchronously "http://blog.4nian.com"))
     (if image-buffer
       (save-excursion 
         (set-buffer image-buffer)
	   (goto-char (point-min))
	     (re-search-forward "^$" nil)
	     ;skip the \n character
	     (forward-char)
	     (delete-region (point-min) (point))
	     (image-mode)
	     (switch-to-buffer image-buffer))))))
(defun show-image ()
  (interactive)
  (require 'browse-url)
  (show-image-url-internal (browse-url-url-at-point)))
(defun term-mode-show-image-hook ()
  (local-set-key "\C-ci" 'show-image))
;add the function to the hook in ansi-mode
(add-hook 'term-mode-hook 'term-mode-show-image-hook)


;w3m
(require 'w3m-load)
;;(require 'mime-w3m)
