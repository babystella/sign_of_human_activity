cmake_minimum_required(VERSION 3.0.2)
project(sha)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  yolact_ros_msgs
  message_filters
  message_generation
  cv_bridge
  image_transport
  OpenCV
)

add_message_files(
  FILES
  sha.msg
)

generate_messages(
   DEPENDENCIES
   std_msgs  
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES sha
   CATKIN_DEPENDS roscpp rospy std_msgs yolact_ros_msgs message_filters message_runtime
#  DEPENDS system_lib
)

###########
## Build ##
###########

include_directories(/home/Tianshu/score_ws/devel/include
 include
 ${catkin_INCLUDE_DIRS}
 ${OpenCV_INCLUDE_DIRS}
)


add_executable(sha src/sha.cpp)
add_dependencies(sha yolact_ros_msgs_gencpp)

# add_executable(testcv src/testcv.cpp)




# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(sha
  ${catkin_LIBRARIES}
  ${OpenCV_LIBS}
  fuzzylite
)

# target_link_libraries(testcv
#   ${catkin_LIBRARIES}
#   ${OpenCV_LIBS}
# )
