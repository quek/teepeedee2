(asdf:defsystem :teepeedee2-site
  :name "teepeedee2 site helpers"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking framework"
  :components (
	       (:module :src
			:components (
				     (:file "packages")
				     (:module :ml
					      :components (
							   (:file "output")
							   (:file "object-to-ml" :depends-on ("output"))
							   (:file "define-dtd" :depends-on ("object-to-ml"))
							   (:file "css" :depends-on ("html"))
							   (:file "js" :depends-on ("html"))
							   (:file "html" :depends-on ("define-dtd"))
							   (:file "atom" :depends-on ("define-dtd"))
							   (:file "rss" :depends-on ("define-dtd"))))
				     (:module :datastore
					      :components ((:file "datastore")))
				     (:module :webapp
				     	      :depends-on (:ml)
				     	      :components ( (:file "page" :depends-on ("site"))
				     			   (:file "list-channel" :depends-on ("simple-channel"))
				     			   (:file "simple-channel" :depends-on ("channel"))
				     			   (:file "frame" :depends-on ("names" "list-channel" "simple-channel"))
				     			   (:file "names")
				     			   (:file "html-constants")
				     			   (:file "site" :depends-on ("html-constants"))
				     			   (:file "default-site" :depends-on ("site" "webapp" "js-library"))
				     			   (:file "js-library" :depends-on ("html-constants" "page"))
				     			   (:file "actions" :depends-on ("page" "html-constants" "frame" "site"))
				     			   (:file "channel" :depends-on ("page" "html-constants"))
				     			   (:file "webapp" :depends-on ("actions"))
				     			   (:file "message-channel" :depends-on ("channel")))))))
  :depends-on (:teepeedee2
	       :trivial-garbage
	       :cl-cont
	       :cffi
	       :iterate
	       :alexandria
	       :cl-irregsexp
	       :trivial-backtrace
	       :parenscript))