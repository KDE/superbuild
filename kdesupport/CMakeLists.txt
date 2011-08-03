cmake_minimum_required(VERSION 2.8.4)
project(KDESupport)

find_package(Qt4 REQUIRED)

include(../SuperBuild.cmake)


sb_add_project(Automoc4 GIT_REPOSITORY git://anongit.kde.org/automoc )

sb_add_project(Soprano  GIT_REPOSITORY git://anongit.kde.org/soprano DEPENDS Automoc4)

sb_add_project(Akonadi  GIT_REPOSITORY git://anongit.kde.org/akonadi DEPENDS Automoc4 Soprano)
sb_add_project(Attica   GIT_REPOSITORY git://anongit.kde.org/attica DEPENDS Automoc4 )
sb_add_project(Cagibi   GIT_REPOSITORY git://anongit.kde.org/cagibi DEPENDS Automoc4 )

sb_add_project(Grantlee GIT_REPOSITORY git://gitorious.org/grantlee/grantlee.git)

sb_add_project(Prison   GIT_REPOSITORY git://anongit.kde.org/prison )
sb_add_project(PolKitQt GIT_REPOSITORY git://anongit.kde.org/polkit-qt-1 DEPENDS Automoc4)

sb_add_project(Phonon   GIT_REPOSITORY git://anongit.kde.org/phonon
#                        CMAKE_ARGS -DPHONON_MKSPECS_DIR=share/qt4/mkspecs/modules -DPHONON_QT_PLUGIN_INSTALL_DIR=lib/qt4/plugins/designer/
                        DEPENDS Automoc4)

sb_add_project(Phonon-GStreamer GIT_REPOSITORY git://anongit.kde.org/phonon-gstreamer DEPENDS Phonon)
#sb_add_project(Phonon-MMF       GIT_REPOSITORY git://anongit.kde.org/phonon-mmf  DEPENDS Phonon)
#Phonon-MPlayer is currently unmaintained
#sb_add_project(Phonon-MPlayer   GIT_REPOSITORY git://anongit.kde.org/phonon-mplayer )
sb_add_project(Phonon-VLC       GIT_REPOSITORY git://anongit.kde.org/phonon-vlc DEPENDS Phonon Automoc4)

#sb_add_project(Phonon-WaveOut   GIT_REPOSITORY git://anongit.kde.org/phonon-waveout DEPENDS Phonon)
#Phonon-Xine is deprecated and unmaintained.
#sb_add_project(Phonon-Xine      GIT_REPOSITORY git://anongit.kde.org/phonon-xine  DEPENDS Phonon)

if(WIN32)
   sb_add_project(Phonon-DirectShow      GIT_REPOSITORY git://anongit.kde.org/phonon-directshow )
endif()

if(APPLE)
   sb_add_project(Phonon-QuickTime       GIT_REPOSITORY git://anongit.kde.org/phonon-quicktime )
endif()

sb_add_project(LibStreams GIT_REPOSITORY git://anongit.kde.org/libstreams.git)
sb_add_project(LibStreamAnalyzer GIT_REPOSITORY git://anongit.kde.org/libstreamanalyzer.git DEPENDS LibStreams)
sb_add_project(StrigiDaemon GIT_REPOSITORY git://anongit.kde.org/strigidaemon.git DEPENDS LibStreamAnalyzer)
sb_add_project(StrigiClient GIT_REPOSITORY git://anongit.kde.org/strigiclient.git DEPENDS LibStreamAnalyzer StrigiDaemon)
sb_add_project(StrigiUtils GIT_REPOSITORY git://anongit.kde.org/strigiutils.git DEPENDS LibStreamAnalyzer)


set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER} )
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
