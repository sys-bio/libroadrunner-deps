#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "PocoNet::PocoNet" for configuration "Release"
set_property(TARGET PocoNet::PocoNet APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(PocoNet::PocoNet PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "PocoFoundation::PocoFoundation;iphlpapi;gdi32;odbc32;ws2_32.lib;iphlpapi.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/PocoNet.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS PocoNet::PocoNet )
list(APPEND _IMPORT_CHECK_FILES_FOR_PocoNet::PocoNet "${_IMPORT_PREFIX}/lib/PocoNet.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
