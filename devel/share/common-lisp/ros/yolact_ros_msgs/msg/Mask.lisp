; Auto-generated. Do not edit!


(cl:in-package yolact_ros_msgs-msg)


;//! \htmlinclude Mask.msg.html

(cl:defclass <Mask> (roslisp-msg-protocol:ros-message)
  ((width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (mask
    :reader mask
    :initarg :mask
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Mask (<Mask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolact_ros_msgs-msg:<Mask> is deprecated: use yolact_ros_msgs-msg:Mask instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolact_ros_msgs-msg:width-val is deprecated.  Use yolact_ros_msgs-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolact_ros_msgs-msg:height-val is deprecated.  Use yolact_ros_msgs-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'mask-val :lambda-list '(m))
(cl:defmethod mask-val ((m <Mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolact_ros_msgs-msg:mask-val is deprecated.  Use yolact_ros_msgs-msg:mask instead.")
  (mask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mask>) ostream)
  "Serializes a message object of type '<Mask>"
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mask))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'mask))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mask>) istream)
  "Deserializes a message object of type '<Mask>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mask) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mask)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mask>)))
  "Returns string type for a message object of type '<Mask>"
  "yolact_ros_msgs/Mask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mask)))
  "Returns string type for a message object of type 'Mask"
  "yolact_ros_msgs/Mask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mask>)))
  "Returns md5sum for a message object of type '<Mask>"
  "f8225f014f9a8dbca8b10e8e3685eb8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mask)))
  "Returns md5sum for a message object of type 'Mask"
  "f8225f014f9a8dbca8b10e8e3685eb8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mask>)))
  "Returns full string definition for message of type '<Mask>"
  (cl:format cl:nil "int32 width~%int32 height~%uint8[] mask # Mask encoded as bitset~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mask)))
  "Returns full string definition for message of type 'Mask"
  (cl:format cl:nil "int32 width~%int32 height~%uint8[] mask # Mask encoded as bitset~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mask>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mask) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mask>))
  "Converts a ROS message object to a list"
  (cl:list 'Mask
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':mask (mask msg))
))
