cmake_minimum_required(VERSION 2.8)
project(libroadrunner_deps)

set( RR_DEPS_BUILD_POCO TRUE CACHE BOOL "Build the POCO libraries" )

add_subdirectory( third_party )