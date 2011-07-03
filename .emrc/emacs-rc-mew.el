;mew settings here

;used for launch chromium for links in the mail
(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "chromium")

;for browser web link in the mail
(defun my-mew-message-mode-hook ()
  (local-set-key "\C-c\C-b" 'browse-url-at-point))
(add-hook 'mew-message-mode-hook 'my-mew-message-mode-hook)

;common settings
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(setq mew-pop-size 0)
(setq mew-pop-delete nil)

(setq mew-ssl-verify-level 0)

(setq mew-prog-pgp "gpg")
(setq mew-use-cached-passwd t)
(setq mew-passwd-timer-unit 999)
(setq mew-passwd-lifetime 999)

;currently does not use biff
;(setq mew-use-biff t)
;(setq mew-use-biff-bell t)
;(setq mew-biff-interval 3)

;for mail encoding with utf8
(setq mew-charset-m17n "utf-8")
(setq mew-internal-utf-8p t)

;mew summery mode control switch
(setq mew-summary-form
      '(type (5 date) "-----" (14 from) "------" t (0 subj)))
(setq mew-summary-form-extract-rule '(name))

;set reply mode
(setq mew-cite-fields '("Date:"  "From:"))
(setq mew-cite-format "On %s %s wrote:\n\n")
(setq mew-summary-reply-with-citation-position "body")
(setq mew-signature-as-lastpart t)
(setq mew-signature-insert-last t)
(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
(add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)

;display html inside
(setq mew-use-text/html t)
(condition-case nil
    (require 'mew-w3m)
  (file-error nil))

;enhanced config mode
(setq mew-config-alist
     ;setting for gmail pop/smtp
     ;switch to IMAP @ 2011/3/28:22-23
      '((default
	 (proto "%")
	 (inbox-folder "%[Gmail]/所有邮件")
         (imap-server       "imap.gmail.com")
         (imap-ssl          t)
	 (imap-user         "fortitude.zhang")
	 (imap-trash-folder "+trash")
;	 (imap-header-only t)
	 (prog-ssl t)
	 (prog-ssl "/usr/bin/stunnel")
	 (imap-delete     nil)
         (imap-ssl-port     993)
	 (mail-domain   "gmail.com")
         (smtp-server       "smtp.gmail.com")
	 (smtp-ssl t)
	 (smtp-ssl-port     465)
	 (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5"))
	 (smtp-user "fortitude.zhang"))

        (legacy
	 (proto "%")
	 (inbox-folder "%[Gmail]/所有邮件")
         (imap-server       "imap.gmail.com")
         (imap-ssl          t)
	 (imap-user         "asnoka")
	 (imap-trash-folder "+trash-legacy")
;	 (imap-header-only t)
	 (prog-ssl t)
	 (prog-ssl "/usr/bin/stunnel")
	 (imap-delete     nil)
         (imap-ssl-port     993)
	 (mail-domain   "gmail.com")
         (smtp-server       "smtp.gmail.com")
	 (smtp-ssl t)
	 (smtp-ssl-port     465)
	 (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5"))
	 (smtp-user "asnoka")))
)