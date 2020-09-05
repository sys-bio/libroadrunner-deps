#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "rr-libstruct::rr-libstruct-static" for configuration "Release"
set_property(TARGET rr-libstruct::rr-libstruct-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(rr-libstruct::rr-libstruct-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/rr-libstruct-static.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS rr-libstruct::rr-libstruct-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_rr-libstruct::rr-libstruct-static "${_IMPORT_PREFIX}/lib/rr-libstruct-static.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
