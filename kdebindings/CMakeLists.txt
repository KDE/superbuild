cmake_minimum_required(VERSION 2.8.4)
project(KDEBindings)

find_package(Qt4 REQUIRED)

include (../SuperBuild.cmake)

# Provide extra cache entries for those subprojects which don't use the KDE/x.y naming scheme for their release branches:
#set(SB_GIT_TAG_Okular master CACHE STRING "The git tag to use for Okular. Okular uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")
#set(SB_GIT_TAG_MobiPocket master CACHE STRING "The git tag to use for MobiPocket. MobiPocket uses currently (June 2011) \"x.y\" names for its KDE SC release branches instead of \"KDE/x.y\", as most other repositories do.")

sb_add_project(smokeqt     GIT_REPOSITORY git://anongit.kde.org/smokeqt )
sb_add_project(smokekde    GIT_REPOSITORY git://anongit.kde.org/smokekde )
sb_add_project(smokegen    GIT_REPOSITORY git://anongit.kde.org/smokegen )

# Ruby
sb_add_project(qtruby      GIT_REPOSITORY git://anongit.kde.org/qtruby  )
sb_add_project(korundum    GIT_REPOSITORY git://anongit.kde.org/korundum )

# Python
sb_add_project(pykde4      GIT_REPOSITORY git://anongit.kde.org/pykde4 )

#Perl
sb_add_project(perlqt      GIT_REPOSITORY git://anongit.kde.org/perlqt )
sb_add_project(perlkde     GIT_REPOSITORY git://anongit.kde.org/perlkde )

sb_add_project(kross       GIT_REPOSITORY git://anongit.kde.org/kross-interpreters )

# C#
sb_add_project(qyoto       GIT_REPOSITORY git://anongit.kde.org/qyoto )
sb_add_project(kimono      GIT_REPOSITORY git://anongit.kde.org/kimono )

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
