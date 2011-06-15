cmake_minimum_required(VERSION 2.8.4)
project(KDEGraphics)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

sb_add_project(LibKipi     GIT_REPOSITORY git://anongit.kde.org/libkipi )
sb_add_project(LibKSane    GIT_REPOSITORY git://anongit.kde.org/libksane )
sb_add_project(LibKexiv2   GIT_REPOSITORY git://anongit.kde.org/libkexiv2 )
sb_add_project(LibKdcraw   GIT_REPOSITORY git://anongit.kde.org/libkdcraw )

sb_add_project(Okular        GIT_REPOSITORY git://anongit.kde.org/okular )

sb_add_project(Gwenview      GIT_REPOSITORY git://anongit.kde.org/gwenview DEPENDS LibKipi )
sb_add_project(Kamera        GIT_REPOSITORY git://anongit.kde.org/kamera )
sb_add_project(KColorChooser GIT_REPOSITORY git://anongit.kde.org/kcolorchooser )
sb_add_project(KGamma        GIT_REPOSITORY git://anongit.kde.org/kgamma )
sb_add_project(KolourPaint   GIT_REPOSITORY git://anongit.kde.org/kolourpaint )
sb_add_project(KRuler        GIT_REPOSITORY git://anongit.kde.org/kruler )
sb_add_project(KSnapshot     GIT_REPOSITORY git://anongit.kde.org/ksnapshot DEPENDS LibKipi )
sb_add_project(KSanePlugin   GIT_REPOSITORY git://anongit.kde.org/ksaneplugin DEPENDS LibKSane )
sb_add_project(MobiPocket    GIT_REPOSITORY git://anongit.kde.org/mobipocket DEPENDS Okular )
sb_add_project(SvgPart       GIT_REPOSITORY git://anongit.kde.org/svgpart )
sb_add_project(KDEGraphicsThumbnailers   GIT_REPOSITORY git://anongit.kde.org/kdegraphics-thumbnailers DEPENDS LibKexiv2 LibKdcraw )
sb_add_project(KDEGraphicsStrigiAnalyzer GIT_REPOSITORY git://anongit.kde.org/kdegraphics-strigi-analyzer )


set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
