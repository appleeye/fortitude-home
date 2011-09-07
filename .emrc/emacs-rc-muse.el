;muse rc
(require 'muse)
(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)
(require 'muse-colors)

;create my project related materials
(muse-derive-style "my-page-html" "html"
                   :header "/home/fortitude/muse/header.tmpl"
                   :footer "/home/fortitude/muse/footer.tmpl")

(setq muse-project-alist
      `(("4nian" 
	 (,@(muse-project-alist-dirs "/home/fortitude/muse")
	  :force-publish ("index" "music" "tech" "reading" "traveling")
	  :default "index")
          ,@(muse-project-alist-styles "/home/fortitude/muse"
				       "/home/fortitude/muse/public_html"
				       "my-page-html"))))

