# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sha: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isha:/home/Tianshu/score_ws/src/sha/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sha_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_custom_target(_sha_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sha" "/home/Tianshu/score_ws/src/sha/msg/sha.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sha
  "/home/Tianshu/score_ws/src/sha/msg/sha.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sha
)

### Generating Services

### Generating Module File
_generate_module_cpp(sha
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sha
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sha_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sha_generate_messages sha_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_dependencies(sha_generate_messages_cpp _sha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sha_gencpp)
add_dependencies(sha_gencpp sha_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sha_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sha
  "/home/Tianshu/score_ws/src/sha/msg/sha.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sha
)

### Generating Services

### Generating Module File
_generate_module_eus(sha
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sha
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sha_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sha_generate_messages sha_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_dependencies(sha_generate_messages_eus _sha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sha_geneus)
add_dependencies(sha_geneus sha_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sha_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sha
  "/home/Tianshu/score_ws/src/sha/msg/sha.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sha
)

### Generating Services

### Generating Module File
_generate_module_lisp(sha
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sha
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sha_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sha_generate_messages sha_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_dependencies(sha_generate_messages_lisp _sha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sha_genlisp)
add_dependencies(sha_genlisp sha_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sha_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sha
  "/home/Tianshu/score_ws/src/sha/msg/sha.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sha
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sha
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sha
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sha_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sha_generate_messages sha_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_dependencies(sha_generate_messages_nodejs _sha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sha_gennodejs)
add_dependencies(sha_gennodejs sha_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sha_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sha
  "/home/Tianshu/score_ws/src/sha/msg/sha.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sha
)

### Generating Services

### Generating Module File
_generate_module_py(sha
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sha
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sha_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sha_generate_messages sha_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/Tianshu/score_ws/src/sha/msg/sha.msg" NAME_WE)
add_dependencies(sha_generate_messages_py _sha_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sha_genpy)
add_dependencies(sha_genpy sha_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sha_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sha
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sha_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sha
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sha_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sha
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sha_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sha)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sha
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sha_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sha)
  install(CODE "execute_process(COMMAND \"/home/Tianshu/anaconda3/envs/myenv/bin/python3.6\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sha\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sha
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sha_generate_messages_py std_msgs_generate_messages_py)
endif()
