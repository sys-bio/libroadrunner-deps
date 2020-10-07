

# nleq1
message(STATUS "Adding nleq1 as subdirectory")
add_subdirectory(nleq1)
set(NLEQ1_INCLUDE_DIR $<TARGET_PROPERTY:nleq1,INCLUDE_DIRECTORIES>) # or libsbml


# nleq2
message(STATUS "Adding nleq2 as subdirectory")
add_subdirectory(nleq2)
set(NLEQ2_INCLUDE_DIR $<TARGET_PROPERTY:nleq2,INCLUDE_DIRECTORIES>)

# bzip
message(STATUS "Adding bzip2 as subdirectory")
add_subdirectory(bzip2)
# these are needed for libsbml
set(LIBBZ_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bzip2")
set(LIBBZ_LIBRARY "$<TARGET_FILE:libz2>")

# zlib
message(STATUS "Adding zlib as subdirectory")
add_subdirectory(zlib)
set(ZLIB_INCLUDE_DIR $<TARGET_PROPERTY:zlib,INCLUDE_DIRECTORIES>)
set(LIBZ_INCLUDE_DIR "${ZLIB_INCLUDE_DIR}") # an alias, used by libsbml

# iconv
message(STATUS "Adding iconv as subdirectory")
add_subdirectory(iconv)
set(LIBICONV_INCLUDE_DIR ${LIBICONV_INCLUDE_DIR} $<TARGET_PROPERTY:libiconv-static,INCLUDE_DIRECTORIES>)

# clapack
message(STATUS "Adding clapack as subdirectory")
add_subdirectory(clapack)
set(CLAPACK_INCLUDE_DIR $<TARGET_PROPERTY:lapack,INCLUDE_DIRECTORIES>)


# libxml2
message(STATUS "Adding libxml2 as subdirectory")
add_subdirectory(libxml2)
add_dependencies(LibXml2 zlib libiconv-static libz2)

set(
        LIBXML_INCLUDE_DIR ${LIBXML_INCLUDE_DIR}
        $<TARGET_PROPERTY:LibXml2,INCLUDE_DIRECTORIES>
        $<TARGET_PROPERTY:libz2,INCLUDE_DIRECTORIES>
        "${CMAKE_CURRENT_SOURCE_DIR}/libxml2/include"
        "${CMAKE_CURRENT_BINARY_DIR}/libxml2"
)

# note the TARGET_LINKER_FILE generator expression gives us the export library on windows
set(LIBXML_LIBRARY $<TARGET_LINKER_FILE:LibXml2>)

## poco
message(STATUS "Adding poco as subdirectory")
add_subdirectory(poco)

# libsbml
message(STATUS "Adding libsbml as subdirectory")
add_subdirectory(libSBML-5.18.1-experimental-Source)

# needed because of the weird way libsbml handles the "lib" prefix
if (WIN32)
    set(LIBSBML_INCLUDE_DIR $<TARGET_PROPERTY:libsbml,INCLUDE_DIRECTORIES>)
else (WIN32)
    set(LIBSBML_INCLUDE_DIR $<TARGET_PROPERTY:sbml,INCLUDE_DIRECTORIES>)
endif (WIN32)

## rr-libstruct
message(STATUS "Adding rr-libstruct as subdirectory")
add_subdirectory(rr-libstruct)

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

add_subdirectory(sundials)

# turn BUILD_SHARED_LIBS back on, if it was on before
if (_TEMP_NO_SHARED_LIBS)
    set(BUILD_SHARED_LIBS ON)
endif ()
unset(_TEMP_NO_SHARED_LIBS) # clean up temp variable

if (${BUILD_LLVM})
    message(STATUS "Adding llvm-6.x/llvm as subdirectory")
    add_subdirectory(llvm-6.x/llvm)
else ()
    message(WARNING "Not building LLVM. LLVM is a required dependency of roadrunner. Not \
marking LLVM for building means that you already have a built copy of llvm-6.x built and installed. If installed in a \
non-standard location you will have to give the install directory to roadrunner cmake with
    -DLLVM_INSTALL_PREFIX=\"/full/path/to/llvm\"
If you do not already have llvm-6.x, please re-run cmake with
    -DBUILD_LLVM=ON
")
endif ()



