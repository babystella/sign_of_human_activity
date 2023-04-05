;; Auto-generated. Do not edit!


(when (boundp 'sha::sha)
  (if (not (find-package "SHA"))
    (make-package "SHA"))
  (shadow 'sha (find-package "SHA")))
(unless (find-package "SHA::SHA")
  (make-package "SHA::SHA"))

(in-package "ROS")
;;//! \htmlinclude sha.msg.html


(defclass sha::sha
  :super ros::object
  :slots (_old_framescore_pub _old_variance_pub ))

(defmethod sha::sha
  (:init
   (&key
    ((:old_framescore_pub __old_framescore_pub) 0.0)
    ((:old_variance_pub __old_variance_pub) 0.0)
    )
   (send-super :init)
   (setq _old_framescore_pub (float __old_framescore_pub))
   (setq _old_variance_pub (float __old_variance_pub))
   self)
  (:old_framescore_pub
   (&optional __old_framescore_pub)
   (if __old_framescore_pub (setq _old_framescore_pub __old_framescore_pub)) _old_framescore_pub)
  (:old_variance_pub
   (&optional __old_variance_pub)
   (if __old_variance_pub (setq _old_variance_pub __old_variance_pub)) _old_variance_pub)
  (:serialization-length
   ()
   (+
    ;; float64 _old_framescore_pub
    8
    ;; float64 _old_variance_pub
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _old_framescore_pub
       (sys::poke _old_framescore_pub (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _old_variance_pub
       (sys::poke _old_variance_pub (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _old_framescore_pub
     (setq _old_framescore_pub (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _old_variance_pub
     (setq _old_variance_pub (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sha::sha :md5sum-) "6d9c7de78367f107912b0affe8137d22")
(setf (get sha::sha :datatype-) "sha/sha")
(setf (get sha::sha :definition-)
      "float64 old_framescore_pub
float64 old_variance_pub

")



(provide :sha/sha "6d9c7de78367f107912b0affe8137d22")


