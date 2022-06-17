

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
For the auto-generated zconf.h:
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${CMAKE_CURRENT_BINARY_DIR}/zlib/")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")
message(STATUS "Extra include directories: ${EXTRA_INCLUDE_DIRS}")
set(LIBZ_LIBRARY zlibstatic)

# clapack
message(STATUS "Adding clapack as subdirectory")
add_subdirectory(clapack)
set(CLAPACK_INCLUDE_DIR "$<TARGET_PROPERTY:lapack,INCLUDE_DIRECTORIES>")

# check
#set(DONT_INSTALL_WHEN_SUBPROJECT OFF)
#message(STATUS "Adding check as subdirectory")
#add_subdirectory(check)
#set(CHECK_INCLUDE_DIR "$<TARGET_PROPERTY:check,INCLUDE_DIRECTORIES>")

## poco
message(STATUS "Adding poco as subdirectory")
add_subdirectory(poco)

#expat
set (EXPAT_SHARED_LIBS OFF)
set (EXPAT_BUILD_EXAMPLES OFF)
set (EXPAT_BUILD_TESTS OFF)
set (EXPAT_BUILD_TOOLS OFF)
set (EXPAT_BUILD_TOOLS OFF)
if (WITH_STATIC_RUNTIME)
    #expat is overriding this
  set(EXPAT_MSVC_STATIC_CRT ON CACHE BOOL "Use /MT flag (static CRT) when compiling in MSVC" FORCE)
endif()

add_subdirectory(expat/expat)
add_library(EXPAT::EXPAT ALIAS expat)
set(EXPAT_INCLUDE_DIR "$<TARGET_PROPERTY:expat,INCLUDE_DIRECTORIES>" CACHE PATH "Expat incude directory" FORCE)
set(EXPAT_LIBRARY "$<TARGET_LINKER_FILE:expat>" CACHE FILEPATH "Expat library" FORCE)


# libsbml
message(STATUS "Adding libsbml as subdirectory")
set(WITH_EXPAT ON CACHE BOOL "Compile libsbml with the expat library" FORCE)
set(WITH_LIBXML OFF CACHE BOOL "Compile libsbml with libxml (off by default)" FORCE)
add_subdirectory(libsbml)

# needed because of the weird way libsbml handles the "lib" prefix
if (WIN32)
    set(LIBSBML_TARGET_ID "libsbml-static")
    set(LIBSBML_INCLUDE_DIR "$<TARGET_PROPERTY:libsbml-static,INCLUDE_DIRECTORIES>")
else (WIN32)
    set(LIBSBML_TARGET_ID "sbml-static")
    set(LIBSBML_INCLUDE_DIR "$<TARGET_PROPERTY:sbml-static,INCLUDE_DIRECTORIES>")
endif (WIN32)

add_dependencies("${LIBSBML_TARGET_ID}" expat)

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



#From https://stackoverflow.com/questions/37434946/how-do-i-iterate-over-all-cmake-targets-programmatically
function(get_all_targets var)
    set(targets)
    get_all_targets_recursive(targets ${CMAKE_CURRENT_SOURCE_DIR})
    set(${var} ${targets} PARENT_SCOPE)
endfunction()

macro(get_all_targets_recursive targets dir)
    get_property(subdirectories DIRECTORY ${dir} PROPERTY SUBDIRECTORIES)
    foreach(subdir ${subdirectories})
        get_all_targets_recursive(${targets} ${subdir})
    endforeach()

    get_property(current_targets DIRECTORY ${dir} PROPERTY BUILDSYSTEM_TARGETS)
    list(APPEND ${targets} ${current_targets})
endmacro()

get_all_targets(all_targets)
message(STATUS "All targets: ${all_targets}")

