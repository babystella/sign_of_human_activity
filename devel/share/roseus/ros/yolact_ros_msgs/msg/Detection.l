;; Auto-generated. Do not edit!


(when (boundp 'yolact_ros_msgs::Detection)
  (if (not (find-package "YOLACT_ROS_MSGS"))
    (make-package "YOLACT_ROS_MSGS"))
  (shadow 'Detection (find-package "YOLACT_ROS_MSGS")))
(unless (find-package "YOLACT_ROS_MSGS::DETECTION")
  (make-package "YOLACT_ROS_MSGS::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude Detection.msg.html


(defclass yolact_ros_msgs::Detection
  :super ros::object
  :slots (_class_name _score _distance ))

(defmethod yolact_ros_msgs::Detection
  (:init
   (&key
    ((:class_name __class_name) "")
    ((:score __score) 0.0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _class_name (string __class_name))
   (setq _score (float __score))
   (setq _distance (float __distance))
   self)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; string _class_name
    4 (length _class_name)
    ;; float64 _score
    8
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; float64 _score
       (sys::poke _score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolact_ros_msgs::Detection :md5sum-) "c2e65e978f7598a9c2ca76aa34cae48f")
(setf (get yolact_ros_msgs::Detection :datatype-) "yolact_ros_msgs/Detection")
(setf (get yolact_ros_msgs::Detection :definition-)
      "string class_name
float64 score
float32 distance
")



(provide :yolact_ros_msgs/Detection "c2e65e978f7598a9c2ca76aa34cae48f")


