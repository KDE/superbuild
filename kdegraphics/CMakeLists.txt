cmake_minimum_required(VERSION 2.8.4)
project(KDEGraphics)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

# Provide extra cache entries for those subprojects which don't use the KDE/x.y naming scheme for their release branches:
set(SB_GIT_TAG_Okular master CACHE STRING "The git tag to use for Okular. Okular uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")
set(SB_GIT_TAG_MobiPocket master CACHE STRING "The git tag to use for MobiPocket. MobiPocket uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")

sb_add_project(LibKipi     GIT_REPOSITORY ${SB_GIT_URL}libkipi )
sb_add_project(LibKSane    GIT_REPOSITORY ${SB_GIT_URL}libksane )
sb_add_project(LibKexiv2   GIT_REPOSITORY ${SB_GIT_URL}libkexiv2 )
sb_add_project(LibKdcraw   GIT_REPOSITORY ${SB_GIT_URL}libkdcraw )

sb_add_project(Okular        GIT_REPOSITORY ${SB_GIT_URL}okular )

sb_add_project(Gwenview      GIT_REPOSITORY ${SB_GIT_URL}gwenview DEPENDS LibKipi )
sb_add_project(Kamera        GIT_REPOSITORY ${SB_GIT_URL}kamera )
sb_add_project(KColorChooser GIT_REPOSITORY ${SB_GIT_URL}kcolorchooser )
sb_add_project(KGamma        GIT_REPOSITORY ${SB_GIT_URL}kgamma )
sb_add_project(KolourPaint   GIT_REPOSITORY ${SB_GIT_URL}kolourpaint )
sb_add_project(KRuler        GIT_REPOSITORY ${SB_GIT_URL}kruler )
sb_add_project(KSnapshot     GIT_REPOSITORY ${SB_GIT_URL}ksnapshot DEPENDS LibKipi )
sb_add_project(KSanePlugin   GIT_REPOSITORY ${SB_GIT_URL}ksaneplugin DEPENDS LibKSane )
sb_add_project(MobiPocket    GIT_REPOSITORY ${SB_GIT_URL}mobipocket DEPENDS Okular )
sb_add_project(SvgPart       GIT_REPOSITORY ${SB_GIT_URL}svgpart )
sb_add_project(KDEGraphicsThumbnailers   GIT_REPOSITORY ${SB_GIT_URL}kdegraphics-thumbnailers DEPENDS LibKexiv2 LibKdcraw )
sb_add_project(KDEGraphicsStrigiAnalyzer GIT_REPOSITORY ${SB_GIT_URL}kdegraphics-strigi-analyzer )


set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
