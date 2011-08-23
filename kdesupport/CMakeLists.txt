cmake_minimum_required(VERSION 2.8.4)
project(KDESupport)

find_package(Qt4 REQUIRED)

include(../SuperBuild.cmake)


sb_add_project(Automoc4 GIT_REPOSITORY ${SB_GIT_URL}automoc )

sb_add_project(Soprano  GIT_REPOSITORY ${SB_GIT_URL}soprano DEPENDS Automoc4)

sb_add_project(Akonadi  GIT_REPOSITORY ${SB_GIT_URL}akonadi DEPENDS Automoc4 Soprano)
sb_add_project(Attica   GIT_REPOSITORY ${SB_GIT_URL}attica DEPENDS Automoc4 )
sb_add_project(Cagibi   GIT_REPOSITORY ${SB_GIT_URL}cagibi DEPENDS Automoc4 )

sb_add_project(Grantlee GIT_REPOSITORY git://gitorious.org/grantlee/grantlee.git)

sb_add_project(Prison   GIT_REPOSITORY ${SB_GIT_URL}prison )
sb_add_project(PolKitQt GIT_REPOSITORY ${SB_GIT_URL}polkit-qt-1 DEPENDS Automoc4)

sb_add_project(Phonon   GIT_REPOSITORY ${SB_GIT_URL}phonon
#                        CMAKE_ARGS -DPHONON_MKSPECS_DIR=share/qt4/mkspecs/modules -DPHONON_QT_PLUGIN_INSTALL_DIR=lib/qt4/plugins/designer/
                        DEPENDS Automoc4)

sb_add_project(Phonon-GStreamer GIT_REPOSITORY ${SB_GIT_URL}phonon-gstreamer DEPENDS Phonon)
#sb_add_project(Phonon-MMF       GIT_REPOSITORY ${SB_GIT_URL}phonon-mmf  DEPENDS Phonon)
#Phonon-MPlayer is currently unmaintained
#sb_add_project(Phonon-MPlayer   GIT_REPOSITORY ${SB_GIT_URL}phonon-mplayer )
sb_add_project(Phonon-VLC       GIT_REPOSITORY ${SB_GIT_URL}phonon-vlc DEPENDS Phonon Automoc4)

#sb_add_project(Phonon-WaveOut   GIT_REPOSITORY ${SB_GIT_URL}phonon-waveout DEPENDS Phonon)
#Phonon-Xine is deprecated and unmaintained.
#sb_add_project(Phonon-Xine      GIT_REPOSITORY ${SB_GIT_URL}phonon-xine  DEPENDS Phonon)

if(WIN32)
   sb_add_project(Phonon-DirectShow      GIT_REPOSITORY ${SB_GIT_URL}phonon-directshow )
endif()

if(APPLE)
   sb_add_project(Phonon-QuickTime       GIT_REPOSITORY ${SB_GIT_URL}phonon-quicktime )
endif()

sb_add_project(LibStreams GIT_REPOSITORY ${SB_GIT_URL}libstreams.git)
sb_add_project(LibStreamAnalyzer GIT_REPOSITORY ${SB_GIT_URL}libstreamanalyzer.git DEPENDS LibStreams)
sb_add_project(StrigiDaemon GIT_REPOSITORY ${SB_GIT_URL}strigidaemon.git DEPENDS LibStreamAnalyzer)
sb_add_project(StrigiClient GIT_REPOSITORY ${SB_GIT_URL}strigiclient.git DEPENDS LibStreamAnalyzer StrigiDaemon)
sb_add_project(StrigiUtils GIT_REPOSITORY ${SB_GIT_URL}strigiutils.git DEPENDS LibStreamAnalyzer)

sb_add_project(qimageblitz SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/kdesupport/qimageblitz DEPENDS Automoc4)

set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER} )
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
