#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "sundials::sundials_cvode_static" for configuration "Release"
set_property(TARGET sundials::sundials_cvode_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(sundials::sundials_cvode_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/sundials_cvode.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS sundials::sundials_cvode_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_sundials::sundials_cvode_static "${_IMPORT_PREFIX}/lib/sundials_cvode.lib" )

# Import target "sundials::sundials_nvecserial_static" for configuration "Release"
set_property(TARGET sundials::sundials_nvecserial_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(sundials::sundials_nvecserial_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/sundials_nvecserial.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS sundials::sundials_nvecserial_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_sundials::sundials_nvecserial_static "${_IMPORT_PREFIX}/lib/sundials_nvecserial.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
