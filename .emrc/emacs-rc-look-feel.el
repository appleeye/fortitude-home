;look and feel settings here

;line number
(line-number-mode 0)
(global-linum-mode 1)

;disable splash screen
(setq inhibit-splash-screen t)

;color theme
(color-theme-initialize)
(color-theme-calm-forest)

;UTF-8 settings
(setq current-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(add-to-list 'default-frame-alist '(font . "文泉驿等宽微米黑:12"))
;enable xft font-backend,must be set in the Xresource file in order to 
;make effect in the first frame
(add-to-list 'default-frame-alist '(font-backend . "xft"))

;startup maximize
(defun toggle-fullscreen ()
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(toggle-fullscreen)

;;enable word wrap
;;(global-visual-line-mode t)
