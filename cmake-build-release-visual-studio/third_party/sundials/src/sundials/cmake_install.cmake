# Install script for directory: D:/rrbuild/libroadrunner-deps/third_party/sundials/src/sundials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/rrbuild/libroadrunner-deps/install-MSVC2019/Release")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  MESSAGE("
Install shared components
")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sundials" TYPE FILE FILES
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_band.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_dense.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_direct.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_iterative.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_math.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_nvector.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_fnvector.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_spbcgs.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_spgmr.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_sptfqmr.h"
    "D:/rrbuild/libroadrunner-deps/third_party/sundials/include/sundials/sundials_types.h"
    )
endif()

