# Run at install time (see install(SCRIPT) in CMakeLists.txt).
#
# Edits an installed static-only libsbml package file so that it asks for the static zlib:
#     find_dependency(ZLIB COMPONENTS static)
# A libsbml built before the libsbml template did this asks for ZLIB without components, which a
# static-only zlib rejects ("Target ZLIB::ZLIB not created"). Nothing is changed when the package
# file already has the change, when it is not a static-only install (the shared libsbml package
# file is also present), or when the line to change is not found.
#
# RR_DEPS_CONFIG_DIR is the directory that holds the installed package files.
# Standalone use on an existing install:
#     cmake -DRR_DEPS_CONFIG_DIR=<install>/lib/cmake -P patch_libsbml_config.cmake

if (NOT RR_DEPS_CONFIG_DIR)
    message(FATAL_ERROR "RR_DEPS_CONFIG_DIR is not set")
endif ()

foreach (_prefix libsbml sbml)
    set(_file "$ENV{DESTDIR}${RR_DEPS_CONFIG_DIR}/${_prefix}-static-config.cmake")
    if (NOT EXISTS "${_file}")
        continue()
    endif ()
    if (EXISTS "$ENV{DESTDIR}${RR_DEPS_CONFIG_DIR}/${_prefix}-config.cmake")
        message(STATUS "Shared libsbml is installed too, leaving ${_file} unchanged")
        continue()
    endif ()

    file(READ "${_file}" _content)
    string(FIND "${_content}" "_libsbml_dependency_args" _patched_position)
    if (NOT _patched_position EQUAL -1)
        message(STATUS "libsbml package file already asks for the static zlib: ${_file}")
        continue()
    endif ()

    string(REPLACE "find_dependency(\${DEPENDENT_NAME})"
            "set(_libsbml_dependency_args)\n      if (DEPENDENT_NAME STREQUAL \"ZLIB\")\n        set(_libsbml_dependency_args COMPONENTS static)\n      endif()\n      find_dependency(\${DEPENDENT_NAME} \${_libsbml_dependency_args})"
            _patched "${_content}")
    if (_patched STREQUAL _content)
        message(WARNING "Could not find find_dependency(\${DEPENDENT_NAME}) in ${_file}; left unchanged")
        continue()
    endif ()

    file(WRITE "${_file}" "${_patched}")
    message(STATUS "libsbml package file now asks for the static zlib: ${_file}")
endforeach ()
