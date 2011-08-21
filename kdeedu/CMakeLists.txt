cmake_minimum_required(VERSION 2.8.4)
project(KDEEdu)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

# Provide extra cache entries for those subprojects which don't use the KDE/x.y naming scheme for their release branches:
#set(SB_GIT_TAG_Okular master CACHE STRING "The git tag to use for Okular. Okular uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")
#set(SB_GIT_TAG_MobiPocket master CACHE STRING "The git tag to use for MobiPocket. MobiPocket uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")

sb_add_project(libkdeedu  GIT_REPOSITORY ${SB_GIT_URL}libkdeedu)

sb_add_project(step       GIT_REPOSITORY ${SB_GIT_URL}step)
sb_add_project(rocs       GIT_REPOSITORY ${SB_GIT_URL}rocs)
sb_add_project(parley     GIT_REPOSITORY ${SB_GIT_URL}parley DEPENDS libkdeedu)
sb_add_project(marble     GIT_REPOSITORY ${SB_GIT_URL}marble)
sb_add_project(kwordquiz  GIT_REPOSITORY ${SB_GIT_URL}kwordquiz DEPENDS libkdeedu)
sb_add_project(kturtle    GIT_REPOSITORY ${SB_GIT_URL}kturtle)
sb_add_project(ktouch     GIT_REPOSITORY ${SB_GIT_URL}ktouch)
sb_add_project(kstars     GIT_REPOSITORY ${SB_GIT_URL}kstars)
sb_add_project(kmplot     GIT_REPOSITORY ${SB_GIT_URL}kmplot)
sb_add_project(klettres   GIT_REPOSITORY ${SB_GIT_URL}klettres)
sb_add_project(kiten      GIT_REPOSITORY ${SB_GIT_URL}kiten)
sb_add_project(kig        GIT_REPOSITORY ${SB_GIT_URL}kig)
sb_add_project(khangman   GIT_REPOSITORY ${SB_GIT_URL}khangman DEPENDS libkdeedu)
sb_add_project(kgeography GIT_REPOSITORY ${SB_GIT_URL}kgeography)
sb_add_project(kbruch     GIT_REPOSITORY ${SB_GIT_URL}kbruch)
sb_add_project(kanagram   GIT_REPOSITORY ${SB_GIT_URL}kanagram DEPENDS libkdeedu)
sb_add_project(kalzium    GIT_REPOSITORY ${SB_GIT_URL}kalzium)
sb_add_project(kalgebra   GIT_REPOSITORY ${SB_GIT_URL}kalgebra DEPENDS libkdeedu)
sb_add_project(cantor     GIT_REPOSITORY ${SB_GIT_URL}cantor)
sb_add_project(blinken    GIT_REPOSITORY ${SB_GIT_URL}blinken)

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
