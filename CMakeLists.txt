cmake_minimum_required(VERSION 3.18)
project(libroadrunner_deps)

include(GNUInstallDirs)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# GNUInstallDirs creates cache variable CMAKE_INSTALL_DOCDIR for documentation
# but the default is defined by a call to project, which can vary throughout the
# cmake hierachy. Therefore its best to set now.
set(CMAKE_INSTALL_DOCDIR ${CMAKE_INSTALL_PREFIX}/docs)

# generate automatic export headers
include(GenerateExportHeader)

# put all runtime targets (exe and dll) into bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

# put libraries into lib
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)

# archives
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)

#--- mark pre-set thirdparty flags as advanced
mark_as_advanced(
        WITH_BZIP2
        WITH_SWIG
        WITH_ZLIB
        WITH_CPP_NAMESPACE
        BUILD_CVODE
        BUILD_CVODES
        BUILD_IDA
        BUILD_IDAS
        BUILD_KINSOL
        BUILD_UNIT_TEST
        BUILD_SHARED_LIBS
        BUILD_STATIC_LIBS
        ENABLE_LAYOUT
        EXAMPLES_ENABLE
        EXTRA_LIBS
        FCMIX_ENABLE
        LAPACK_ENABLE
        LIBSBML_DEPENDENCY_DIR
        LIBSTRUCT_BUILD_SHARED_LIBS
        LIBSTRUCT_BUILD_STATIC_LIBS
        LIBXML_INCLUDE_DIR
        LIBZ_LIBRARY
        LIBBZ_LIBRARY
        LIBXML_LIBRARY
        MPI_ENABLE
        NLEQ2_BUILD_SHARED_LIBS
        NLEQ2_BUILD_STATIC_LIBS
        NLEQ1_BUILD_SHARED_LIBS
        NLEQ1_BUILD_STATIC_LIBS
        SUNDIALS_PRECISION
        WITH_CHECK
        WITH_CSHARP
        WITH_DOXYGEN
        WITH_EXAMPLES
        WITH_EXPAT
        WITH_JAVA
        WITH_LIBXML
        WITH_MATLAB
        WITH_OCTAVE
        WITH_PERL
        WITH_PYTHON
        WITH_R
        WITH_RUBY
        WITH_STATIC_RUNTIME
        # poco options
        ENABLE_APACHECONNECTOR
        ENABLE_CPPPARSER
        ENABLE_CRYPTO
        ENABLE_DATA
        ENABLE_DATA_MYSQL
        ENABLE_DATA_ODBC
        ENABLE_DATA_POSTGRESQL
        ENABLE_DATA_SQLITE
        ENABLE_ENCODINGS
        ENABLE_ENCODINGS_COMPILER
        ENABLE_FOUNDATION
        ENABLE_JSON
        ENABLE_JWT
        ENABLE_MONGODB
        ENABLE_PDF
        ENABLE_NET
        ENABLE_NETSSL
        ENABLE_NETSSL_WIN
        ENABLE_UTIL
        ENABLE_XML
        ENABLE_ZIP
        ENABLE_PAGECOMPILER
        ENABLE_PAGECOMPILER_FILE2PAGE
        ENABLE_REDIS
        ENABLE_POCODOC
        ENABLE_TESTS

)

#pre set libsbml options
set(WITH_BZIP2 ON CACHE BOOL "build libsbml with bzip")
set(WITH_SWIG OFF CACHE BOOL "build libsbml with swig")
set(WITH_ZLIB ON CACHE BOOL "build libsbml with zlib")
set(WITH_CPP_NAMESPACE ON CACHE BOOL "build libsbml with CPP namespace")
set(ENABLE_ARRAYS OFF CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_COMP ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_DISTRIB ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_DYN OFF CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_FBC ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_GROUPS ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_LAYOUT ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_MULTI OFF CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_QUAL ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_RENDER ON CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_REQUIREDELEMENTS OFF CACHE BOOL "Enable/disable libSBML options")
set(ENABLE_SPATIAL OFF CACHE BOOL "Enable/disable libSBML options")

# sundials options
set(BUILD_CVODE ON CACHE BOOL "Build sundials with these options set to off")
set(BUILD_CVODES OFF CACHE BOOL "Build sundials with these options set to off")
set(BUILD_IDA OFF CACHE BOOL "Build sundials with these options set to off")
set(BUILD_IDAS OFF CACHE BOOL "Build sundials with these options set to off")
set(BUILD_KINSOL OFF CACHE BOOL "Build sundials with these options set to off")
set(BUILD_UNIT_TEST OFF CACHE BOOL "Build sundials with these options set to off")

# Poco options
set(ENABLE_APACHECONNECTOR OFF)
set(ENABLE_CPPPARSER OFF)
set(ENABLE_CRYPTO OFF)
set(ENABLE_DATA OFF)
set(ENABLE_DATA_MYSQL OFF)
set(ENABLE_DATA_ODBC OFF)
set(ENABLE_DATA_POSTGRESQL OFF)
set(ENABLE_DATA_SQLITE OFF)
set(ENABLE_ENCODINGS OFF)
set(ENABLE_ENCODINGS_COMPILER OFF)
set(ENABLE_FOUNDATION ON)
set(ENABLE_JSON OFF)
set(ENABLE_JWT OFF)
set(ENABLE_MONGODB OFF)
set(ENABLE_PDF OFF)
set(ENABLE_NET ON)
set(ENABLE_NETSSL OFF)
set(ENABLE_NETSSL_WIN OFF)
set(ENABLE_UTIL OFF)
set(ENABLE_XML OFF)
set(ENABLE_ZIP OFF)
set(ENABLE_PAGECOMPILER OFF)
set(ENABLE_PAGECOMPILER_FILE2PAGE OFF)
set(ENABLE_REDIS OFF)
set(ENABLE_POCODOC OFF)
set(ENABLE_TESTS OFF)

add_subdirectory( third_party )

