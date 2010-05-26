(asdf:defsystem :teepeedee2-blog
  :name "teepeedee2 blog"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking framework"
  :components (
	       (:module :src
			:components (
				     (:file "packages")
				     (:module :blog
					      :components ((:file "entry")
							   (:file "feed" :depends-on ("blog"))
							   (:file "blog" :depends-on ("entry")))))))
  :depends-on (:teepeedee2-site))