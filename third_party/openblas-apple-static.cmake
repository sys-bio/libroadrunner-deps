# Included at the end of OpenBLAS's project() call (CMAKE_PROJECT_OpenBLAS_INCLUDE).
#
# OpenBLAS's macOS rule for creating its static library looks for xerbla.c.o below
# CMAKE_BINARY_DIR, which is only right when OpenBLAS is the top-level project. Once OpenBLAS
# has set the rule, point that path at the OpenBLAS binary directory. Ninja keeps its response
# file in the top-level CMakeFiles directory, so only the Makefile generators' per-target
# response file path is changed as well.
if (CMAKE_VERSION VERSION_LESS 3.19)
    message(FATAL_ERROR "Building OpenBLAS on macOS needs CMake 3.19 or later (CMake ${CMAKE_VERSION} was found).")
endif ()

macro(_rr_openblas_fix_static_rule)
    if (NOT CMAKE_GENERATOR MATCHES "Ninja")
        string(REPLACE "${CMAKE_BINARY_DIR}/CMakeFiles/" "${PROJECT_BINARY_DIR}/CMakeFiles/"
               CMAKE_C_CREATE_STATIC_LIBRARY "${CMAKE_C_CREATE_STATIC_LIBRARY}")
    endif ()
    string(REPLACE "${CMAKE_BINARY_DIR}/driver/" "${PROJECT_BINARY_DIR}/driver/"
           CMAKE_C_CREATE_STATIC_LIBRARY "${CMAKE_C_CREATE_STATIC_LIBRARY}")
endmacro()

# runs at the end of the OpenBLAS directory, after the rule has been set
cmake_language(DEFER CALL _rr_openblas_fix_static_rule)
