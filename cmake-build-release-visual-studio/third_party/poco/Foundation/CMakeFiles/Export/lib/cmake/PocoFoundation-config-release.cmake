#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "PocoFoundation::PocoFoundation" for configuration "Release"
set_property(TARGET PocoFoundation::PocoFoundation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(PocoFoundation::PocoFoundation PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "iphlpapi;gdi32;odbc32;iphlpapi"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/PocoFoundation.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS PocoFoundation::PocoFoundation )
list(APPEND _IMPORT_CHECK_FILES_FOR_PocoFoundation::PocoFoundation "${_IMPORT_PREFIX}/lib/PocoFoundation.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
