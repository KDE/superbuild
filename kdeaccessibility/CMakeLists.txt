cmake_minimum_required(VERSION 2.8.4)
project(KDEAccessibility)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

# Provide extra cache entries for those subprojects which don't use the KDE/x.y naming scheme for their release branches:
#set(SB_GIT_TAG_Okular master CACHE STRING "The git tag to use for Okular. Okular uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")
#set(SB_GIT_TAG_MobiPocket master CACHE STRING "The git tag to use for MobiPocket. MobiPocket uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")

sb_add_project(jovie       GIT_REPOSITORY git://anongit.kde.org/jovie )
sb_add_project(kaccessible GIT_REPOSITORY git://anongit.kde.org/kaccessible )
sb_add_project(kmag        GIT_REPOSITORY git://anongit.kde.org/kmag )
sb_add_project(kmousetool  GIT_REPOSITORY git://anongit.kde.org/kmousetool)
sb_add_project(kmouth      GIT_REPOSITORY git://anongit.kde.org/kmouth )

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
