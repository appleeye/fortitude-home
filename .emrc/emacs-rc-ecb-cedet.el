;ecb+cedet settings put here
(setq ecb-options-version "2.40")

;here comes cedet settings
(semantic-load-enable-excessive-code-helpers)

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)

(require 'semantic-decorate-include)


;smart complications
(require 'semantic-ia)

(setq-mode-local c-mode semanticdb-find-default-throttle
                  '(project unloaded system recursive))

(require 'eassist)

;; hooks, specific for semantic
(defun alexott/semantic-hook ()
  ;(semantic-tag-folding-mode 1)
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'alexott/semantic-hook)

;(global-semantic-idle-tag-highlight-mode 1)

;ctags
;(require 'semanticdb-ectag)
;(semantic-load-enable-primary-exuberent-ctags-support)
(require 'semanticdb-cscope)

;ede customization
(require 'semantic-lex-spp)
(global-ede-mode t)

;fast jump and restore
(global-set-key [f7] 'semantic-ia-fast-jump)
(global-set-key [f8] 'semantic-mrub-switch-tags)

;here comes ecb settings

;ecb layout setting
(setq ecb-layout-name "my-left-right")
(setq  ecb-layout-window-sizes (quote (("my-left-right" (0.10964912280701754 . 0.4772727272727273) (0.10964912280701754 . 0.5) (0.15350877192982457 . 0.4772727272727273) (0.15350877192982457 . 0.25) (0.15350877192982457 . 0.25)))))

;donnot automaticall include path to ecb,only the required by call ecb-add-source-path explicitely
(setq ecb-add-path-for-not-matching-files nil)

(setq semanticdb-project-roots 
      (list
       (expand-file-name "/")))

(ede-cpp-root-project "Quagga"
                :name "quagga"
                :file "~/Source/quagga/TODO"
                :include-path '("/"
                                "/bgpd/"
                                "/Iib/"
                                "/zebra/"
                               )
		:spp-table '(("HAVE_CONFIG_H" . "")))

(ede-cpp-root-project "wireshark"
		      :name "wireshark"
		      :file "~/Source/wireshark/README"
		      :include-path '("/"
				      "/epan"
				      "/epan/dissectors"
				      ))

(ede-cpp-root-project "emacs"
		      :name "emacs"
		      :file "~/Source/emacs23-src/README")
		      

