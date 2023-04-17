cmake_minimum_required(VERSION 3.0.2)
project(robthrow_control)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  std_srvs
)

catkin_package()

catkin_install_python(PROGRAMS
  nodes/thrower_control
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  DIRECTORY launch config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
