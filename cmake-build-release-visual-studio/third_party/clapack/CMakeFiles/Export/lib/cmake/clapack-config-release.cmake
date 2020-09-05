#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "clapack::blas" for configuration "Release"
set_property(TARGET clapack::blas APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(clapack::blas PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "clapack::f2c"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/blas.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS clapack::blas )
list(APPEND _IMPORT_CHECK_FILES_FOR_clapack::blas "${_IMPORT_PREFIX}/lib/blas.lib" )

# Import target "clapack::f2c" for configuration "Release"
set_property(TARGET clapack::f2c APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(clapack::f2c PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libf2c.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS clapack::f2c )
list(APPEND _IMPORT_CHECK_FILES_FOR_clapack::f2c "${_IMPORT_PREFIX}/lib/libf2c.lib" )

# Import target "clapack::lapack" for configuration "Release"
set_property(TARGET clapack::lapack APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(clapack::lapack PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/lapack.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS clapack::lapack )
list(APPEND _IMPORT_CHECK_FILES_FOR_clapack::lapack "${_IMPORT_PREFIX}/lib/lapack.lib" )

# Import target "clapack::arithchk" for configuration "Release"
set_property(TARGET clapack::arithchk APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(clapack::arithchk PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/arithchk.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS clapack::arithchk )
list(APPEND _IMPORT_CHECK_FILES_FOR_clapack::arithchk "${_IMPORT_PREFIX}/bin/arithchk.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
