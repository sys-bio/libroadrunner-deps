cmake_minimum_required(VERSION 2.8)
project(libroadrunner_deps)

set( RR_DEPS_BUILD_POCO TRUE CACHE BOOL "Build the POCO libraries" )

add_subdirectory( third_party )

# Copy libsbml deps for Windows
#if(WIN32)
 # set(RUNTIMES libxml2.DLL iconv.dll zlib1.dll)
  #foreach(runtime ${RUNTIMES})
   # install( FILES third_party/dependencies/libsbml/bin/${runtime} DESTINATION bin)
 # endforeach()
#endif()