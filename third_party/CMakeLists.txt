# zlib
message(STATUS "Adding zlib as subdirectory")
add_subdirectory(zlib)
set(ZLIB_INCLUDE_DIR "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")
set(LIBZ_INCLUDE_DIR "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")
#For the auto-generated zconf.h:
#set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${CMAKE_CURRENT_BINARY_DIR}/zlib/")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")
#message(STATUS "LIBZ_INCLUDE_DIR: ${LIBZ_INCLUDE_DIR}")
message(STATUS "Extra include directories: ${EXTRA_INCLUDE_DIRS}")
set(LIBZ_LIBRARY zlibstatic)

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

# clapack
message(STATUS "Adding clapack as subdirectory")
add_subdirectory(clapack)
set(CLAPACK_INCLUDE_DIR "$<TARGET_PROPERTY:lapack,INCLUDE_DIRECTORIES>")
add_dependencies(lapack zlibstatic)

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
    set(LIBSBML_INCLUDE_DIRS "$<TARGET_PROPERTY:libsbml-static,INCLUDE_DIRECTORIES>")
    set(LIBSBML_LIBRARY "$<TARGET_LINKER_FILE:libsbml-static>" CACHE FILEPATH "libsbml library" FORCE)
else (WIN32)
    set(LIBSBML_TARGET_ID "sbml-static")
    set(LIBSBML_INCLUDE_DIR "$<TARGET_PROPERTY:sbml-static,INCLUDE_DIRECTORIES>")
    set(LIBSBML_INCLUDE_DIRS "$<TARGET_PROPERTY:sbml-static,INCLUDE_DIRECTORIES>")
    set(LIBSBML_LIBRARY "$<TARGET_LINKER_FILE:sbml-static>" CACHE FILEPATH "libsbml library" FORCE)
endif (WIN32)

add_dependencies("${LIBSBML_TARGET_ID}" expat zlibstatic)
set(FIND_LIBSBML OFF CACHE BOOL "Find libsbml." FORCE)

# Revert LIBZ_INCLUDE_DIR because it'll make things fail otherwise.
set(LIBZ_INCLUDE_DIR "$<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>")

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


# libNuML
message(STATUS "Adding NuML/libnuml as subdirectory")

set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${CMAKE_BINARY_DIR}/third_party/libsbml/src" "${CMAKE_BINARY_DIR}/third_party/libsbml" "${CMAKE_BINARY_DIR}/third_party/NuML/libnuml/src" "${CMAKE_BINARY_DIR}/third_party/NuML/libnuml" "${CMAKE_BINARY_DIR}/third_party/NuML/libnuml/src/numl" "${LIBSBML_INCLUDE_DIR}")
set(BUILD_TESTS OFF)


set(EXTRA_LIBS "$<TARGET_LINKER_FILE:expat>" "$<TARGET_LINKER_FILE:zlibstatic>")
set(LIBSBML_LIBRARY_NAME "${LIBSBML_LIBRARY}")

add_subdirectory(NuML/libnuml)

# needed because of the weird way libsbml-modeled makefiles handle the "lib" prefix
if (WIN32)
    set(LIBNUML_TARGET_ID "libnuml-static")
    set(LIBNUML_TARGET_ID_NS "libnuml")
    set(LIBNUML_INCLUDE_DIRS "$<TARGET_PROPERTY:libnuml-static,INCLUDE_DIRECTORIES>")
    set(LIBNUML_LIBRARY "$<TARGET_LINKER_FILE:libnuml-static>" CACHE FILEPATH "libnuml library" FORCE)
else (WIN32)
    set(LIBNUML_TARGET_ID "numl-static")
    set(LIBNUML_TARGET_ID_NS "numl")
    set(LIBNUML_INCLUDE_DIR "$<TARGET_PROPERTY:numl-static,INCLUDE_DIRECTORIES>")
    set(LIBNUML_LIBRARY "$<TARGET_LINKER_FILE:numl-static>" CACHE FILEPATH "libnuml library" FORCE)
endif (WIN32)


add_dependencies(${LIBNUML_TARGET_ID} "${LIBSBML_TARGET_ID}")
#add_dependencies(${LIBNUML_TARGET_ID_NS} "${LIBSBML_TARGET_ID}")
set(FIND_LIBNUML OFF CACHE BOOL "Find libsbml." FORCE)


# libSEDML
message(STATUS "Adding libSEDML as subdirectory")

set(LIBSBML_INCLUDE_DIR "${CMAKE_BINARY_DIR}/third_party/libsbml/src")
set(LIBNUML_INCLUDE_DIR "${CMAKE_BINARY_DIR}/third_party/NuML/libnuml/src")
set(LIBNUML_LIBRARY_NAME "${LIBNUML_LIBRARY}")
set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" "${LIBSBML_INCLUDE_DIRS}" "${LIBNUML_INCLUDE_DIRS}")
add_subdirectory(libSEDML)

# needed because of the weird way libsbml-modeled makefiles handle the "lib" prefix
if (WIN32)
    set(LIBSEDML_TARGET_ID "libsedml-static")
    set(LIBSEDML_TARGET_ID_NS "libsedml")
    set(LIBSEDML_INCLUDE_DIR "$<TARGET_PROPERTY:libsedml-static,INCLUDE_DIRECTORIES>")
    set(LIBSEDML_LIBRARY "$<TARGET_LINKER_FILE:libsedml-static>" CACHE FILEPATH "libsedml library" FORCE)
else (WIN32)
    set(LIBSEDML_TARGET_ID "sedml-static")
    set(LIBSEDML_TARGET_ID_NS "sedml")
    set(LIBSEDML_INCLUDE_DIR "$<TARGET_PROPERTY:sedml-static,INCLUDE_DIRECTORIES>")
    set(LIBSEDML_LIBRARY "$<TARGET_LINKER_FILE:sedml-static>" CACHE FILEPATH "libsedml library" FORCE)
endif (WIN32)


add_dependencies("${LIBSEDML_TARGET_ID}" "${LIBSBML_TARGET_ID}" "${LIBNUML_TARGET_ID}")
#add_dependencies("${LIBSEDML_TARGET_ID_NS}" "${LIBSBML_TARGET_ID}" "${LIBNUML_TARGET_ID}")


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

set(BUILD_TESTS OFF CACHE BOOL "Build tests" FORCE)

## https://stackoverflow.com/questions/32183975/how-to-print-all-the-properties-of-a-target-in-cmake/56738858#56738858
## https://stackoverflow.com/a/56738858/3743145

## Get all properties that cmake supports
execute_process(COMMAND cmake --help-property-list OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)
## Convert command output into a CMake list
STRING(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
STRING(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")

list(REMOVE_DUPLICATES CMAKE_PROPERTY_LIST)

function(print_target_properties tgt)
    if(NOT TARGET ${tgt})
      message("There is no target named '${tgt}'")
      return()
    endif()

    foreach (prop ${CMAKE_PROPERTY_LIST})
        string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" prop ${prop})
        get_target_property(propval ${tgt} ${prop})
        if (propval)
            message ("${tgt} ${prop} = ${propval}")
        endif()
    endforeach(prop)
endfunction(print_target_properties)

#cmake_language(CALL print_target_properties zlib)
#cmake_language(CALL print_target_properties zlibstatic)
#cmake_language(CALL print_target_properties expat)



message(STATUS "Extra libs: ${EXTRA_LIBS}")
message(STATUS "Extra include dirs: ${EXTRA_INCLUDE_DIRS}")
message(STATUS "libsbml library name: ${LIBSBML_LIBRARY_NAME}")
