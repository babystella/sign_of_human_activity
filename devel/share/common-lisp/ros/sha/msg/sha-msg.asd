
(cl:in-package :asdf)

(defsystem "sha-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sha" :depends-on ("_package_sha"))
    (:file "_package_sha" :depends-on ("_package"))
  ))