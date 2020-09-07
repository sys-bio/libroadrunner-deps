#set(BUILD_LLVM ON )

# We need a list of targets to ensure the install target defined below
# gets built last
set(
        all_targets
        libz2
        blas
        arithchk
        f2c
        lapack
        libcharset
        libiconv-static
        libsbml
        sbml-static
        LibXml2
        nleq1-static
        nleq2-static
        PocoFoundation
        PocoNet
        sundials_cvode_static
        sundials_nvecserial_static
        zlibstatic
        zlib
)

# We add some variables before including CPath
set(CPACK_PACKAGE_NAME ${CMAKE_PROJECT_NAME})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Roadrunner: Fast simulation of sbml models")
set(CPACK_PACKAGE_VENDOR "Prof. Herbert Sauro's Lab")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_MICRO})

set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
set(CPACK_VERBATIM_VARIABLES TRUE)
set(CPACK_PACKAGE_DESCRIPTION_FILE ../README.md)
set(CPACK_RESOURCE_FILE_README ../README.md)
set(CPACK_CMAKE_GENERATOR Ninja)
set(CPACK_DEBIAN_PACKAGE_DEPENDS "")

# debian specific variables
set(CPACK_DEBIAN_PACKAGE_NAME ${CPACK_PACKAGE_NAME})
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_PACKAGE_CONTACT "cwelsh2@uw.edu")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Ciaran Welsh")

include(CPack)

# In order to have the packaging targets depend on
# first installing libroadrunner-deps we need to create a target
# that does the install.
add_custom_target(
        rrDEPS_INSTALL
        COMMAND "${CMAKE_COMMAND}" --build . --target install
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
)

# add all targets as dependencies to ensure packaging is done last in all scenarios
add_dependencies(rrDEPS_INSTALL ${all_targets})

# mickey mouse target for collecting packaging targets
add_custom_target(packaging)
add_dependencies(packaging rrDEPS_INSTALL)

if (${WIN32})
    add_custom_target(
            packaging-zip
            COMMENT "Create a zip binary distribution"
            COMMAND ${CMAKE_CPACK_COMMAND} -G ZIP ${CMAKE_BINARY_DIR}/CPackConfig.cmake
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
            VERBATIM
    )
    add_dependencies(
            packaging packaging-zip
    )

else ()
    add_custom_target(
            packaging-deb
            COMMENT "Create a debian binary distribution"
            COMMAND ${CMAKE_CPACK_COMMAND} -G DEB "${CMAKE_BINARY_DIR}/CPackConfig.cmake"
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
            VERBATIM
    )
    add_custom_target(
            packaging-tar
            COMMENT "Create a tarball binary distribution"
            COMMAND ${CMAKE_CPACK_COMMAND} -G TGZ "${CMAKE_BINARY_DIR}/CPackConfig.cmake"
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
            VERBATIM
    )
    add_dependencies(
            packaging packaging-deb packaging-tar
    )

endif ()


