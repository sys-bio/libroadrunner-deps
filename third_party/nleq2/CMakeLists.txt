CMAKE_MINIMUM_REQUIRED(VERSION 3.15..3.18)
project(nleq2)

set(target nleq2)

set(headers nleq2.h f2c_nleq.h)

set(sources
        nleq2.c
        linalg_nleq2.c
        wnorm.c
        zibconst.c
        zibmon.c
        zibsec.c
        )

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(${target}-static STATIC ${sources})
set_target_properties(${target}-static PROPERTIES PUBLIC_HEADER "${headers}")

if (WIN32)
    set_property(TARGET ${target}-static
            PROPERTY COMPILE_DEFINITIONS
            WIN32
            STATIC_NLEQ2
            )
else ()
    set_property(TARGET ${target}-static
            PROPERTY COMPILE_DEFINITIONS
            STATIC_NLEQ2
            )

endif ()

target_link_libraries(${target}-static f2c)




#Install required files

install(TARGETS ${target}-static
        EXPORT ${target}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${target}
        )

# install the export info
install(
        EXPORT ${target}
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
        NAMESPACE ${target}::
        FILE ${target}-config.cmake
)

#install public headers
install(FILES ${header_files} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

