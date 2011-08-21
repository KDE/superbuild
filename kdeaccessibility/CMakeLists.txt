cmake_minimum_required(VERSION 2.8.4)
project(KDEAccessibility)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

sb_add_project(jovie       GIT_REPOSITORY ${SB_GIT_URL}jovie )
sb_add_project(kaccessible GIT_REPOSITORY ${SB_GIT_URL}kaccessible )
sb_add_project(kmag        GIT_REPOSITORY ${SB_GIT_URL}kmag )
sb_add_project(kmousetool  GIT_REPOSITORY ${SB_GIT_URL}kmousetool)
sb_add_project(kmouth      GIT_REPOSITORY ${SB_GIT_URL}kmouth )

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
