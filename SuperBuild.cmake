# This part is for checking at buildtime whether DESTDIR still is the same.
# It is executed by cmake in script mode via the AlwaysCheckDESTDIR custom target.
if(_SB_CHECK_DESTDIR)
  set(_tmpDest "$ENV{DESTDIR}")
  if(NOT "${SB_INITIAL_DESTDIR}" STREQUAL "${_tmpDest}")
    message(FATAL_ERROR "DESTDIR changed. This is not supported in Superbuilds, DESTDIR must always be the same at CMake and build time. (now: \"${_tmpDest}\", at CMake time: \"${SB_INITIAL_DESTDIR}\")")
  else()
    message("DESTDIR Ok. (now: \"${_tmpDest}\", at CMake time: \"${SB_INITIAL_DESTDIR}\")")
  endif()
  return()
endif()

# This custom target is used to check at buildtime whether DESTDIR is still the same as at CMake time.
add_custom_target(AlwaysCheckDESTDIR COMMAND ${CMAKE_COMMAND} -DSB_INITIAL_DESTDIR="${SB_INITIAL_DESTDIR}" -D_SB_CHECK_DESTDIR=TRUE -P ${CMAKE_CURRENT_LIST_FILE} )


#####################################################################################

# Now the actual CMakeLists.txt starts.

# are we building a source package or should we download from the internet ?
if(EXISTS ${CMAKE_SOURCE_DIR}/ThisIsASourcePackage.valid ) # we are building an installed version of the source package
  set(buildFromSourcePackage TRUE)
else()
  set(buildFromSourcePackage FALSE)
endif()


if (NOT buildFromSourcePackage)
  add_custom_target(UpdateAll)
endif()

#add_custom_target(PackageAll)

include(ExternalProject)
include(CMakeParseArguments)


set(SB_ONE_PACKAGE_PER_PROJECT FALSE CACHE BOOL "If FALSE, \"make package\" will create one big source tarball. If TRUE, \"make package\" will create one tarball for each subproject.")
set(CPACK_ARCHIVE_COMPONENT_INSTALL ${SB_ONE_PACKAGE_PER_PROJECT})

# This is the git tag from which will be cloned. It is in the cache so it can be modified for releases etc.
# It can be overriden for each subproject by providing a SB_GIT_TAG_<ProjectName> variable.
set(SB_GIT_TAG "master" CACHE STRING "The default git tag to use for cloning all subprojects. It can be overridden for each subproject by providing an SB_GIT_TAG_<ProjectName> variable.")

# This is the git url from which will be cloned. It is in the cache so it can be modified for releases etc.
set(SB_GIT_URL "git://anongit.kde.org/" CACHE STRING "The default git url to use for cloning all subprojects.")

set(SB_PACKAGE_VERSION_NUMBER "0.0.1" CACHE STRING "The version number for the source package.")

set(SB_CMAKE_ARGS "" CACHE STRING "Additional arguments to CMake which will be used for all subprojects (e.g. \"-DFOO=Bar\"). For per-project arguments variables SB_CMAKE_ARGS_<ProjectName> can be defined.")

# this file (SuperBuild.cmake) is systematically included from one of the child directories
# where some CMakeLists.txt state include(../SuperBuild.cmake). So the current directory is
# located in a subfolder of this include file. That's why global SuperBuildOptions.cmake should
# be included from ../ (e.g. the parent directory)
#message(STATUS ${CMAKE_CURRENT_SOURCE_DIR})
include(../GlobalSuperBuildOptions.cmake OPTIONAL)

# this file is included from the project directory and allow for local definitions
include(SuperBuildOptions.cmake OPTIONAL)

# Try to handle DESTDIR.
# We install during the build, and if DESTDIR is set, the install will go there.
# Installed libs have to be found in DESTDIR, so prepend it to CMAKE_PREFIX_PATH.
# If RPATH is used, this messes everything up, since the using binary will have the RPATH set to
# the library inside DESTDIR, which is wrong.
# So, only allow DESTDIR if RPATH is completely disabled using CMAKE_SKIP_RPATH.
set(_tmpDest "$ENV{DESTDIR}")

if(NOT DEFINED SB_INITIAL_DESTDIR)
  # initial cmake run, check DESTDIR
  set(SB_INITIAL_DESTDIR ${_tmpDest} CACHE STRING "The DESTDIR environment variable during the initial cmake run" FORCE)
  mark_as_advanced(SB_INITIAL_DESTDIR)
else()
  if(NOT "${SB_INITIAL_DESTDIR}" STREQUAL "${_tmpDest}")
    message(FATAL_ERROR "Your DESTDIR environment variable changed. In a Superbuild, DESTDIR must always stay the same as it was during the initial cmake run. Initially it was \"${SB_INITIAL_DESTDIR}\", now it is \"${_tmpDest}\" .")
  endif()
endif()

if(SB_INITIAL_DESTDIR)
  if( NOT CMAKE_SKIP_RPATH)
    message(FATAL_ERROR "The DESTDIR environment variable is set to \"${SB_INITIAL_DESTDIR}\", but CMAKE_SKIP_RPATH is not set to TRUE. This would produce binaries with bad RPATHs. ")
  endif()

  if(NOT IS_ABSOLUTE "${SB_INITIAL_DESTDIR}")
    message(FATAL_ERROR "The DESTDIR environment variable is set to \"${SB_INITIAL_DESTDIR}\", but relative DESTDIR is not support in a Superbuild. Set it to an absolute path")
  endif()
endif()


# set up directory structure to use for the ExternalProjects
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
             PROPERTY EP_BASE ${CMAKE_CURRENT_BINARY_DIR}
            )


macro(sb_add_project _name )

  set(oneValueArgs CVS_REPOSITORY GIT_REPOSITORY SVN_REPOSITORY SOURCE_DIR SUBDIR)
  set(multiValueArgs DEPENDS)
  cmake_parse_arguments(_SB "" "${oneValueArgs}" "${multiValueArgs}"  ${ARGN})

  set(subdir ${_name} )
  if(_SB_SUBDIR)
    set(subdir ${_SB_SUBDIR} )
  endif()

  if(EXISTS ${CMAKE_SOURCE_DIR}/${subdir}  OR NOT buildFromSourcePackage)
    option(BUILD_${subdir} "Build subproject ${_name}" FALSE)
  endif()

  if (BUILD_${subdir})

    if(buildFromSourcePackage) # we are building an installed version of the source package
      set(GET_SOURCES_ARGS SOURCE_DIR ${CMAKE_SOURCE_DIR}/${subdir}
                           DOWNLOAD_COMMAND "")
    else()
      set(GET_SOURCES_ARGS ) #DOWNLOAD_DIR ${CMAKE_BINARY_DIR}/src/${_name}/ )

      if(_SB_CVS_REPOSITORY)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} CVS_REPOSITORY ${_SB_CVS_REPOSITORY} SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${subdir} )
      elseif(_SB_GIT_REPOSITORY)

        # make it possible to override the "global" SB_GIT_TAG with a per-subproject SB_GIT_TAG_ProjectName
        set(_SB_GIT_TAG ${SB_GIT_TAG} )
        if (SB_GIT_TAG_${_name})
          set(_SB_GIT_TAG ${SB_GIT_TAG_${_name}})
        endif()

        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} GIT_REPOSITORY ${_SB_GIT_REPOSITORY} GIT_TAG ${_SB_GIT_TAG} SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${subdir} )
      elseif(_SB_SVN_REPOSITORY)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SVN_REPOSITORY ${_SB_SVN_REPOSITORY} SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${subdir} )
      elseif(_SB_SOURCE_DIR)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SOURCE_DIR ${_SB_SOURCE_DIR} )
      endif()
    endif()

    message(STATUS "Adding project ${_name} in subdir ${subdir}")

    set(DEPENDS_ARGS)
    if(_SB_DEPENDS)
      set(existingDepends)

      foreach(dep ${_SB_DEPENDS})
        if(TARGET ${dep})
          list(APPEND existingDepends ${dep} )
        else()
          message(STATUS "HINT: ${_name}: Dependency ${dep} is disabled, trying to use system one.")
        endif()
      endforeach(dep)

      if(existingDepends)
        set(DEPENDS_ARGS DEPENDS ${existingDepends} )
      endif()

      set(DEPEND_ARGS DEPENDS ${_SB_DEPENDS} )
    endif()

    externalproject_add(${_name}
                        ${_SB_UNPARSED_ARGUMENTS}
                        ${GET_SOURCES_ARGS}
                        TMP_DIR ${CMAKE_BINARY_DIR}/CMakeFiles/SuperBuild/tmpfiles/${subdir}
                        STAMP_DIR ${CMAKE_BINARY_DIR}/CMakeFiles/SuperBuild/stampfiles/${subdir}
                        BINARY_DIR ${CMAKE_BINARY_DIR}/build/${subdir}
                        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#                        INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} -C${CMAKE_BINARY_DIR}/${_name}/build install DESTDIR=${CMAKE_BINARY_DIR}/Install
                        CMAKE_ARGS --no-warn-unused-cli
                                   -DQT_QMAKE_EXECUTABLE=${QT_QMAKE_EXECUTABLE}
                                   -DCMAKE_PREFIX_PATH=${SB_INITIAL_DESTDIR}${CMAKE_INSTALL_PREFIX}
                                   -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                                   -DCMAKE_SKIP_RPATH="${CMAKE_SKIP_RPATH}"
                                   -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                                   -DLIB_SUFFIX=${LIB_SUFFIX}
                                   ${SB_CMAKE_ARGS}
                                   ${SB_CMAKE_ARGS_${_name}}
                        STEP_TARGETS update configure
                        ${DEPENDS_ARGS}
                        )
#    externalproject_add_step(${_name}  package
#                             COMMAND  ${CMAKE_MAKE_PROGRAM} package
#                             WORKING_DIRECTORY <BINARY_DIR>
#                             DEPENDEES build)
#
#    externalProject_Add_StepTargets(${_name} package)
    if(SB_ONE_PACKAGE_PER_PROJECT)
      set(SRC_INSTALL_DIR ".")
    else()
      set(SRC_INSTALL_DIR "src")
    endif()

    if(buildFromSourcePackage)
      install(DIRECTORY ${CMAKE_SOURCE_DIR}/${subdir}  DESTINATION ${SRC_INSTALL_DIR}  COMPONENT ${_name} )
    else()
      install(DIRECTORY ${CMAKE_BINARY_DIR}/src/${subdir}  DESTINATION ${SRC_INSTALL_DIR}  COMPONENT ${_name}
              PATTERN .git EXCLUDE
              PATTERN .svn EXCLUDE
              PATTERN CVS EXCLUDE
             )
      add_dependencies(UpdateAll ${_name}-update )
    endif()

#    add_dependencies(PackageAll ${_name}-package )
    add_dependencies(${_name} AlwaysCheckDESTDIR)
  else()
    message(STATUS "Skipping ${_name}")
    execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/build/${subdir}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/src/${subdir}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Download/${_name}
#                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Stamp/${_name}
#                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/tmp/${_name}
                    OUTPUT_QUIET ERROR_QUIET )
  endif()
endmacro(sb_add_project)


file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/ThisIsASourcePackage.in "This is a generated source package.")

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/ThisIsASourcePackage.in DESTINATION src RENAME ThisIsASourcePackage.valid  COMPONENT SuperBuild )
install(FILES CMakeLists.txt DESTINATION src  COMPONENT SuperBuild )
install(FILES ${CMAKE_CURRENT_LIST_FILE} DESTINATION .  COMPONENT SuperBuild )

set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY TRUE)
