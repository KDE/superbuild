cmake_minimum_required(VERSION 2.8.4)
project(KDEPlasmaAddons)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

sb_add_project(kdeplasma-addons  GIT_REPOSITORY git://anongit.kde.org/kdeplasma-addons)

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
