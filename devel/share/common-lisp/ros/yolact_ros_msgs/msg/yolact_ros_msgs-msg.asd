
(cl:in-package :asdf)

(defsystem "yolact_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Box" :depends-on ("_package_Box"))
    (:file "_package_Box" :depends-on ("_package"))
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
    (:file "Detections" :depends-on ("_package_Detections"))
    (:file "_package_Detections" :depends-on ("_package"))
    (:file "Mask" :depends-on ("_package_Mask"))
    (:file "_package_Mask" :depends-on ("_package"))
  ))