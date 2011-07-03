;muse rc
(require 'muse)
(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)

;create my project related materials
(muse-derive-style "my-page-html" "html"
                   :header "~/muse/header.tmpl"
                   :footer "~/muse/footer.tmpl")

(setq muse-project-alist
      `(("4nian" 
	 (,@(muse-project-alist-dirs "~/muse")
	  :force-publish ("index" "music" "tech" "reading" "traveling")
	  :default "index")
          ,@(muse-project-alist-styles "~/muse"
				       "~/muse/public_html"
				       "my-page-html"))))

