(asdf:defsystem :teepeedee2-game
  :name "teepeedee2 games"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking framework"
  :components (
	       (:module :src
			:components (
				     (:file "packages")
				     (:module :game
					      :components (
							   (:file "generic")
							   (:file "framework" :depends-on ("generic")) 
							   (:file "controllers" :depends-on ("framework"))
							   (:file "card")
							   (:file "coins" :depends-on ("framework"))
							   (:file "unassigned-controller" :depends-on ("controllers"))
							   (:file "web" :depends-on ("card" "controllers" "unassigned-controller"))
							   (:file "web-messages" :depends-on ("web"))))
				     (:module :small-games
					      :depends-on (:game)
					      :components (
							   (:file "nash-bargain") 
							   (:file "prisoners-dilemma") 
							   (:file "ultimatum")
							   (:file "roshambo"))))))
  :depends-on (:teepeedee2-site))