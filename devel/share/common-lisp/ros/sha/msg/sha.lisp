; Auto-generated. Do not edit!


(cl:in-package sha-msg)


;//! \htmlinclude sha.msg.html

(cl:defclass <sha> (roslisp-msg-protocol:ros-message)
  ((old_framescore_pub
    :reader old_framescore_pub
    :initarg :old_framescore_pub
    :type cl:float
    :initform 0.0)
   (old_variance_pub
    :reader old_variance_pub
    :initarg :old_variance_pub
    :type cl:float
    :initform 0.0))
)

(cl:defclass sha (<sha>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sha>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sha)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sha-msg:<sha> is deprecated: use sha-msg:sha instead.")))

(cl:ensure-generic-function 'old_framescore_pub-val :lambda-list '(m))
(cl:defmethod old_framescore_pub-val ((m <sha>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sha-msg:old_framescore_pub-val is deprecated.  Use sha-msg:old_framescore_pub instead.")
  (old_framescore_pub m))

(cl:ensure-generic-function 'old_variance_pub-val :lambda-list '(m))
(cl:defmethod old_variance_pub-val ((m <sha>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sha-msg:old_variance_pub-val is deprecated.  Use sha-msg:old_variance_pub instead.")
  (old_variance_pub m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sha>) ostream)
  "Serializes a message object of type '<sha>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'old_framescore_pub))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'old_variance_pub))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sha>) istream)
  "Deserializes a message object of type '<sha>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_framescore_pub) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_variance_pub) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sha>)))
  "Returns string type for a message object of type '<sha>"
  "sha/sha")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sha)))
  "Returns string type for a message object of type 'sha"
  "sha/sha")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sha>)))
  "Returns md5sum for a message object of type '<sha>"
  "6d9c7de78367f107912b0affe8137d22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sha)))
  "Returns md5sum for a message object of type 'sha"
  "6d9c7de78367f107912b0affe8137d22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sha>)))
  "Returns full string definition for message of type '<sha>"
  (cl:format cl:nil "float64 old_framescore_pub~%float64 old_variance_pub~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sha)))
  "Returns full string definition for message of type 'sha"
  (cl:format cl:nil "float64 old_framescore_pub~%float64 old_variance_pub~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sha>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sha>))
  "Converts a ROS message object to a list"
  (cl:list 'sha
    (cl:cons ':old_framescore_pub (old_framescore_pub msg))
    (cl:cons ':old_variance_pub (old_variance_pub msg))
))
