cmake_minimum_required(VERSION 2.8.4)
project(KDEGraphics)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

sb_add_project(LibKipi     GIT_REPOSITORY git://anongit.kde.org/libkipi )
sb_add_project(LibKSane    GIT_REPOSITORY git://anongit.kde.org/libksane )
sb_add_project(LibKexiv2   GIT_REPOSITORY git://anongit.kde.org/libkexiv2 )
sb_add_project(LibKdcraw   GIT_REPOSITORY git://anongit.kde.org/libkdcraw )

sb_add_project(KolourPaint GIT_REPOSITORY git://anongit.kde.org/kolourpaint )
sb_add_project(Okular      GIT_REPOSITORY git://anongit.kde.org/okular )


set(CPACK_PACKAGE_VERSION 1.2.3)
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
