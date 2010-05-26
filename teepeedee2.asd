(cl:defpackage #:teepeedee2.system
  (:use #:cl))
(cl:in-package #:teepeedee2.system)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:operate 'asdf:load-op 'cl-fad))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (loop for addon in (remove-if-not 'cl-fad:directory-pathname-p (cl-fad:list-directory "addons"))
	do
	(pushnew addon asdf:*central-registry* :test #'equal)))

#+tpd2-debug
(progn
  (pushnew :tpd2-debug *features*)
  (declaim (optimize debug safety (speed 1)))
  (pushnew :tpd2-debug-assert *features*))

(asdf:defsystem :teepeedee2
  :name "teepeedee2 web server"
  :author "John Fremlin <john@fremlin.org>"
  :version "prerelease"
  :description "Multiprotocol fast networking server"

  :components (
	       (:module :src
			:components (
				     (:file "packages")
				     (:module :lib
					      :depends-on ("packages")
					      :components (
							    (:file "macros" :depends-on ("once-only" "one-liners")) 
							    (:file "once-only")
							    (:file "one-liners")
							    (:file "utils" :depends-on ("macros" "byte-vector"))
							    (:file "superquote" :depends-on ("utils"))
							    (:file "strcat" :depends-on ("macros" "utils"))
							    (:file "my" :depends-on ("macros" "once-only" "strcat" "one-liners"))
							    (:file "byte-vector" :depends-on ("macros"))
							    (:file "callcc" :depends-on ("macros"))
							    (:file "quick-queue" :depends-on ("utils" "my"))
							    (:file "timeout" :depends-on ("quick-queue"))))
				     
				     (:module :io
					       :depends-on (:lib)
					       :components (
							    (:file "socket")
							    (:file "recvbuf" :depends-on ("socket"))
							    (:file "sendbuf" :depends-on ("socket" "syscalls"))
							    (:file "posix-socket" :depends-on ("syscalls" "socket" "con"))
							    (:file "con" :depends-on ("sendbuf" "recvbuf"))
							    (:file "mux" :depends-on ("con"))
							    (:file "epoll" :depends-on ("syscalls" "mux"))
							    (:file "syscalls")
							    (:file "protocol" :depends-on ("socket" "con"))
							    (:file "repeater" :depends-on ("con" "protocol"))
							    (:file "openssl")
							    (:file "ssl" :depends-on ("con" "openssl"))
							    )
					       
					       )

				     (:module :http
					      :depends-on (:lib :io)
					      :components (
							   (:file "encoding")
							   (:file "headers")
							   (:file "dispatcher" :depends-on ("servestate"))
							   (:file "servestate")
							   (:file "serve" :depends-on ("encoding" "headers" "dispatcher"))
							   (:file "request" :depends-on ("headers")))))))
  :depends-on (
	       :trivial-garbage
	       :cl-cont
	       :cffi
	       :iterate
	       :alexandria
	       :cl-irregsexp
	       :trivial-backtrace
	       :parenscript))
