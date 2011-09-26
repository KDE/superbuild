cmake_minimum_required(VERSION 2.8.4)
project(KDEBase)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

# Provide extra cache entries for those subprojects which don't use the KDE/x.y naming scheme for their release branches:
#set(SB_GIT_TAG_Okular master CACHE STRING "The git tag to use for Okular. Okular uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")
#set(SB_GIT_TAG_MobiPocket master CACHE STRING "The git tag to use for MobiPocket. MobiPocket uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")

sb_add_project(kactivities   GIT_REPOSITORY ${SB_GIT_URL}kactivities )
sb_add_project(kde-runtime   GIT_REPOSITORY ${SB_GIT_URL}kde-runtime )
sb_add_project(konsole       GIT_REPOSITORY ${SB_GIT_URL}konsole )
sb_add_project(kde-baseapps  GIT_REPOSITORY ${SB_GIT_URL}kde-baseapps )
sb_add_project(kde-workspace GIT_REPOSITORY ${SB_GIT_URL}kde-workspace DEPENDS kactivities )
sb_add_project(kate          GIT_REPOSITORY ${SB_GIT_URL}kate )

sb_add_project(kdemultimedia SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdemultimedia DEPENDS automoc4)

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
