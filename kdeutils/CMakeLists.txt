cmake_minimum_required(VERSION 2.8.4)
project(KDEUtils)

find_package(Qt4 REQUIRED)

include(../SuperBuild.cmake)

# listed alphabetically
sb_add_project(ark              GIT_REPOSITORY git://anongit.kde.org/ark)
sb_add_project(kcalc            GIT_REPOSITORY git://anongit.kde.org/kcalc)

if(UNIX)
  sb_add_project(kremotecontrol GIT_REPOSITORY git://anongit.kde.org/kremotecontrol)
  sb_add_project(kdf            GIT_REPOSITORY git://anongit.kde.org/kdf)
  # K3Process
  sb_add_project(kfloppy        GIT_REPOSITORY git://anongit.kde.org/kfloppy)
  sb_add_project(printer-applet GIT_REPOSITORY git://anongit.kde.org/printer-applet)
endif(UNIX)

sb_add_project(filelight        GIT_REPOSITORY git://anongit.kde.org/filelight)
sb_add_project(kcharselect      GIT_REPOSITORY git://anongit.kde.org/kcharselect)
sb_add_project(kgpg             GIT_REPOSITORY git://anongit.kde.org/kgpg)
sb_add_project(ktimer           GIT_REPOSITORY git://anongit.kde.org/ktimer)
sb_add_project(kwallet          GIT_REPOSITORY git://anongit.kde.org/kwallet)
sb_add_project(sweeper          GIT_REPOSITORY git://anongit.kde.org/sweeper)

sb_add_project(superkaramba     GIT_REPOSITORY git://anongit.kde.org/superkaramba)

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_SYSTEM_NAME "src")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
