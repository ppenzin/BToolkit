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
# - Scripts set optimization levels differently for different files, is that
# needed with modern compilers (and especially with -pedantic)?

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

add_compile_definitions(RELEASE_VERSION BSERVER_VERSION)

# FIXME the scripts define a number of architectures, likely a lot of those
# would be hard to find and may not have a CMake port. Platform detection
# section attempts to deal with that one OS at a time, rather than porting all
# settings over to CMake

if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
  add_compile_definitions(linux _BSD_SOURCE POSIX_SOURCE LINUX_VERSION LINUX_SUB_VERSION)
else()
endif()

add_subdirectory(C)

