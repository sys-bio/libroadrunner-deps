cmake_minimum_required(VERSION 3.14)

set(VERSION_MAJOR 2)
set(VERSION_MINOR 0)
set(VERSION_MICRO 6)

set(LIBROADRUNNER_DEPS_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_MICRO}")

project(
        roadrunner_deps
        VERSION ${LIBROADRUNNER_DEPS_VERSION}
)


if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
    message(STATUS "Build on 32-bit platform")
else()
    message(STATUS "Build on 64-bit platform")
endif()

message(STATUS "Building roadrunner-deps in \"${CMAKE_BUILD_TYPE}\" mode")


# do some bitness checks as its an easy trap to fall into on windows.
if (WIN32)
    if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
        message(WARNING "You are building 32-bit binaries \
this is unlikely what you want. If you intented to build x64-bit ensure you are using the x64-bit
visual studio developers command prompt for running the cmake command" .)
    endif ()

    string(FIND "${CMAKE_SYSTEM_PROCESSOR}" "64" IS_64_BIT)
    if ((${IS_64_BIT} GREATER 0) AND ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4"))
        message(WARNING "You are generating a 32-bit version of roadrunner on a \
x64 bit machine")
    endif ()
endif ()

#set(USE_UNIVERSAL_BINARIES "ON" CACHE BOOL "Build and link to universal binaries on MacOS")

if (USE_UNIVERSAL_BINARIES)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE INTERNAL "Compile for intel and M1 chips on apple" FORCE)
    message(STATUS "building on mac with universal binaries")
endif()

# Enable cmake printing out commands
set(CMAKE_VERBOSE_MAKEFILE TRUE)

##############################################################
#   includes
#
include(GNUInstallDirs)

# generate automatic export headers
include(GenerateExportHeader)


##############################################################
#   CMake Policy's
#
cmake_policy(SET CMP0063 NEW) # What is it for?

if (${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.20")
    # Source file extensions do not need to be explicitly
    #   specified if CMP0115 set to OLD.
    #   New behavior requires all extensions be explicit
    cmake_policy(SET CMP0115 OLD)
endif()


###############################################################
#   options and varibles
#

option(BUILD_PACKAGING "Build the packaging" OFF)
option(BUILD_LLVM "build llvm" OFF)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# GNUInstallDirs creates cache variable CMAKE_INSTALL_DOCDIR for documentation
# but the default is defined by a call to project, which can vary throughout the
# cmake hierachy. Therefore its best to set now.
set(CMAKE_INSTALL_DOCDIR "${CMAKE_INSTALL_PREFIX}/docs")


# put all runtime targets (exe and dll) into bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

# put libraries into lib
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")

# archives
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")

set(CMAKE_MACOSX_RPATH 1)

#pre set libsbml options
#Try as I might, I couldn't get anything to recognize the bzip2 library,
# so I just disabled it here.
#option(WITH_BZIP2 "libsbml option \"WITH_BZIP2\"" OFF)
set(WITH_BZIP2 "OFF")
option(WITH_SWIG "libsbml option \"WITH_SWIG\"" OFF)
option(WITH_ZLIB "libsbml option \"WITH_ZLIB\"" ON)
option(WITH_CPP_NAMESPACE "libsbml option \"WITH_CPP_NAMESPACE\"" ON)
option(ENABLE_ARRAYS "libsbml option \"ENABLE_ARRAYS\"" ON) #Need this for Antimony
option(ENABLE_COMP "libsbml option \"ENABLE_COMP\"" ON)
option(ENABLE_DISTRIB "libsbml option \"ENABLE_DISTRIB\"" ON)
option(ENABLE_DYN "libsbml option \"ENABLE_DYN\"" OFF)
option(ENABLE_FBC "libsbml option \"ENABLE_FBC\"" ON)
option(ENABLE_GROUPS "libsbml option \"ENABLE_GROUPS\"" ON)
option(ENABLE_LAYOUT "libsbml option \"ENABLE_LAYOUT\"" ON)
option(ENABLE_MULTI "libsbml option \"ENABLE_MULTI\"" OFF)
option(ENABLE_QUAL "libsbml option \"ENABLE_QUAL\"" ON)
option(ENABLE_RENDER "libsbml option \"ENABLE_RENDER\"" ON)
option(ENABLE_REQUIREDELEMENTS "libsbml option \"ENABLE_REQUIREDELEMENTS\"" OFF)
option(ENABLE_SPATIAL "libsbml option \"ENABLE_SPATIAL\"" OFF)
set(LIBSBML_SKIP_SHARED_LIBRARY "ON")
set(LIBNUML_SKIP_SHARED_LIBRARY "ON")
set(LIBSEDML_SKIP_SHARED_LIBRARY "ON")
set(WITH_CPP_NAMESPACE ON)

mark_as_advanced(
#        WITH_BZIP2
        WITH_SWIG
        WITH_ZLIB
        WITH_CPP_NAMESPACE
        ENABLE_ARRAYS
        ENABLE_COMP
        ENABLE_DISTRIB
        ENABLE_DYN
        ENABLE_FBC
        ENABLE_GROUPS
        ENABLE_LAYOUT
        ENABLE_MULTI
        ENABLE_QUAL
        ENABLE_RENDER
        ENABLE_REQUIREDELEMENTS
        ENABLE_SPATIAL
)
# sundials options
option(BUILD_CVODE "sundials option: \"BUILD_CVODE\"" TRUE)
option(BUILD_CVODES "sundials option: \"BUILD_CVODES\"" TRUE)
option(BUILD_IDA "sundials option: \"BUILD_IDA\"" OFF)
option(BUILD_IDAS "sundials option: \"BUILD_IDAS\"" OFF)
option(BUILD_KINSOL "sundials option: \"BUILD_KINSOL\"" TRUE)
option(BUILD_UNIT_TEST "sundials option: \"BUILD_UNIT_TEST\"" OFF)
mark_as_advanced(
        BUILD_CVODE
        BUILD_CVODES
        BUILD_IDA
        BUILD_IDAS
        BUILD_KINSOL
        BUILD_UNIT_TEST
)

# Poco options
option(ENABLE_APACHECONNECTOR "poco option \"ENABLE_APACHECONNECTOR\"" OFF)
option(ENABLE_CPPPARSER "poco option \"ENABLE_CPPPARSER\"" OFF)
option(ENABLE_CRYPTO "poco option \"ENABLE_CRYPTO\"" OFF)
option(ENABLE_DATA "poco option \"ENABLE_DATA\"" OFF)
option(ENABLE_DATA_MYSQL "poco option \"ENABLE_DATA_MYSQL\"" OFF)
option(ENABLE_DATA_ODBC "poco option \"ENABLE_DATA_ODBC\"" OFF)
option(ENABLE_DATA_POSTGRESQL "poco option \"ENABLE_DATA_POSTGRESQL\"" OFF)
option(ENABLE_DATA_SQLITE "poco option \"ENABLE_DATA_SQLITE\"" OFF)
option(ENABLE_ENCODINGS "poco option \"ENABLE_ENCODINGS\"" OFF)
option(ENABLE_ENCODINGS_COMPILER "poco option \"ENABLE_ENCODINGS_COMPILER\"" OFF)
option(ENABLE_FOUNDATION "poco option \"ENABLE_FOUNDATION\"" ON)
option(ENABLE_JSON "poco option \"ENABLE_JSON\"" OFF)
option(ENABLE_JWT "poco option \"ENABLE_JWT\"" OFF)
option(ENABLE_MONGODB "poco option \"ENABLE_MONGODB\"" OFF)
option(ENABLE_PDF "poco option \"ENABLE_PDF\"" OFF)
option(ENABLE_NET "poco option \"ENABLE_NET\"" ON)
option(ENABLE_NETSSL "poco option \"ENABLE_NETSSL\"" OFF)
option(ENABLE_NETSSL_WIN "poco option \"ENABLE_NETSSL_WIN\"" OFF)
option(ENABLE_UTIL "poco option \"ENABLE_UTIL\"" OFF)
option(ENABLE_XML "poco option \"ENABLE_XML\"" ON)
option(ENABLE_ZIP "poco option \"ENABLE_ZIP\"" OFF)
option(ENABLE_PAGECOMPILER "poco option \"ENABLE_PAGECOMPILER\"" OFF)
option(ENABLE_PAGECOMPILER_FILE2PAGE "poco option \"ENABLE_PAGECOMPILER_FILE2PAGE\"" OFF)
option(ENABLE_REDIS "poco option \"ENABLE_REDIS\"" OFF)
option(ENABLE_POCODOC "poco option \"ENABLE_POCODOC\"" OFF)
option(ENABLE_TESTS "poco option \"ENABLE_TESTS\"" OFF)
option(BUILD_SHARED_LIBS "build poco as a static library only (no shared). Set to ON for SHARED libraries" OFF)


mark_as_advanced(
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

# LLVM options - turn as much as we can off

# we need tools on for llvm-config, which is used in FindLLVM.
# ... or we could hard code the options that we extract from llvm-config
# and save some built time on llvm. The downside of this idea is reduced flexibility
# should we choose to update llvm.
#option(LLVM_INCLUDE_TOOLS "llvm option \"LLVM_INCLUDE_TOOLS\"" ON)
#option(LLVM_BUILD_TOOLS "llvm option \"LLVM_BUILD_TOOLS\"" ON)
#option(LLVM_INCLUDE_UTILS "llvm option \"LLVM_INCLUDE_UTILS\"" OFF)
#option(LLVM_BUILD_UTILS "llvm option \"LLVM_BUILD_UTILS\"" OFF)
#option(LLVM_INCLUDE_RUNTIMES "llvm option \"LLVM_INCLUDE_RUNTIMES\"" OFF)
#option(LLVM_BUILD_RUNTIMES "llvm option \"LLVM_BUILD_RUNTIMES\"" OFF)
#option(LLVM_BUILD_RUNTIME "llvm option \"LLVM_BUILD_RUNTIME\"" OFF)
#option(LLVM_INCLUDE_TESTS "llvm option \"LLVM_INCLUDE_TESTS\"" OFF)
#option(LLVM_BUILD_TESTS "llvm option \"LLVM_BUILD_TESTS\"" OFF)
#option(LLVM_INCLUDE_TESTS "llvm option \"LLVM_INCLUDE_TESTS\"" OFF)
#option(LLVM_BUILD_EXAMPLES "llvm option \"LLVM_BUILD_EXAMPLES\"" OFF)
#option(LLVM_INCLUDE_EXAMPLES "llvm option \"LLVM_INCLUDE_EXAMPLES\"" OFF)
#option(LLVM_BUILD_DOCS "llvm option \"LLVM_BUILD_DOCS\"" OFF)
#option(LLVM_INCLUDE_DOCS "llvm option \"LLVM_INCLUDE_DOCS\"" OFF)
#option(LLVM_ENABLE_DOXYGEN "llvm option \"LLVM_ENABLE_DOXYGEN\"" OFF)
#option(LLVM_ENABLE_SPHINX "llvm option \"LLVM_ENABLE_SPHINX\"" OFF)
#option(LLVM_ENABLE_OCAMLDOC "llvm option \"LLVM_ENABLE_OCAMLDOC\"" OFF)
#
#mark_as_advanced(
#        LLVM_INCLUDE_TOOLS
#        LLVM_BUILD_TOOLS
#        LLVM_INCLUDE_UTILS
#        LLVM_BUILD_UTILS
#        LLVM_INCLUDE_RUNTIMES
#        LLVM_BUILD_RUNTIMES
#        LLVM_BUILD_RUNTIME
#        LLVM_INCLUDE_TESTS
#        LLVM_BUILD_TESTS
#        LLVM_INCLUDE_TESTS
#        LLVM_BUILD_EXAMPLES
#        LLVM_INCLUDE_EXAMPLES
#        LLVM_BUILD_DOCS
#        LLVM_INCLUDE_DOCS
#        LLVM_ENABLE_DOXYGEN
#        LLVM_ENABLE_SPHINX
#        LLVM_ENABLE_OCAMLDOC
#)
message(STATUS "BUILD_CVODE 1: ${BUILD_CVODE}")
add_subdirectory(third_party)

if (${BUILD_PACKAGING})
    add_subdirectory(packaging)
endif ()



