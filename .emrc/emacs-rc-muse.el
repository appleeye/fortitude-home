;; Muse related extensions are defined here.

(require 'muse)
(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)
(require 'muse-colors)

;; Create my project related materials.
(muse-derive-style "my-page-html" "html"
                   :header "/home/fortitude/muse/header.tmpl"
                   :footer "/home/fortitude/muse/footer.tmpl")
;; For poem entry.
(muse-derive-style "my-poem-html" "html"
                   :header "/home/fortitude/muse/l1_sub_header.tmpl"
                   :footer "/home/fortitude/muse/l1_sub_footer.tmpl")

;; Some symbols named muse-blog-* copied from muse-blog.el.
(muse-derive-style "my-blog-html" "html"
                   :header "/home/fortitude/muse-blog/blog_header.tmpl"
                   :footer "/home/fortitude/muse-blog/blog_footer.tmpl"
                   :date-format 'muse-blog-html-date-format
                   :entry-template 'muse-blog-html-entry-template
                   :before-end 'muse-blog-html-munge-buffer)

;; (muse-derive-style "my-blog-rss" "html"
                   ;; :suffix         'muse-blog-rss-extension
                   ;; :before-end     'muse-blog-rss-munge-buffer
                   ;; :header         'muse-blog-rss-header
                   ;; :footer         'muse-blog-rss-footer
                   ;; :date-format    'muse-blog-rss-date-format
                   ;; :date-format-notime 'muse-blog-rss-date-format
                   ;; :entry-template 'muse-blog-rss-entry-template
                   ;; :base-url       'muse-blog-rss-base-url)

;; Muse blog system
(add-to-list 'load-path "/home/fortitude/Source/muse-blog")
(require 'muse-blog)

(setq muse-project-alist
      `(("4nian" 
	 (,@(muse-project-alist-dirs "/home/fortitude/muse")
;;	  :force-publish ("index" "music" "tech" "reading" "traveling")
	  :default "index")
;;          ,@(muse-project-alist-styles "/home/fortitude/muse"
;;				       "/home/fortitude/muse/public_html"
;;				       "my-page-html")
	  (:base "my-page-html"
		 :path "/home/fortitude/muse/public_html"
		 :include "/home/fortitude/muse/[^/]+$")

	  (:base "my-poem-html"
		 :path "/home/fortitude/muse/public_html/poem"
		 :include "/home/fortitude/muse/poem/[^/]+$")

;;	  ,@(muse-project-alist-styles "/home/fortitude/muse/poem"
;;				       "/home/fortitude/muse/public_html/poem"
;;				       "my-poem-html")
	  )
	("Blog"
	 (,@(muse-project-alist-dirs "/home/fortitude/muse-blog")
	  :force-publish ("index")
	  :default "index")
	 ,@(muse-project-alist-styles "/home/fortitude/muse-blog"
				      ;;same directoy with personal site
				      "/home/fortitude/muse/public_html/blog"
				      "my-blog-html"))))

	;; (:base "blog-xhtml"
	;;        :base-url "http://www.example.com/blog/"
	;;        :path "/home/fortitude/muse/public_html/blog")
	;; (:base "blog-rss"
	;;        :base-url "http://www.example.com/blog/"
	;;        :path "/home/fortitude/muse/public_html/blog")))