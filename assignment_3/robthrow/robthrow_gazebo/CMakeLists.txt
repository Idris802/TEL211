cmake_minimum_required(VERSION 3.0.2)
project(robthrow_gazebo)

find_package(catkin REQUIRED COMPONENTS)

catkin_package()

install(
  DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)