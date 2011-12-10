cmake_minimum_required(VERSION 2.8.4)
project(extragear)

find_package(Qt4 REQUIRED)

include(../SuperBuild.cmake)

# external projects
sb_add_project(libgcal GIT_REPOSITORY git://gitorious.org/libgcal/libgcal.git)

# extragear projects
sb_add_project(QtModemManager GIT_REPOSITORY ${SB_GIT_URL}libmm-qt )
sb_add_project(QtNetworkManager GIT_REPOSITORY ${SB_GIT_URL}libnm-qt )
sb_add_project(networkmanagement  GIT_REPOSITORY ${SB_GIT_URL}networkmanagement DEPENDS QtModemManager QtNetworkManager )
sb_add_project(polkit-kde-agent-1  GIT_REPOSITORY ${SB_GIT_URL}polkit-kde-agent-1 )
sb_add_project(polkit-kde-kcmodules-1  GIT_REPOSITORY ${SB_GIT_URL}polkit-kde-kcmodules-1 )
sb_add_project(kipi-plugins GIT_REPOSITORY ${SB_GIT_URL}kipi-plugins )
sb_add_project(libksane GIT_REPOSITORY ${SB_GIT_URL}libksane )
sb_add_project(skanlite GIT_REPOSITORY ${SB_GIT_URL}skanlite DEPENDS libksane)
sb_add_project(konversation  GIT_REPOSITORY ${SB_GIT_URL}konversation )
sb_add_project(akonadi-googledata-resource GIT_REPOSITORY ${SB_GIT_URL}akonadi-googledata-resource DEPENDS libgcal)
sb_add_project(krusader  GIT_REPOSITORY ${SB_GIT_URL}krusader )
sb_add_project(kdevplatform  GIT_REPOSITORY ${SB_GIT_URL}kdevplatform )
sb_add_project(kdevelop GIT_REPOSITORY ${SB_GIT_URL}kdevelop DEPENDS kdevplatform)


set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER} )
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
