cmake_minimum_required(VERSION 3.14)
project(CLAPACK C)
#enable_testing()
#include(CTest)

if(WIN32 AND NOT CYGWIN)
  set(SECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/winsecond.c)
  set(DSECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/windsecnd.c)
  add_definitions(-DNO_ISATTY -DMSDOS -DUSE_CLOCK)
else()
  set(SECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/second.c)
  set(DSECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/dsecnd.c)
endif()
#enable_testing()
#option(USE_BLAS_WRAP "pre-pend f2c_ to each function in blas" OFF)
set(USE_BLAS_WRAP OFF)
if(NOT USE_BLAS_WRAP)
# _zrotg_ seems to be missing in the wrap header
  add_definitions(-DNO_BLAS_WRAP)
endif()
include_directories(${CLAPACK_SOURCE_DIR}/INCLUDE)
add_subdirectory(F2CLIBS)
add_subdirectory(BLAS)
add_subdirectory(SRC)
add_subdirectory(INCLUDE)
#add_subdirectory(TESTING)
set(CLAPACK_VERSION 3.2.1)
set(CPACK_PACKAGE_VERSION_MAJOR 3)
set(CPACK_PACKAGE_VERSION_MINOR 2)
set(CPACK_PACKAGE_VERSION_PATCH 1)



include(CPack)


install(
    TARGETS blas f2c lapack arithchk
    EXPORT clapack
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )

# install the export info
install(
        EXPORT clapack
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
        NAMESPACE clapack::
        FILE clapack-config.cmake
)


#export(TARGETS f2c blas lapack FILE clapack-targets.cmake)
configure_file(${CLAPACK_SOURCE_DIR}/clapack-config-version.cmake.in
  ${CLAPACK_BINARY_DIR}/clapack-config-version.cmake @ONLY)
configure_file(${CLAPACK_SOURCE_DIR}/clapack-config.cmake.in
  ${CLAPACK_BINARY_DIR}/clapack-config.cmake @ONLY)
