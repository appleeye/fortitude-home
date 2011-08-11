;net related functions and commands will be put here

;;;;;;;;;;;;;;;;;;;;;;;;;;;USER SPEFICIED VARIABLE HERE;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *ftp-process* nil)
(setq 4nian.com (netrc-machine (netrc-parse "~/.netrc") "www.4nian.com" t))
(defvar *ftp-user* (netrc-get 4nian.com "login"))
(defvar *ftp-host* "www.4nian.com")
(defvar *ftp-password* (netrc-get 4nian.com "password"))

;better to use float number,cause we using float-time func which return float value
(defconst *ftp-max-timeout* 100.0)
(defvar *ftp-last-action-time* 0)

;remote path and local path
(defconst *ftp-HOME* "~/muse/public_html/")
(defconst *ftp-WEB* "/domains/4nian.com/public_html/zdy/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ACTUALL WRAPPER,CORE FUNCTIONS;;;;;;;;;;;;;;;;;;;;;
;ange-ftp wrapper
(require 'ange-ftp)

(defun ftp-has-timed-out-p ()
  (> (- (float-time (current-time)) *ftp-last-action-time*)
     *ftp-max-timeout*))

(defun ftp-set-last-action-time ()
  (setq *ftp-last-action-time* (float-time (current-time))))

(defun ftp-connected-p (proc)
  (and proc
       (equal (process-status proc) 'run)
       (ftp-has-timed-out-p)))

(defun ftp-connect (host user)
  (when (ftp-has-timed-out-p)
    (ftp-kill-process host user *ftp-process*)
    (sit-for 0)
    (sleep-for 1))
  (when (not (ftp-connected-p *ftp-process*))
    (setq *ftp-process* 
	  (ange-ftp-get-process host user))
    (ange-ftp-set-binary-mode host user))
  (ftp-set-last-action-time)
  ;return process
  *ftp-process*)

(defun ftp-kill-process (host user proc)
  (when (ftp-connected-p proc)
    (kill-process proc)
    (setq proc nil)
    (set-buffer (get-buffer (ange-ftp-ftp-process-buffer host user)))
    (insert "\nTerminated"))
  nil)


(defun ftp-raw-send-cmd-wrapper (cmd)
  (let ((proc (ftp-connect *ftp-host* *ftp-user*)))
    (message "send cmd to ftp server %s" cmd)
    (ange-ftp-raw-send-cmd proc cmd)
    (ftp-set-last-action-time))
  t)

(defun ftp-copy-file (from to)
  (ftp-raw-send-cmd-wrapper
   (format "put %s %s" (expand-file-name from) to)))

(defun ftp-mkdir (dir)
  (ftp-raw-send-cmd-wrapper (format "mkdir %s" dir)))

(defun ftp-upload-file (from)
  (setq file-name (file-name-nondirectory from))
  (setq to (concat *ftp-WEB* file-name))
  (ftp-copy-file from to))

(defun ftp-upload-buf-file (from buffname)
  (setq to (concat *ftp-WEB* buffname))
  (ftp-copy-file from to))

;i copy this function from gnu emacs lisp manual,'cause directory files cannot process regex correctly,as least
;on my machine,so i use this function to substitute it
(defun files-in-below-directory (user-directory fileregxp)
       ;; Although the function will be used non-interactively,
       ;; it will be easier to test if we make it interactive.
       ;; The directory will have a name such as
       ;;  "/usr/local/share/emacs/22.1.1/lisp/"
       (let (files-list
             (current-directory-list
              (directory-files-and-attributes user-directory t)))
         ;; while we are in the current directory
         (while current-directory-list
           (cond
	    ;;check suffix using regexp
            ;; and if so, append its name to a list.
            ((string-match fileregxp (car (car current-directory-list)))
             (setq files-list
                   (cons (car (car current-directory-list)) files-list)))
            ;; check whether filename is that of a directory
            ((eq t (car (cdr (car current-directory-list))))
             ;; decide whether to skip or recurse
             (if
                 (equal "."
                        (substring (car (car current-directory-list)) -1))
                 ;; then do nothing since filename is that of
                 ;;   current directory or parent, "." or ".."
		 ;; substring is enough to handle both "." and ".."
                 ()
               ;; else descend into the directory and repeat the process
               (setq files-list
                     (append
                      (files-in-below-directory
                       (car (car current-directory-list))
		       fileregxp)
                      files-list)))))
           ;; move to the next filename in the list; this also
           ;; shortens the list so the while loop eventually comes to an end
           (setq current-directory-list (cdr current-directory-list)))
         ;; return the filenames
         files-list))

;;;;;;;;;;;;;;;;;;;;;;;;PUT CUSTUM PERSONAL FUNCTION HERE;;;;;;;;;;;;;;;;;;;;;;;;
(defun ftp-upload-current-file ()
  (interactive)
  (ftp-upload-buf-file (expand-file-name (buffer-file-name)) (buffer-name)))

(defun ftp-upload-my-html ()
  (interactive)
  (setq html-list (files-in-below-directory *ftp-HOME* "\.html$"))
  (if html-list
      (let ()
	(message "uploading files...")
	(mapcar 'ftp-upload-file html-list))
    (message "no html files found:(")))