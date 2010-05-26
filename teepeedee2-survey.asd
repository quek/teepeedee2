(asdf:defsystem :teepeedee2-blog
  :name "teepeedee2"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking framework"
  :components ((:module :survey
			:components ((:file "survey")))
	       )
  :depends-on (:teepeedee2-site))