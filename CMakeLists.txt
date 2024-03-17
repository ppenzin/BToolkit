cmake_minimum_required(VERSION 3.11)

project(BToolkit
  VERSION 6.0.4
  DESCRIPTION "The BToolkit, a toolkit supporting software development with the B-method."
  LANGUAGES C
)

# Test compiler flags
include(CheckCCompilerFlag)

# TODO better flag dispatch?
# - Function/loop for repeated check and set?
# - This is GCC/Clang focused

CHECK_C_COMPILER_FLAG(-pedantic USE_PEDANTIC)
if(USE_PEDANTIC)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pedantic")
endif()

CHECK_C_COMPILER_FLAG(-pipe USE_PIPE)
if(USE_PIPE)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe")
endif()

# This is better add on directoris that need it
# CHECK_C_COMPILER_FLAG(-fcommon USE_FCOMMON)
# if(USE_FCOMMON)
#   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fcommon")
# endif()

# TODO macros for OS_VERSION, OS_SUB_VERSION, RELEASE_VERSION, BSERVER_VERSION,
# etc

add_subdirectory(C)

