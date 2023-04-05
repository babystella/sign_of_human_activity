;; Auto-generated. Do not edit!


(when (boundp 'yolact_ros_msgs::Mask)
  (if (not (find-package "YOLACT_ROS_MSGS"))
    (make-package "YOLACT_ROS_MSGS"))
  (shadow 'Mask (find-package "YOLACT_ROS_MSGS")))
(unless (find-package "YOLACT_ROS_MSGS::MASK")
  (make-package "YOLACT_ROS_MSGS::MASK"))

(in-package "ROS")
;;//! \htmlinclude Mask.msg.html


(defclass yolact_ros_msgs::Mask
  :super ros::object
  :slots (_width _height _mask ))

(defmethod yolact_ros_msgs::Mask
  (:init
   (&key
    ((:width __width) 0)
    ((:height __height) 0)
    ((:mask __mask) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _mask __mask)
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:mask
   (&optional __mask)
   (if __mask (setq _mask __mask)) _mask)
  (:serialization-length
   ()
   (+
    ;; int32 _width
    4
    ;; int32 _height
    4
    ;; uint8[] _mask
    (* 1    (length _mask)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _width
       (write-long _width s)
     ;; int32 _height
       (write-long _height s)
     ;; uint8[] _mask
     (write-long (length _mask) s)
     (princ _mask s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _mask
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _mask (make-array n :element-type :char))
     (replace _mask buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get yolact_ros_msgs::Mask :md5sum-) "f8225f014f9a8dbca8b10e8e3685eb8c")
(setf (get yolact_ros_msgs::Mask :datatype-) "yolact_ros_msgs/Mask")
(setf (get yolact_ros_msgs::Mask :definition-)
      "int32 width
int32 height
uint8[] mask # Mask encoded as bitset

")



(provide :yolact_ros_msgs/Mask "f8225f014f9a8dbca8b10e8e3685eb8c")


