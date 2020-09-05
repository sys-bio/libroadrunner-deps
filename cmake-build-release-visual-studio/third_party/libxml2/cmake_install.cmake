# Install script for directory: D:/rrbuild/libroadrunner-deps/third_party/libxml2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/rrbuild/libroadrunner-deps/install-MSVC2019/Release")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libxml2/libxml" TYPE FILE FILES
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/c14n.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/catalog.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/chvalid.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/debugXML.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/dict.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/DOCBparser.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/encoding.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/entities.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/globals.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/hash.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/HTMLparser.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/HTMLtree.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/list.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/nanoftp.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/nanohttp.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/parser.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/parserInternals.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/pattern.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/relaxng.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/SAX.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/SAX2.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/schemasInternals.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/schematron.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/threads.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/tree.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/uri.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/valid.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xinclude.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xlink.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlIO.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlautomata.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlerror.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlexports.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlmemory.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlmodule.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlreader.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlregexp.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlsave.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlschemas.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlschemastypes.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlstring.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlunicode.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xmlwriter.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xpath.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xpathInternals.h"
    "D:/rrbuild/libroadrunner-deps/third_party/libxml2/include/libxml/xpointer.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/lib/libxml2s.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/third_party/libxml2/libxml.3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/third_party/libxml2/doc/xmlcatalog.1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/third_party/libxml2/doc/xmllint.1")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/libxml2" TYPE DIRECTORY FILES "D:/rrbuild/libroadrunner-deps/third_party/libxml2/doc/" REGEX "/makefile\\.[^/]*$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/libxml2-config-version.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/libxml2-config.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/libxml2-config.cmake"
         "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/CMakeFiles/Export/lib/cmake/libxml2-config.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/libxml2-config-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/libxml2-config.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/CMakeFiles/Export/lib/cmake/libxml2-config.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/CMakeFiles/Export/lib/cmake/libxml2-config-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libxml2/libxml" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/libxml/xmlversion.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libxml2/libxml" TYPE FILE FILES "D:/rrbuild/libroadrunner-deps/cmake-build-release-visual-studio/third_party/libxml2/libxml/xmlwin32version.h")
endif()

