####################################################################
#
# SBML render package - include files to build render
#
# Frank Bergmann
#

if(ENABLE_RENDER)

include(${LIBSBML_ROOT_SOURCE_DIR}/render-package.cmake)

#build up sources
set(RENDER_SOURCES)

# go through all directtories: common, extension and sbml
foreach(dir common extension sbml util)

	# add to include directory
	include_directories(${CMAKE_CURRENT_SOURCE_DIR}/sbml/packages/render/${dir})
	
	# file sources
	file(GLOB current ${CMAKE_CURRENT_SOURCE_DIR}/sbml/packages/render/${dir}/*.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/sbml/packages/render/${dir}/*.h)
	
        # Set the *Constraints.cpp files to be 'header' files so they won't be compiled--
        #  they are #included directly, instead.
        if ("${dir}" STREQUAL "validator/constraints")
            foreach(tempFile ${current})
                if ("${tempFile}" MATCHES ".*Constraints.cpp")
                    set_source_files_properties(
                        ${tempFile}
                        PROPERTIES HEADER_FILE_ONLY true
                        )
                endif()
            endforeach()
        endif()

	# add sources 
	set(RENDER_SOURCES ${RENDER_SOURCES} ${current})
	
	# mark header files for installation 
	file(GLOB render_headers ${CMAKE_CURRENT_SOURCE_DIR}/sbml/packages/render/${dir}/*.h)
    install(FILES ${render_headers} DESTINATION include/sbml/packages/render/${dir})	
	
endforeach()

# create source group for IDEs
source_group(render_package FILES ${RENDER_SOURCES})

# add fbc sources to SBML sources
SET(LIBSBML_SOURCES ${LIBSBML_SOURCES} ${RENDER_SOURCES})

####################################################################
#
# add test scripts
#
if(WITH_CHECK)

		add_subdirectory(sbml/packages/render/sbml/test)

endif()

endif()
