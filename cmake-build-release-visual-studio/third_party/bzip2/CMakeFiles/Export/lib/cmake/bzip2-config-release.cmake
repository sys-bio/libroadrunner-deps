#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "bzip2::libz2" for configuration "Release"
set_property(TARGET bzip2::libz2 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bzip2::libz2 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/bz2.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS bzip2::libz2 )
list(APPEND _IMPORT_CHECK_FILES_FOR_bzip2::libz2 "${_IMPORT_PREFIX}/lib/bz2.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
