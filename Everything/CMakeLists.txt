cmake_minimum_required(VERSION 2.8.4)
project(KDEEverything)

find_package(Qt4 REQUIRED)

include(../SuperBuild.cmake)


# Qt
sb_add_project(qt GIT_REPOSITORY git://anongit.kde.org/qt SUBDIR qt_qt
              )

# kdesupport
sb_add_project(phonon GIT_REPOSITORY git://anongit.kde.org/phonon SUBDIR kdesupport_phonon_phonon
              )
sb_add_project(phonon-directshow GIT_REPOSITORY git://anongit.kde.org/phonon-directshow SUBDIR kdesupport_phonon_phonon-directshow
              )
sb_add_project(phonon-gstreamer GIT_REPOSITORY git://anongit.kde.org/phonon-gstreamer SUBDIR kdesupport_phonon_phonon-gstreamer
              )
sb_add_project(phonon-mmf GIT_REPOSITORY git://anongit.kde.org/phonon-mmf SUBDIR kdesupport_phonon_phonon-mmf
              )
sb_add_project(phonon-mplayer GIT_REPOSITORY git://anongit.kde.org/phonon-mplayer SUBDIR kdesupport_phonon_phonon-mplayer
              )
sb_add_project(phonon-quicktime GIT_REPOSITORY git://anongit.kde.org/phonon-quicktime SUBDIR kdesupport_phonon_phonon-quicktime
              )
sb_add_project(phonon-vlc GIT_REPOSITORY git://anongit.kde.org/phonon-vlc SUBDIR kdesupport_phonon_phonon-vlc
              )
sb_add_project(phonon-waveout GIT_REPOSITORY git://anongit.kde.org/phonon-waveout SUBDIR kdesupport_phonon_phonon-waveout
              )
sb_add_project(phonon-xine GIT_REPOSITORY git://anongit.kde.org/phonon-xine SUBDIR kdesupport_phonon_phonon-xine
              )
sb_add_project(libstreamanalyzer GIT_REPOSITORY git://anongit.kde.org/libstreamanalyzer SUBDIR kdesupport_strigi_libstreamanalyzer
              )
sb_add_project(libstreams GIT_REPOSITORY git://anongit.kde.org/libstreams SUBDIR kdesupport_strigi_libstreams
              )
sb_add_project(strigi GIT_REPOSITORY git://anongit.kde.org/strigi SUBDIR kdesupport_strigi_strigi
              )
sb_add_project(strigiclient GIT_REPOSITORY git://anongit.kde.org/strigiclient SUBDIR kdesupport_strigi_strigiclient
              )
sb_add_project(strigidaemon GIT_REPOSITORY git://anongit.kde.org/strigidaemon SUBDIR kdesupport_strigi_strigidaemon
              )
sb_add_project(strigiutils GIT_REPOSITORY git://anongit.kde.org/strigiutils SUBDIR kdesupport_strigi_strigiutils
              )
sb_add_project(akonadi GIT_REPOSITORY git://anongit.kde.org/akonadi SUBDIR kdesupport_akonadi
              )
sb_add_project(attica GIT_REPOSITORY git://anongit.kde.org/attica SUBDIR kdesupport_attica
              )
sb_add_project(automoc GIT_REPOSITORY git://anongit.kde.org/automoc SUBDIR kdesupport_automoc
              )
sb_add_project(cagibi GIT_REPOSITORY git://anongit.kde.org/cagibi SUBDIR kdesupport_cagibi
              )
sb_add_project(emerge GIT_REPOSITORY git://anongit.kde.org/emerge SUBDIR kdesupport_emerge
              )
sb_add_project(extra-cmake-modules GIT_REPOSITORY git://anongit.kde.org/extra-cmake-modules SUBDIR kdesupport_extra-cmake-modules
              )
sb_add_project(inqlude GIT_REPOSITORY git://anongit.kde.org/inqlude SUBDIR kdesupport_inqlude
              )
sb_add_project(inqlude-data GIT_REPOSITORY git://anongit.kde.org/inqlude-data SUBDIR kdesupport_inqlude-data
              )
sb_add_project(kdewin GIT_REPOSITORY git://anongit.kde.org/kdewin SUBDIR kdesupport_kdewin
              )
sb_add_project(kdewin-installer GIT_REPOSITORY git://anongit.kde.org/kdewin-installer SUBDIR kdesupport_kdewin-installer
              )
sb_add_project(libqzeitgeist GIT_REPOSITORY git://anongit.kde.org/libqzeitgeist SUBDIR kdesupport_libqzeitgeist
              )
sb_add_project(polkit-qt-1 GIT_REPOSITORY git://anongit.kde.org/polkit-qt-1 SUBDIR kdesupport_polkit-qt-1
              )
sb_add_project(prison GIT_REPOSITORY git://anongit.kde.org/prison SUBDIR kdesupport_prison
              )
sb_add_project(soprano GIT_REPOSITORY git://anongit.kde.org/soprano SUBDIR kdesupport_soprano
              )


# kdelibs
sb_add_project(kdelibs GIT_REPOSITORY git://anongit.kde.org/kdelibs SUBDIR kde_kdelibs
              )
sb_add_project(kactivities GIT_REPOSITORY git://anongit.kde.org/kactivities SUBDIR kde_kdelibs_kactivities
              )
sb_add_project(nepomuk-core GIT_REPOSITORY git://anongit.kde.org/nepomuk-core SUBDIR kde_kdelibs_nepomuk-core
              )


# KDE base
sb_add_project(kde-baseapps GIT_REPOSITORY git://anongit.kde.org/kde-baseapps SUBDIR kde_kde-baseapps
              )
sb_add_project(kde-runtime GIT_REPOSITORY git://anongit.kde.org/kde-runtime SUBDIR kde_kde-runtime
              )
sb_add_project(kde-workspace GIT_REPOSITORY git://anongit.kde.org/kde-workspace SUBDIR kde_kde-workspace
              )
sb_add_project(kate GIT_REPOSITORY git://anongit.kde.org/kate SUBDIR kde_kde-baseapps_kate
              )
sb_add_project(konsole GIT_REPOSITORY git://anongit.kde.org/konsole SUBDIR kde_kde-baseapps_konsole
              )


# still in svn:
sb_add_project(kdegames      SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdegames )
sb_add_project(kdeadmin      SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeadmin )
sb_add_project(kdemultimedia SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdemultimedia )
sb_add_project(kdenetwork    SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdenetwork )
sb_add_project(kdesdk        SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdesdk )
sb_add_project(kdetoys       SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdetoys )
sb_add_project(kdewebdev     SVN_REPOSITORY svn://anonsvn.kde.org/home/kde/trunk/KDE/kdewebdev )


# KDE accessibility
sb_add_project(jovie GIT_REPOSITORY git://anongit.kde.org/jovie SUBDIR kde_kdeaccessibility_jovie
              )
sb_add_project(kaccessible GIT_REPOSITORY git://anongit.kde.org/kaccessible SUBDIR kde_kdeaccessibility_kaccessible
              )
sb_add_project(kmag GIT_REPOSITORY git://anongit.kde.org/kmag SUBDIR kde_kdeaccessibility_kmag
              )
sb_add_project(kmousetool GIT_REPOSITORY git://anongit.kde.org/kmousetool SUBDIR kde_kdeaccessibility_kmousetool
              )
sb_add_project(kmouth GIT_REPOSITORY git://anongit.kde.org/kmouth SUBDIR kde_kdeaccessibility_kmouth
              )


# KDE bindings
sb_add_project(kimono GIT_REPOSITORY git://anongit.kde.org/kimono SUBDIR kde_kdebindings_csharp_kimono
              )
sb_add_project(qyoto GIT_REPOSITORY git://anongit.kde.org/qyoto SUBDIR kde_kdebindings_csharp_qyoto
              )
sb_add_project(perlkde GIT_REPOSITORY git://anongit.kde.org/perlkde SUBDIR kde_kdebindings_perl_perlkde
              )
sb_add_project(perlqt GIT_REPOSITORY git://anongit.kde.org/perlqt SUBDIR kde_kdebindings_perl_perlqt
              )
sb_add_project(korundum GIT_REPOSITORY git://anongit.kde.org/korundum SUBDIR kde_kdebindings_ruby_korundum
              )
sb_add_project(qtruby GIT_REPOSITORY git://anongit.kde.org/qtruby SUBDIR kde_kdebindings_ruby_qtruby
              )
sb_add_project(smokegen GIT_REPOSITORY git://anongit.kde.org/smokegen SUBDIR kde_kdebindings_smoke_smokegen
              )
sb_add_project(smokekde GIT_REPOSITORY git://anongit.kde.org/smokekde SUBDIR kde_kdebindings_smoke_smokekde
              )
sb_add_project(smokeqt GIT_REPOSITORY git://anongit.kde.org/smokeqt SUBDIR kde_kdebindings_smoke_smokeqt
              )
sb_add_project(kross-interpreters GIT_REPOSITORY git://anongit.kde.org/kross-interpreters SUBDIR kde_kdebindings_kross-interpreters
              )
sb_add_project(pykde4 GIT_REPOSITORY git://anongit.kde.org/pykde4 SUBDIR kde_kdebindings_pykde4
              )


# KDE edu
sb_add_project(analitza GIT_REPOSITORY git://anongit.kde.org/analitza SUBDIR kde_kdeedu_analitza
              )
sb_add_project(blinken GIT_REPOSITORY git://anongit.kde.org/blinken SUBDIR kde_kdeedu_blinken
              )
sb_add_project(cantor GIT_REPOSITORY git://anongit.kde.org/cantor SUBDIR kde_kdeedu_cantor
              )
sb_add_project(kalgebra GIT_REPOSITORY git://anongit.kde.org/kalgebra SUBDIR kde_kdeedu_kalgebra
              )
sb_add_project(kalzium GIT_REPOSITORY git://anongit.kde.org/kalzium SUBDIR kde_kdeedu_kalzium
              )
sb_add_project(kanagram GIT_REPOSITORY git://anongit.kde.org/kanagram SUBDIR kde_kdeedu_kanagram
              )
sb_add_project(kbruch GIT_REPOSITORY git://anongit.kde.org/kbruch SUBDIR kde_kdeedu_kbruch
              )
sb_add_project(kgeography GIT_REPOSITORY git://anongit.kde.org/kgeography SUBDIR kde_kdeedu_kgeography
              )
sb_add_project(khangman GIT_REPOSITORY git://anongit.kde.org/khangman SUBDIR kde_kdeedu_khangman
              )
sb_add_project(kig GIT_REPOSITORY git://anongit.kde.org/kig SUBDIR kde_kdeedu_kig
              )
sb_add_project(kiten GIT_REPOSITORY git://anongit.kde.org/kiten SUBDIR kde_kdeedu_kiten
              )
sb_add_project(klettres GIT_REPOSITORY git://anongit.kde.org/klettres SUBDIR kde_kdeedu_klettres
              )
sb_add_project(kmplot GIT_REPOSITORY git://anongit.kde.org/kmplot SUBDIR kde_kdeedu_kmplot
              )
sb_add_project(kstars GIT_REPOSITORY git://anongit.kde.org/kstars SUBDIR kde_kdeedu_kstars
              )
sb_add_project(ktouch GIT_REPOSITORY git://anongit.kde.org/ktouch SUBDIR kde_kdeedu_ktouch
              )
sb_add_project(kturtle GIT_REPOSITORY git://anongit.kde.org/kturtle SUBDIR kde_kdeedu_kturtle
              )
sb_add_project(kwordquiz GIT_REPOSITORY git://anongit.kde.org/kwordquiz SUBDIR kde_kdeedu_kwordquiz
              )
sb_add_project(libkdeedu GIT_REPOSITORY git://anongit.kde.org/libkdeedu SUBDIR kde_kdeedu_libkdeedu
              )
sb_add_project(marble GIT_REPOSITORY git://anongit.kde.org/marble SUBDIR kde_kdeedu_marble
              )
sb_add_project(parley GIT_REPOSITORY git://anongit.kde.org/parley SUBDIR kde_kdeedu_parley
              )
sb_add_project(rocs GIT_REPOSITORY git://anongit.kde.org/rocs SUBDIR kde_kdeedu_rocs
              )
sb_add_project(step GIT_REPOSITORY git://anongit.kde.org/step SUBDIR kde_kdeedu_step
              )


# KDE graphics
sb_add_project(kdegraphics GIT_REPOSITORY git://anongit.kde.org/kdegraphics SUBDIR kde_kdegraphics
              )
sb_add_project(libkdcraw GIT_REPOSITORY git://anongit.kde.org/libkdcraw SUBDIR kde_kdegraphics_libs_libkdcraw
              )
sb_add_project(libkexiv2 GIT_REPOSITORY git://anongit.kde.org/libkexiv2 SUBDIR kde_kdegraphics_libs_libkexiv2
              )
sb_add_project(libkipi GIT_REPOSITORY git://anongit.kde.org/libkipi SUBDIR kde_kdegraphics_libs_libkipi
              )
sb_add_project(libksane GIT_REPOSITORY git://anongit.kde.org/libksane SUBDIR kde_kdegraphics_libs_libksane
              )
sb_add_project(gwenview GIT_REPOSITORY git://anongit.kde.org/gwenview SUBDIR kde_kdegraphics_gwenview
              )
sb_add_project(kamera GIT_REPOSITORY git://anongit.kde.org/kamera SUBDIR kde_kdegraphics_kamera
              )
sb_add_project(kcolorchooser GIT_REPOSITORY git://anongit.kde.org/kcolorchooser SUBDIR kde_kdegraphics_kcolorchooser
              )
sb_add_project(kdegraphics-strigi-analyzer GIT_REPOSITORY git://anongit.kde.org/kdegraphics-strigi-analyzer SUBDIR kde_kdegraphics_kdegraphics-strigi-analyzer
              )
sb_add_project(kdegraphics-thumbnailers GIT_REPOSITORY git://anongit.kde.org/kdegraphics-thumbnailers SUBDIR kde_kdegraphics_kdegraphics-thumbnailers
              )
sb_add_project(kgamma GIT_REPOSITORY git://anongit.kde.org/kgamma SUBDIR kde_kdegraphics_kgamma
              )
sb_add_project(kolourpaint GIT_REPOSITORY git://anongit.kde.org/kolourpaint SUBDIR kde_kdegraphics_kolourpaint
              )
sb_add_project(kruler GIT_REPOSITORY git://anongit.kde.org/kruler SUBDIR kde_kdegraphics_kruler
              )
sb_add_project(ksaneplugin GIT_REPOSITORY git://anongit.kde.org/ksaneplugin SUBDIR kde_kdegraphics_ksaneplugin
              )
sb_add_project(ksnapshot GIT_REPOSITORY git://anongit.kde.org/ksnapshot SUBDIR kde_kdegraphics_ksnapshot
              )
sb_add_project(mobipocket GIT_REPOSITORY git://anongit.kde.org/mobipocket SUBDIR kde_kdegraphics_mobipocket
              )
sb_add_project(okular GIT_REPOSITORY git://anongit.kde.org/okular SUBDIR kde_kdegraphics_okular
              )
sb_add_project(svgpart GIT_REPOSITORY git://anongit.kde.org/svgpart SUBDIR kde_kdegraphics_svgpart
              )


# kdeutils
sb_add_project(ark GIT_REPOSITORY git://anongit.kde.org/ark SUBDIR kde_kdeutils_ark
              )
sb_add_project(filelight GIT_REPOSITORY git://anongit.kde.org/filelight SUBDIR kde_kdeutils_filelight
              )
sb_add_project(kcalc GIT_REPOSITORY git://anongit.kde.org/kcalc SUBDIR kde_kdeutils_kcalc
              )
sb_add_project(kcharselect GIT_REPOSITORY git://anongit.kde.org/kcharselect SUBDIR kde_kdeutils_kcharselect
              )
sb_add_project(kdf GIT_REPOSITORY git://anongit.kde.org/kdf SUBDIR kde_kdeutils_kdf
              )
sb_add_project(kfloppy GIT_REPOSITORY git://anongit.kde.org/kfloppy SUBDIR kde_kdeutils_kfloppy
              )
sb_add_project(kgpg GIT_REPOSITORY git://anongit.kde.org/kgpg SUBDIR kde_kdeutils_kgpg
              )
sb_add_project(kremotecontrol GIT_REPOSITORY git://anongit.kde.org/kremotecontrol SUBDIR kde_kdeutils_kremotecontrol
              )
sb_add_project(ksecrets GIT_REPOSITORY git://anongit.kde.org/ksecrets SUBDIR kde_kdeutils_ksecrets
              )
sb_add_project(ktimer GIT_REPOSITORY git://anongit.kde.org/ktimer SUBDIR kde_kdeutils_ktimer
              )
sb_add_project(kwallet GIT_REPOSITORY git://anongit.kde.org/kwallet SUBDIR kde_kdeutils_kwallet
              )
sb_add_project(printer-applet GIT_REPOSITORY git://anongit.kde.org/printer-applet SUBDIR kde_kdeutils_printer-applet
              )
sb_add_project(superkaramba GIT_REPOSITORY git://anongit.kde.org/superkaramba SUBDIR kde_kdeutils_superkaramba
              )
sb_add_project(sweeper GIT_REPOSITORY git://anongit.kde.org/sweeper SUBDIR kde_kdeutils_sweeper
              )


# kdepim
sb_add_project(kdepim GIT_REPOSITORY git://anongit.kde.org/kdepim SUBDIR kde_kdepim
              )
sb_add_project(kdepim-runtime GIT_REPOSITORY git://anongit.kde.org/kdepim-runtime SUBDIR kde_kdepim-runtime
              )
sb_add_project(kdepimlibs GIT_REPOSITORY git://anongit.kde.org/kdepimlibs SUBDIR kde_kdepimlibs
              )


# Calligra
sb_add_project(krita-analogies GIT_REPOSITORY git://anongit.kde.org/krita-analogies SUBDIR calligra_krita-extensions_krita-analogies
              )
sb_add_project(krita-cimg GIT_REPOSITORY git://anongit.kde.org/krita-cimg SUBDIR calligra_krita-extensions_krita-cimg
              )
sb_add_project(krita-ctlbrush GIT_REPOSITORY git://anongit.kde.org/krita-ctlbrush SUBDIR calligra_krita-extensions_krita-ctlbrush
              )
sb_add_project(krita-deskew GIT_REPOSITORY git://anongit.kde.org/krita-deskew SUBDIR calligra_krita-extensions_krita-deskew
              )
sb_add_project(krita-dither GIT_REPOSITORY git://anongit.kde.org/krita-dither SUBDIR calligra_krita-extensions_krita-dither
              )
sb_add_project(krita-grayscalizer GIT_REPOSITORY git://anongit.kde.org/krita-grayscalizer SUBDIR calligra_krita-extensions_krita-grayscalizer
              )
sb_add_project(krita-humanbody GIT_REPOSITORY git://anongit.kde.org/krita-humanbody SUBDIR calligra_krita-extensions_krita-humanbody
              )
sb_add_project(krita-imagecomplete GIT_REPOSITORY git://anongit.kde.org/krita-imagecomplete SUBDIR calligra_krita-extensions_krita-imagecomplete
              )
sb_add_project(krita-linesampler GIT_REPOSITORY git://anongit.kde.org/krita-linesampler SUBDIR calligra_krita-extensions_krita-linesampler
              )
sb_add_project(krita-pyramidalsharpening GIT_REPOSITORY git://anongit.kde.org/krita-pyramidalsharpening SUBDIR calligra_krita-extensions_krita-pyramidalsharpening
              )
sb_add_project(calligra GIT_REPOSITORY git://anongit.kde.org/calligra SUBDIR calligra_calligra
              )
sb_add_project(calligra-history GIT_REPOSITORY git://anongit.kde.org/calligra-history SUBDIR calligra_calligra-history
              )


# koffice
sb_add_project(koffice GIT_REPOSITORY git://anongit.kde.org/koffice SUBDIR koffice_koffice
              )
sb_add_project(koffice-plugins GIT_REPOSITORY git://anongit.kde.org/koffice-plugins SUBDIR koffice_koffice-plugins
              )


# Extragear
sb_add_project(kannasaver GIT_REPOSITORY git://anongit.kde.org/kannasaver SUBDIR extragear_artwork_kannasaver
              )
sb_add_project(bluedevil GIT_REPOSITORY git://anongit.kde.org/bluedevil SUBDIR extragear_base_bluedevil
              )
sb_add_project(kwebkitpart GIT_REPOSITORY git://anongit.kde.org/kwebkitpart SUBDIR extragear_base_kwebkitpart
              )
sb_add_project(networkmanagement GIT_REPOSITORY git://anongit.kde.org/networkmanagement SUBDIR extragear_base_networkmanagement
              )
sb_add_project(polkit-kde-agent-1 GIT_REPOSITORY git://anongit.kde.org/polkit-kde-agent-1 SUBDIR extragear_base_polkit-kde-agent-1
              )
sb_add_project(polkit-kde-kcmodules-1 GIT_REPOSITORY git://anongit.kde.org/polkit-kde-kcmodules-1 SUBDIR extragear_base_polkit-kde-kcmodules-1
              )
sb_add_project(wacomtablet GIT_REPOSITORY git://anongit.kde.org/wacomtablet SUBDIR extragear_base_wacomtablet
              )
sb_add_project(knights GIT_REPOSITORY git://anongit.kde.org/knights SUBDIR extragear_games_knights
              )
sb_add_project(digikam-doc GIT_REPOSITORY git://anongit.kde.org/digikam-doc SUBDIR extragear_graphics_digikam_digikam-doc
              )
sb_add_project(digikam-software-compilation GIT_REPOSITORY git://anongit.kde.org/digikam-software-compilation SUBDIR extragear_graphics_digikam_digikam-software-compilation
              )
sb_add_project(kipi-plugins-doc GIT_REPOSITORY git://anongit.kde.org/kipi-plugins-doc SUBDIR extragear_graphics_kipi-plugins_kipi-plugins-doc
              )
sb_add_project(digikam GIT_REPOSITORY git://anongit.kde.org/digikam SUBDIR extragear_graphics_digikam
              )
sb_add_project(kgraphviewer GIT_REPOSITORY git://anongit.kde.org/kgraphviewer SUBDIR extragear_graphics_kgraphviewer
              )
sb_add_project(kipi-plugins GIT_REPOSITORY git://anongit.kde.org/kipi-plugins SUBDIR extragear_graphics_kipi-plugins
              )
sb_add_project(kphotoalbum GIT_REPOSITORY git://anongit.kde.org/kphotoalbum SUBDIR extragear_graphics_kphotoalbum
              )
sb_add_project(skanlite GIT_REPOSITORY git://anongit.kde.org/skanlite SUBDIR extragear_graphics_skanlite
              )
sb_add_project(kdev-custom-buildsystem GIT_REPOSITORY git://anongit.kde.org/kdev-custom-buildsystem SUBDIR extragear_kdevelop_plugins_kdev-custom-buildsystem
              )
sb_add_project(kdev-php GIT_REPOSITORY git://anongit.kde.org/kdev-php SUBDIR extragear_kdevelop_plugins_kdev-php
              )
sb_add_project(kdev-php-docs GIT_REPOSITORY git://anongit.kde.org/kdev-php-docs SUBDIR extragear_kdevelop_plugins_kdev-php-docs
              )
sb_add_project(kdevelop-pg-qt GIT_REPOSITORY git://anongit.kde.org/kdevelop-pg-qt SUBDIR extragear_kdevelop_utilities_kdevelop-pg-qt
              )
sb_add_project(kdev-www GIT_REPOSITORY git://anongit.kde.org/kdev-www SUBDIR extragear_kdevelop_kdev-www
              )
sb_add_project(kdevelop GIT_REPOSITORY git://anongit.kde.org/kdevelop SUBDIR extragear_kdevelop_kdevelop
              )
sb_add_project(kdevplatform GIT_REPOSITORY git://anongit.kde.org/kdevplatform SUBDIR extragear_kdevelop_kdevplatform
              )
sb_add_project(libkface GIT_REPOSITORY git://anongit.kde.org/libkface SUBDIR extragear_libs_libkface
              )
sb_add_project(libkgeomap GIT_REPOSITORY git://anongit.kde.org/libkgeomap SUBDIR extragear_libs_libkgeomap
              )
sb_add_project(libkvkontakte GIT_REPOSITORY git://anongit.kde.org/libkvkontakte SUBDIR extragear_libs_libkvkontakte
              )
sb_add_project(libmediawiki GIT_REPOSITORY git://anongit.kde.org/libmediawiki SUBDIR extragear_libs_libmediawiki
              )
sb_add_project(amarok-history GIT_REPOSITORY git://anongit.kde.org/amarok-history SUBDIR extragear_multimedia_amarok_amarok-history
              )
sb_add_project(amarok GIT_REPOSITORY git://anongit.kde.org/amarok SUBDIR extragear_multimedia_amarok
              )
sb_add_project(k3b GIT_REPOSITORY git://anongit.kde.org/k3b SUBDIR extragear_multimedia_k3b
              )
sb_add_project(kaffeine GIT_REPOSITORY git://anongit.kde.org/kaffeine SUBDIR extragear_multimedia_kaffeine
              )
sb_add_project(kamoso GIT_REPOSITORY git://anongit.kde.org/kamoso SUBDIR extragear_multimedia_kamoso
              )
sb_add_project(kaudiocreator GIT_REPOSITORY git://anongit.kde.org/kaudiocreator SUBDIR extragear_multimedia_kaudiocreator
              )
sb_add_project(kdenlive GIT_REPOSITORY git://anongit.kde.org/kdenlive SUBDIR extragear_multimedia_kdenlive
              )
sb_add_project(kplayer GIT_REPOSITORY git://anongit.kde.org/kplayer SUBDIR extragear_multimedia_kplayer
              )
sb_add_project(choqok GIT_REPOSITORY git://anongit.kde.org/choqok SUBDIR extragear_network_choqok
              )
sb_add_project(kio-gopher GIT_REPOSITORY git://anongit.kde.org/kio-gopher SUBDIR extragear_network_kio-gopher
              )
sb_add_project(konversation GIT_REPOSITORY git://anongit.kde.org/konversation SUBDIR extragear_network_konversation
              )
sb_add_project(ktorrent GIT_REPOSITORY git://anongit.kde.org/ktorrent SUBDIR extragear_network_ktorrent
              )
sb_add_project(libktorrent GIT_REPOSITORY git://anongit.kde.org/libktorrent SUBDIR extragear_network_libktorrent
              )
sb_add_project(rekonq GIT_REPOSITORY git://anongit.kde.org/rekonq SUBDIR extragear_network_rekonq
              )
sb_add_project(wicd-kde GIT_REPOSITORY git://anongit.kde.org/wicd-kde SUBDIR extragear_network_wicd-kde
              )
sb_add_project(alkimia GIT_REPOSITORY git://anongit.kde.org/alkimia SUBDIR extragear_office_alkimia
              )
sb_add_project(kile GIT_REPOSITORY git://anongit.kde.org/kile SUBDIR extragear_office_kile
              )
sb_add_project(kmymoney GIT_REPOSITORY git://anongit.kde.org/kmymoney SUBDIR extragear_office_kmymoney
              )
sb_add_project(skrooge GIT_REPOSITORY git://anongit.kde.org/skrooge SUBDIR extragear_office_skrooge
              )
sb_add_project(tellico GIT_REPOSITORY git://anongit.kde.org/tellico SUBDIR extragear_office_tellico
              )
sb_add_project(akonadi-googledata-resource GIT_REPOSITORY git://anongit.kde.org/akonadi-googledata-resource SUBDIR extragear_pim_akonadi-googledata-resource
              )
sb_add_project(massif-visualizer GIT_REPOSITORY git://anongit.kde.org/massif-visualizer SUBDIR extragear_sdk_massif-visualizer
              )
sb_add_project(libdebconf-kde GIT_REPOSITORY git://anongit.kde.org/libdebconf-kde SUBDIR extragear_sysadmin_libdebconf-kde
              )
sb_add_project(libqapt GIT_REPOSITORY git://anongit.kde.org/libqapt SUBDIR extragear_sysadmin_libqapt
              )
sb_add_project(muon GIT_REPOSITORY git://anongit.kde.org/muon SUBDIR extragear_sysadmin_muon
              )
sb_add_project(kdesrc-build GIT_REPOSITORY git://anongit.kde.org/kdesrc-build SUBDIR extragear_utils_kdesrc-build
              )
sb_add_project(krusader GIT_REPOSITORY git://anongit.kde.org/krusader SUBDIR extragear_utils_krusader
              )
sb_add_project(nepomukshell GIT_REPOSITORY git://anongit.kde.org/nepomukshell SUBDIR extragear_utils_nepomukshell
              )
sb_add_project(rsibreak GIT_REPOSITORY git://anongit.kde.org/rsibreak SUBDIR extragear_utils_rsibreak
              )
sb_add_project(yakuake GIT_REPOSITORY git://anongit.kde.org/yakuake SUBDIR extragear_utils_yakuake
              )


# other modules
sb_add_project(kdeexamples GIT_REPOSITORY git://anongit.kde.org/kdeexamples SUBDIR kde_kdeexamples
              )
sb_add_project(kdeplasma-addons GIT_REPOSITORY git://anongit.kde.org/kdeplasma-addons SUBDIR kde_kdeplasma-addons
              )
sb_add_project(kcm-grub2 GIT_REPOSITORY git://anongit.kde.org/kcm-grub2 SUBDIR kdereview_kcm-grub2
              )
sb_add_project(ksecretservice GIT_REPOSITORY git://anongit.kde.org/ksecretservice SUBDIR kdereview_ksecretservice
              )


# KDE playground
sb_add_project(dekorator GIT_REPOSITORY git://anongit.kde.org/dekorator SUBDIR playground_artwork_dekorator
              )
sb_add_project(oxygen-gtk GIT_REPOSITORY git://anongit.kde.org/oxygen-gtk SUBDIR playground_artwork_oxygen-gtk
              )
sb_add_project(oxygen-transparent GIT_REPOSITORY git://anongit.kde.org/oxygen-transparent SUBDIR playground_artwork_oxygen-transparent
              )
sb_add_project(smaragd GIT_REPOSITORY git://anongit.kde.org/smaragd SUBDIR playground_artwork_smaragd
              )
sb_add_project(declarative-plasmoids GIT_REPOSITORY git://anongit.kde.org/declarative-plasmoids SUBDIR playground_base_declarative-plasmoids
              )
sb_add_project(kio-upnp-ms GIT_REPOSITORY git://anongit.kde.org/kio-upnp-ms SUBDIR playground_base_kio-upnp-ms
              )
sb_add_project(libmm-qt GIT_REPOSITORY git://anongit.kde.org/libmm-qt SUBDIR playground_base_libmm-qt
              )
sb_add_project(libnm-qt GIT_REPOSITORY git://anongit.kde.org/libnm-qt SUBDIR playground_base_libnm-qt
              )
sb_add_project(nepomuk-system-tray GIT_REPOSITORY git://anongit.kde.org/nepomuk-system-tray SUBDIR playground_base_nepomuk-system-tray
              )
sb_add_project(nepomuk-tools GIT_REPOSITORY git://anongit.kde.org/nepomuk-tools SUBDIR playground_base_nepomuk-tools
              )
sb_add_project(nepomuk-web-extractor GIT_REPOSITORY git://anongit.kde.org/nepomuk-web-extractor SUBDIR playground_base_nepomuk-web-extractor
              )
sb_add_project(nepomukannotation GIT_REPOSITORY git://anongit.kde.org/nepomukannotation SUBDIR playground_base_nepomukannotation
              )
sb_add_project(notably GIT_REPOSITORY git://anongit.kde.org/notably SUBDIR playground_base_notably
              )
sb_add_project(plasma-crystal GIT_REPOSITORY git://anongit.kde.org/plasma-crystal SUBDIR playground_base_plasma-crystal
              )
sb_add_project(plasma-lionmail GIT_REPOSITORY git://anongit.kde.org/plasma-lionmail SUBDIR playground_base_plasma-lionmail
              )
sb_add_project(plasma-mobile GIT_REPOSITORY git://anongit.kde.org/plasma-mobile SUBDIR playground_base_plasma-mobile
              )
sb_add_project(plasmate GIT_REPOSITORY git://anongit.kde.org/plasmate SUBDIR playground_base_plasmate
              )
sb_add_project(print-manager GIT_REPOSITORY git://anongit.kde.org/print-manager SUBDIR playground_base_print-manager
              )
sb_add_project(publictransport GIT_REPOSITORY git://anongit.kde.org/publictransport SUBDIR playground_base_publictransport
              )
sb_add_project(scribo GIT_REPOSITORY git://anongit.kde.org/scribo SUBDIR playground_base_scribo
              )
sb_add_project(share-like-connect GIT_REPOSITORY git://anongit.kde.org/share-like-connect SUBDIR playground_base_share-like-connect
              )
sb_add_project(silk GIT_REPOSITORY git://anongit.kde.org/silk SUBDIR playground_base_silk
              )
sb_add_project(startactive GIT_REPOSITORY git://anongit.kde.org/startactive SUBDIR playground_base_startactive
              )
sb_add_project(jsmoke GIT_REPOSITORY git://anongit.kde.org/jsmoke SUBDIR playground_bindings_jsmoke
              )
sb_add_project(kdev-control-flow-graph GIT_REPOSITORY git://anongit.kde.org/kdev-control-flow-graph SUBDIR playground_devtools_plugins_kdev-control-flow-graph
              )
sb_add_project(kdev-java GIT_REPOSITORY git://anongit.kde.org/kdev-java SUBDIR playground_devtools_plugins_kdev-java
              )
sb_add_project(kdev-mercurial GIT_REPOSITORY git://anongit.kde.org/kdev-mercurial SUBDIR playground_devtools_plugins_kdev-mercurial
              )
sb_add_project(kdev-perforce GIT_REPOSITORY git://anongit.kde.org/kdev-perforce SUBDIR playground_devtools_plugins_kdev-perforce
              )
sb_add_project(kdev-python GIT_REPOSITORY git://anongit.kde.org/kdev-python SUBDIR playground_devtools_plugins_kdev-python
              )
sb_add_project(kdev-qmake GIT_REPOSITORY git://anongit.kde.org/kdev-qmake SUBDIR playground_devtools_plugins_kdev-qmake
              )
sb_add_project(kdev-ruby GIT_REPOSITORY git://anongit.kde.org/kdev-ruby SUBDIR playground_devtools_plugins_kdev-ruby
              )
sb_add_project(kdev-valgrind GIT_REPOSITORY git://anongit.kde.org/kdev-valgrind SUBDIR playground_devtools_plugins_kdev-valgrind
              )
sb_add_project(kdev-xtest GIT_REPOSITORY git://anongit.kde.org/kdev-xtest SUBDIR playground_devtools_plugins_kdev-xtest
              )
sb_add_project(quanta GIT_REPOSITORY git://anongit.kde.org/quanta SUBDIR playground_devtools_quanta
              )
sb_add_project(svgmod GIT_REPOSITORY git://anongit.kde.org/svgmod SUBDIR playground_devtools_svgmod
              )
sb_add_project(veritas GIT_REPOSITORY git://anongit.kde.org/veritas SUBDIR playground_devtools_veritas
              )
sb_add_project(conquirere GIT_REPOSITORY git://anongit.kde.org/conquirere SUBDIR playground_edu_conquirere
              )
sb_add_project(kard GIT_REPOSITORY git://anongit.kde.org/kard SUBDIR playground_edu_kard
              )
sb_add_project(kartesio GIT_REPOSITORY git://anongit.kde.org/kartesio SUBDIR playground_edu_kartesio
              )
sb_add_project(kmemory GIT_REPOSITORY git://anongit.kde.org/kmemory SUBDIR playground_edu_kmemory
              )
sb_add_project(mula GIT_REPOSITORY git://anongit.kde.org/mula SUBDIR playground_edu_mula
              )
sb_add_project(gluon GIT_REPOSITORY git://anongit.kde.org/gluon SUBDIR playground_games_gluon
              )
sb_add_project(gluon-blocks GIT_REPOSITORY git://anongit.kde.org/gluon-blocks SUBDIR playground_games_gluon-blocks
              )
sb_add_project(kmuddy GIT_REPOSITORY git://anongit.kde.org/kmuddy SUBDIR playground_games_kmuddy
              )
sb_add_project(libtagaro GIT_REPOSITORY git://anongit.kde.org/libtagaro SUBDIR playground_games_libtagaro
              )
sb_add_project(bookmanager GIT_REPOSITORY git://anongit.kde.org/bookmanager SUBDIR playground_graphics_bookmanager
              )
sb_add_project(cirkuit GIT_REPOSITORY git://anongit.kde.org/cirkuit SUBDIR playground_graphics_cirkuit
              )
sb_add_project(kolor-manager GIT_REPOSITORY git://anongit.kde.org/kolor-manager SUBDIR playground_graphics_kolor-manager
              )
sb_add_project(kooka GIT_REPOSITORY git://anongit.kde.org/kooka SUBDIR playground_graphics_kooka
              )
sb_add_project(kolena GIT_REPOSITORY git://anongit.kde.org/kolena SUBDIR playground_libs_kolena
              )
sb_add_project(libbluedevil GIT_REPOSITORY git://anongit.kde.org/libbluedevil SUBDIR playground_libs_libbluedevil
              )
sb_add_project(libechonest GIT_REPOSITORY git://anongit.kde.org/libechonest SUBDIR playground_libs_libechonest
              )
sb_add_project(liblikeback GIT_REPOSITORY git://anongit.kde.org/liblikeback SUBDIR playground_libs_liblikeback
              )
sb_add_project(libqgit2 GIT_REPOSITORY git://anongit.kde.org/libqgit2 SUBDIR playground_libs_libqgit2
              )
sb_add_project(libqsystemd GIT_REPOSITORY git://anongit.kde.org/libqsystemd SUBDIR playground_libs_libqsystemd
              )
sb_add_project(nepomukextras GIT_REPOSITORY git://anongit.kde.org/nepomukextras SUBDIR playground_libs_nepomukextras
              )
sb_add_project(predicate GIT_REPOSITORY git://anongit.kde.org/predicate SUBDIR playground_libs_predicate
              )
sb_add_project(qtjolie GIT_REPOSITORY git://anongit.kde.org/qtjolie SUBDIR playground_libs_qtjolie
              )
sb_add_project(android-qt GIT_REPOSITORY git://anongit.kde.org/android-qt SUBDIR playground_mobile_necessitas_android-qt
              )
sb_add_project(android-qt-creator GIT_REPOSITORY git://anongit.kde.org/android-qt-creator SUBDIR playground_mobile_necessitas_android-qt-creator
              )
sb_add_project(android-qt-mobility GIT_REPOSITORY git://anongit.kde.org/android-qt-mobility SUBDIR playground_mobile_necessitas_android-qt-mobility
              )
sb_add_project(ministro GIT_REPOSITORY git://anongit.kde.org/ministro SUBDIR playground_mobile_necessitas_ministro
              )
sb_add_project(contour GIT_REPOSITORY git://anongit.kde.org/contour SUBDIR playground_mobile_contour
              )
sb_add_project(kubeplayer GIT_REPOSITORY git://anongit.kde.org/kubeplayer SUBDIR playground_multimedia_kubeplayer
              )
sb_add_project(plasma-mediacenter GIT_REPOSITORY git://anongit.kde.org/plasma-mediacenter SUBDIR playground_multimedia_plasma-mediacenter
              )
sb_add_project(qtopenal GIT_REPOSITORY git://anongit.kde.org/qtopenal SUBDIR playground_multimedia_qtopenal
              )
sb_add_project(kopete-protocol-telepathy GIT_REPOSITORY git://anongit.kde.org/kopete-protocol-telepathy SUBDIR playground_network_telepathy_kopete-protocol-telepathy
              )
sb_add_project(kwhiteboard GIT_REPOSITORY git://anongit.kde.org/kwhiteboard SUBDIR playground_network_telepathy_kwhiteboard
              )
sb_add_project(telepathy-accounts-kcm GIT_REPOSITORY git://anongit.kde.org/telepathy-accounts-kcm SUBDIR playground_network_telepathy_telepathy-accounts-kcm
              )
sb_add_project(telepathy-approver GIT_REPOSITORY git://anongit.kde.org/telepathy-approver SUBDIR playground_network_telepathy_telepathy-approver
              )
sb_add_project(telepathy-auth-handler GIT_REPOSITORY git://anongit.kde.org/telepathy-auth-handler SUBDIR playground_network_telepathy_telepathy-auth-handler
              )
sb_add_project(telepathy-call-ui GIT_REPOSITORY git://anongit.kde.org/telepathy-call-ui SUBDIR playground_network_telepathy_telepathy-call-ui
              )
sb_add_project(telepathy-common-internals GIT_REPOSITORY git://anongit.kde.org/telepathy-common-internals SUBDIR playground_network_telepathy_telepathy-common-internals
              )
sb_add_project(telepathy-contact-applet GIT_REPOSITORY git://anongit.kde.org/telepathy-contact-applet SUBDIR playground_network_telepathy_telepathy-contact-applet
              )
sb_add_project(telepathy-contact-list GIT_REPOSITORY git://anongit.kde.org/telepathy-contact-list SUBDIR playground_network_telepathy_telepathy-contact-list
              )
sb_add_project(telepathy-filetransfer-handler GIT_REPOSITORY git://anongit.kde.org/telepathy-filetransfer-handler SUBDIR playground_network_telepathy_telepathy-filetransfer-handler
              )
sb_add_project(telepathy-kde GIT_REPOSITORY git://anongit.kde.org/telepathy-kde SUBDIR playground_network_telepathy_telepathy-kde
              )
sb_add_project(telepathy-kded-module GIT_REPOSITORY git://anongit.kde.org/telepathy-kded-module SUBDIR playground_network_telepathy_telepathy-kded-module
              )
sb_add_project(telepathy-launcher-kded GIT_REPOSITORY git://anongit.kde.org/telepathy-launcher-kded SUBDIR playground_network_telepathy_telepathy-launcher-kded
              )
sb_add_project(telepathy-nepomuk-service GIT_REPOSITORY git://anongit.kde.org/telepathy-nepomuk-service SUBDIR playground_network_telepathy_telepathy-nepomuk-service
              )
sb_add_project(telepathy-presence-applet GIT_REPOSITORY git://anongit.kde.org/telepathy-presence-applet SUBDIR playground_network_telepathy_telepathy-presence-applet
              )
sb_add_project(telepathy-presence-dataengine GIT_REPOSITORY git://anongit.kde.org/telepathy-presence-dataengine SUBDIR playground_network_telepathy_telepathy-presence-dataengine
              )
sb_add_project(telepathy-send-file GIT_REPOSITORY git://anongit.kde.org/telepathy-send-file SUBDIR playground_network_telepathy_telepathy-send-file
              )
sb_add_project(telepathy-test-tool GIT_REPOSITORY git://anongit.kde.org/telepathy-test-tool SUBDIR playground_network_telepathy_telepathy-test-tool
              )
sb_add_project(telepathy-testlib GIT_REPOSITORY git://anongit.kde.org/telepathy-testlib SUBDIR playground_network_telepathy_telepathy-testlib
              )
sb_add_project(telepathy-text-ui GIT_REPOSITORY git://anongit.kde.org/telepathy-text-ui SUBDIR playground_network_telepathy_telepathy-text-ui
              )
sb_add_project(aki GIT_REPOSITORY git://anongit.kde.org/aki SUBDIR playground_network_aki
              )
sb_add_project(kfritz GIT_REPOSITORY git://anongit.kde.org/kfritz SUBDIR playground_network_kfritz
              )
sb_add_project(knipptasch GIT_REPOSITORY git://anongit.kde.org/knipptasch SUBDIR playground_office_knipptasch
              )
sb_add_project(koffice-chartingshape GIT_REPOSITORY git://anongit.kde.org/koffice-chartingshape SUBDIR playground_office_koffice-chartingshape
              )
sb_add_project(koffice-formulashape GIT_REPOSITORY git://anongit.kde.org/koffice-formulashape SUBDIR playground_office_koffice-formulashape
              )
sb_add_project(koffice-googledocs GIT_REPOSITORY git://anongit.kde.org/koffice-googledocs SUBDIR playground_office_koffice-googledocs
              )
sb_add_project(koffice-musicshape GIT_REPOSITORY git://anongit.kde.org/koffice-musicshape SUBDIR playground_office_koffice-musicshape
              )
sb_add_project(koffice-texthighlight GIT_REPOSITORY git://anongit.kde.org/koffice-texthighlight SUBDIR playground_office_koffice-texthighlight
              )
sb_add_project(koffice-videoshape GIT_REPOSITORY git://anongit.kde.org/koffice-videoshape SUBDIR playground_office_koffice-videoshape
              )
sb_add_project(akonadi-facebook GIT_REPOSITORY git://anongit.kde.org/akonadi-facebook SUBDIR playground_pim_akonadi-facebook
              )
sb_add_project(akonadi-google GIT_REPOSITORY git://anongit.kde.org/akonadi-google SUBDIR playground_pim_akonadi-google
              )
sb_add_project(akonadi-sugarcrm GIT_REPOSITORY git://anongit.kde.org/akonadi-sugarcrm SUBDIR playground_pim_akonadi-sugarcrm
              )
sb_add_project(akonadi-vkontakte GIT_REPOSITORY git://anongit.kde.org/akonadi-vkontakte SUBDIR playground_pim_akonadi-vkontakte
              )
sb_add_project(akunambol GIT_REPOSITORY git://anongit.kde.org/akunambol SUBDIR playground_pim_akunambol
              )
sb_add_project(ksmtp GIT_REPOSITORY git://anongit.kde.org/ksmtp SUBDIR playground_pim_ksmtp
              )
sb_add_project(plasmoid-eventlist GIT_REPOSITORY git://anongit.kde.org/plasmoid-eventlist SUBDIR playground_pim_plasmoid-eventlist
              )
sb_add_project(rekollect GIT_REPOSITORY git://anongit.kde.org/rekollect SUBDIR playground_pim_rekollect
              )
sb_add_project(zanshin GIT_REPOSITORY git://anongit.kde.org/zanshin SUBDIR playground_pim_zanshin
              )
sb_add_project(cocoon GIT_REPOSITORY git://anongit.kde.org/cocoon SUBDIR playground_sdk_cocoon
              )
sb_add_project(kde-ruleset GIT_REPOSITORY git://anongit.kde.org/kde-ruleset SUBDIR playground_sdk_kde-ruleset
              )
sb_add_project(releaseme GIT_REPOSITORY git://anongit.kde.org/releaseme SUBDIR playground_sdk_releaseme
              )
sb_add_project(apper GIT_REPOSITORY git://anongit.kde.org/apper SUBDIR playground_sysadmin_apper
              )
sb_add_project(kalternatives GIT_REPOSITORY git://anongit.kde.org/kalternatives SUBDIR playground_sysadmin_kalternatives
              )
sb_add_project(kcm-userconfig GIT_REPOSITORY git://anongit.kde.org/kcm-userconfig SUBDIR playground_sysadmin_kcm-userconfig
              )
sb_add_project(kcmgrub2 GIT_REPOSITORY git://anongit.kde.org/kcmgrub2 SUBDIR playground_sysadmin_kcmgrub2
              )
sb_add_project(kdisksutilities GIT_REPOSITORY git://anongit.kde.org/kdisksutilities SUBDIR playground_sysadmin_kdisksutilities
              )
sb_add_project(ginkgo GIT_REPOSITORY git://anongit.kde.org/ginkgo SUBDIR playground_utils_ginkgo
              )
sb_add_project(kimtoy GIT_REPOSITORY git://anongit.kde.org/kimtoy SUBDIR playground_utils_kimtoy
              )
sb_add_project(kontaminuti GIT_REPOSITORY git://anongit.kde.org/kontaminuti SUBDIR playground_utils_kontaminuti
              )
sb_add_project(kpaste GIT_REPOSITORY git://anongit.kde.org/kpaste SUBDIR playground_utils_kpaste
              )
sb_add_project(ksaolaji GIT_REPOSITORY git://anongit.kde.org/ksaolaji SUBDIR playground_utils_ksaolaji
              )
sb_add_project(notificationsurvey GIT_REPOSITORY git://anongit.kde.org/notificationsurvey SUBDIR playground_utils_notificationsurvey
              )
sb_add_project(owncloud GIT_REPOSITORY git://anongit.kde.org/owncloud SUBDIR playground_www_owncloud
              )
sb_add_project(stibium GIT_REPOSITORY git://anongit.kde.org/stibium SUBDIR playground_www_stibium
              )
sb_add_project(synchrotron GIT_REPOSITORY git://anongit.kde.org/synchrotron SUBDIR playground_www_synchrotron
              )
sb_add_project(synchrotron-sources GIT_REPOSITORY git://anongit.kde.org/synchrotron-sources SUBDIR playground_www_synchrotron-sources
              )


set(CPACK_PACKAGE_VERSION ${SB_PACKAGE_VERSION_NUMBER} )
set(CPACK_PACKAGE_NAME ${PROJECT_NAME} )
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)

include(CPack)
