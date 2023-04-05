;; Auto-generated. Do not edit!


(when (boundp 'yolact_ros_msgs::Detections)
  (if (not (find-package "YOLACT_ROS_MSGS"))
    (make-package "YOLACT_ROS_MSGS"))
  (shadow 'Detections (find-package "YOLACT_ROS_MSGS")))
(unless (find-package "YOLACT_ROS_MSGS::DETECTIONS")
  (make-package "YOLACT_ROS_MSGS::DETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude Detections.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass yolact_ros_msgs::Detections
  :super ros::object
  :slots (_header _detections ))

(defmethod yolact_ros_msgs::Detections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detections __detections) (let (r) (dotimes (i 0) (push (instance yolact_ros_msgs::Detection :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _detections __detections)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; yolact_ros_msgs/Detection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; yolact_ros_msgs/Detection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; yolact_ros_msgs/Detection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance yolact_ros_msgs::Detection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get yolact_ros_msgs::Detections :md5sum-) "5db611666d45d8d848cb4cb82bf5a86e")
(setf (get yolact_ros_msgs::Detections :datatype-) "yolact_ros_msgs/Detections")
(setf (get yolact_ros_msgs::Detections :definition-)
      "Header header
Detection[] detections

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: yolact_ros_msgs/Detection
string class_name
float64 score
float32 distance
")



(provide :yolact_ros_msgs/Detections "5db611666d45d8d848cb4cb82bf5a86e")


