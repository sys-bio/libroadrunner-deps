

# nleq1
message(STATUS "Adding nleq1 as subdirectory")
add_subdirectory(nleq1)
set(NLEQ1_INCLUDE_DIR "$<TARGET_PROPERTY:nleq1,INCLUDE_DIRECTORIES>") # or libsbml


# nleq2
message(STATUS "Adding nleq2 as subdirectory")
add_subdirectory(nleq2)
set(NLEQ2_INCLUDE_DIR "$<TARGET_PROPERTY:nleq2,INCLUDE_DIRECTORIES>")

# bzip
message(STATUS "Adding bzip2 as subdirectory")
add_subdirectory(bzip2)
# these are needed for libsbml
set(LIBBZ_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bzip2")
#set(LIBBZ_LIBRARY "$<TARGET_LINKER_FILE:bzip2>")

# zlib
message(STATUS "Adding zlib as subdirectory")
add_subdirectory(zlib)
set(ZLIB_INCLUDE_DIR "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>" "${CMAKE_CURRENT_SOURCE_DIR}/zlib")
set(LIBZ_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/zlib/")
#For the auto-generated zconf.h:
#set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${CMAKE_CURRENT_BINARY_DIR}/zlib/")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")
message(STATUS "Extra include directories: ${EXTRA_INCLUDE_DIRS}")
set(LIBZ_LIBRARY zlibstatic)

# iconv
message(STATUS "Adding iconv as subdirectory")
add_subdirectory(iconv)
set(LIBICONV_INCLUDE_DIR "${LIBICONV_INCLUDE_DIR}")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "$<TARGET_PROPERTY:libiconv-static,INCLUDE_DIRECTORIES>")
#libsbml does a thing now where it only creates LIBICONV_LIBRARY if EXTRA_LIBS is blank.
# It also just adds the WS2_32.lib library, regardless of whether it's compiling on 
# windows or not.  So, I went ahead and basically replicated that here.
#set(LIBICONV_LIBRARY "$<TARGET_LINKER_FILE:libiconv>")
set(EXTRA_LIBS "${EXTRA_LIBS}" libiconv-static)
if (WIN32)
    set(EXTRA_LIBS "${EXTRA_LIBS}" "WS2_32.lib")
endif (WIN32)

# clapack
message(STATUS "Adding clapack as subdirectory")
add_subdirectory(clapack)
set(CLAPACK_INCLUDE_DIR "$<TARGET_PROPERTY:lapack,INCLUDE_DIRECTORIES>")

# libxml2
message(STATUS "Adding libxml2 as subdirectory")
add_subdirectory(libxml2)
add_dependencies(LibXml2 zlibstatic libiconv-static libz2)
set(LIBXML_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libxml2/include")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${CMAKE_CURRENT_BINARY_DIR}/libxml2/include/" "${CMAKE_CURRENT_BINARY_DIR}/third_party/libxml2/include/")
message(STATUS "Extra include directories: ${EXTRA_INCLUDE_DIRS}")
add_dependencies(LibXml2 libiconv-static zlibstatic)

# note the TARGET_LINKER_FILE generator expression gives us the export library on windows
set(LIBXML_LIBRARY LibXml2)

## poco
message(STATUS "Adding poco as subdirectory")
add_subdirectory(poco)

# libsbml
message(STATUS "Adding libsbml as subdirectory")
#Try as I might, I couldn't get anything to recognize the bzip2 library, so I just
# disabled it here.
set(WITH_BZIP2 "OFF")
set(LIBSBML_SKIP_SHARED_LIBRARY "ON")
# add_subdirectory(libSBML-5.18.1-experimental-Source)
add_subdirectory(libsbml)

# needed because of the weird way libsbml handles the "lib" prefix
if (WIN32)
    set(LIBSBML_TARGET_ID "libsbml-static")
    set(LIBSBML_INCLUDE_DIR "$<TARGET_PROPERTY:libsbml-static,INCLUDE_DIRECTORIES>")
else (WIN32)
    set(LIBSBML_TARGET_ID "sbml-static")
    set(LIBSBML_INCLUDE_DIR "$<TARGET_PROPERTY:sbml-static,INCLUDE_DIRECTORIES>")
endif (WIN32)

add_dependencies("${LIBSBML_TARGET_ID}" LibXml2 zlibstatic libiconv-static libz2)

## rr-libstruct
message(STATUS "Adding rr-libstruct as subdirectory")
add_subdirectory(rr-libstruct)
add_dependencies(rr-libstruct-static "${LIBSBML_TARGET_ID}")

#
## sundials
message(STATUS "Adding sundials as subdirectory")
# sundials handles the BUILD_SHARED_LIBS variable
# differently to most other packages - they also have a
# BUILD_STATIC_LIBS variable. Since we only want static for sundials,
# if BUILD_SHARED_LIBS, temporarily turn it off for sundials then turn back on
if (${BUILD_SHARED_LIBS})
    # temporarily turn off build_shared_libs FOR SUNDIALS WE ONLY WANT STATIC
    set(BUILD_SHARED_LIBS OFF)
    set(_TEMP_NO_SHARED_LIBS ON) # marker of shared lib needs turning on
endif ()

# sundials options
set(BUILD_ARKODE OFF)
set(BUILD_CVODES ON)
set(BUILD_IDA OFF)
set(BUILD_IDAS OFF)
set(BUILD_KINSOL ON)
set(BUILD_CVODE ON)
set(EXAMPLES_ENABLE_C OFF)
set(EXAMPLES_INSTALL OFF)

add_subdirectory(sundials)

# turn BUILD_SHARED_LIBS back on, if it was on before
if (_TEMP_NO_SHARED_LIBS)
    set(BUILD_SHARED_LIBS ON)
endif ()
unset(_TEMP_NO_SHARED_LIBS) # clean up temp variable

if (${BUILD_LLVM})
    message(STATUS "Adding llvm-13.x/llvm as subdirectory")
    add_subdirectory(llvm-13.x/llvm)
else ()
    message(WARNING "Not building LLVM (-DBUILD_LLVM=ON). LLVM is a required dependency of roadrunner. Not \
marking LLVM for building means that you must already have a built copy of llvm-13.x. If this is in a \
system directory (like \"/usr/local\" or \"C:\\Program Files\") this will be found automatically \
when you run the cmake command for the main roadrunner repository. If installed in a \
non-standard location you will need to provide the full path to the llvm-13.x install directory when running \
the cmake command for roadrunner i.e.
    -DLLVM_INSTALL_PREFIX=\"/full/path/to/llvm\"
If you do not already have llvm-13.x, please re-run cmake with
    -DBUILD_LLVM=ON
")
endif ()



