# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolact_ros_msgs: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iyolact_ros_msgs:/home/Tianshu/score_ws/src/yolact_ros_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolact_ros_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_custom_target(_yolact_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolact_ros_msgs" "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" ""
)

get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_custom_target(_yolact_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolact_ros_msgs" "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" ""
)

get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_custom_target(_yolact_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolact_ros_msgs" "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" ""
)

get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_custom_target(_yolact_ros_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolact_ros_msgs" "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" "yolact_ros_msgs/Detection:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_cpp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_cpp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_cpp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolact_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolact_ros_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolact_ros_msgs_generate_messages yolact_ros_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_cpp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_cpp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_cpp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_cpp _yolact_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolact_ros_msgs_gencpp)
add_dependencies(yolact_ros_msgs_gencpp yolact_ros_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolact_ros_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_eus(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_eus(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_eus(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(yolact_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolact_ros_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolact_ros_msgs_generate_messages yolact_ros_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_eus _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_eus _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_eus _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_eus _yolact_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolact_ros_msgs_geneus)
add_dependencies(yolact_ros_msgs_geneus yolact_ros_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolact_ros_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_lisp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_lisp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_lisp(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolact_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolact_ros_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolact_ros_msgs_generate_messages yolact_ros_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_lisp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_lisp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_lisp _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_lisp _yolact_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolact_ros_msgs_genlisp)
add_dependencies(yolact_ros_msgs_genlisp yolact_ros_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolact_ros_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_nodejs(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_nodejs(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_nodejs(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolact_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolact_ros_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolact_ros_msgs_generate_messages yolact_ros_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_nodejs _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_nodejs _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_nodejs _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_nodejs _yolact_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolact_ros_msgs_gennodejs)
add_dependencies(yolact_ros_msgs_gennodejs yolact_ros_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolact_ros_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_py(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_py(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
)
_generate_msg_py(yolact_ros_msgs
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(yolact_ros_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolact_ros_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolact_ros_msgs_generate_messages yolact_ros_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Box.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_py _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_py _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_py _yolact_ros_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/Tianshu/score_ws/src/yolact_ros_msgs/msg/Detections.msg" NAME_WE)
add_dependencies(yolact_ros_msgs_generate_messages_py _yolact_ros_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolact_ros_msgs_genpy)
add_dependencies(yolact_ros_msgs_genpy yolact_ros_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolact_ros_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolact_ros_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolact_ros_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolact_ros_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolact_ros_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs)
  install(CODE "execute_process(COMMAND \"/home/Tianshu/anaconda3/envs/myenv/bin/python3.6\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolact_ros_msgs
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolact_ros_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
