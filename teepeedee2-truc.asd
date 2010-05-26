(asdf:defsystem :teepeedee2-truc
  :name "teepeedee2"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking framework"
  :components ((:module :truc
			:components ( (:file "truc") (:file "web" :depends-on ("truc"))
				      (:file "robots" :depends-on ("truc")))))
  :depends-on (:teepeedee2-site))