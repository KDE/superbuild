
add_custom_target(UpdateAll)
#add_custom_target(PackageAll)


include(ExternalProject)
include(CMakeParseArguments)

set(SB_GIT_TAG "master" CACHE STRING "The git tag to use for cloning.")

set(SB_PACKAGE_VERSION_NUMBER "0.0.1" CACHE STRING "The version number for the source package.")



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

if(SB_INITIAL_DESTDIR AND NOT CMAKE_SKIP_RPATH)
  message(FATAL_ERROR "The DESTDIR environment variable is set to \"${SB_INITIAL_DESTDIR}\", but CMAKE_SKIP_RPATH is not set to TRUE. This would produce binaries with bad RPATHs. ")
endif()


set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
             PROPERTY EP_BASE ${CMAKE_CURRENT_BINARY_DIR}
            )


macro(sb_add_project _name )

  if(EXISTS ${CMAKE_SOURCE_DIR}/ThisIsASourcePackage.valid ) # we are building an installed version of the source package
    set(buildFromSourcePackage TRUE)
  else()
    set(buildFromSourcePackage FALSE)
  endif()

  if(EXISTS ${CMAKE_SOURCE_DIR}/${_name}  OR NOT buildFromSourcePackage)
    option(BUILD_${_name} "Build subproject ${_name}" TRUE)
  endif()

  if (BUILD_${_name})
    message(STATUS "Adding project ${_name}")

    set(oneValueArgs CVS_REPOSITORY GIT_REPOSITORY SVN_REPOSITORY SOURCE_DIR )
    set(multiValueArgs DEPENDS)
    cmake_parse_arguments(_SB "" "${oneValueArgs}" "${multiValueArgs}"  ${ARGN})

    if(buildFromSourcePackage) # we are building an installed version of the source package
      set(GET_SOURCES_ARGS SOURCE_DIR ${CMAKE_SOURCE_DIR}/${_name}
                           DOWNLOAD_COMMAND "")
    else()
      set(GET_SOURCES_ARGS ) #DOWNLOAD_DIR ${CMAKE_BINARY_DIR}/src/${_name}/ )

      if(_SB_CVS_REPOSITORY)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} CVS_REPOSITORY ${_SB_CVS_REPOSITORY} )
      elseif(_SB_GIT_REPOSITORY)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} GIT_REPOSITORY ${_SB_GIT_REPOSITORY} GIT_TAG ${SB_GIT_TAG} )
      elseif(_SB_SVN_REPOSITORY)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SVN_REPOSITORY ${_SB_SVN_REPOSITORY} )
      elseif(_SB_SOURCE_DIR)
        set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SOURCE_DIR ${_SB_SOURCE_DIR} )
      endif()
    endif()


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
                        TMP_DIR ${CMAKE_BINARY_DIR}/CMakeFiles/SuperBuild/tmpfiles/${_name}
                        STAMP_DIR ${CMAKE_BINARY_DIR}/CMakeFiles/SuperBuild/stampfiles/${_name}
#                        BINARY_DIR ${CMAKE_BINARY_DIR}/build/${_name}
                        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#                        INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} -C${CMAKE_BINARY_DIR}/${_name}/build install DESTDIR=${CMAKE_BINARY_DIR}/Install
                        CMAKE_ARGS -DQT_QMAKE_EXECUTABLE=${QT_QMAKE_EXECUTABLE} -DCMAKE_PREFIX_PATH=${SB_INITIAL_DESTDIR}${CMAKE_INSTALL_PREFIX} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_SKIP_RPATH="${CMAKE_SKIP_RPATH}"
                        STEP_TARGETS update
                        ${DEPENDS_ARGS}
                        )
#    externalproject_add_step(${_name}  package
#                             COMMAND  ${CMAKE_MAKE_PROGRAM} package
#                             WORKING_DIRECTORY <BINARY_DIR>
#                             DEPENDEES build)
#
#    externalProject_Add_StepTargets(${_name} package)
    if(buildFromSourcePackage)
      install(DIRECTORY ${CMAKE_SOURCE_DIR}/${_name} DESTINATION Source )
    else()
      install(DIRECTORY ${CMAKE_BINARY_DIR}/Source/${_name} DESTINATION Source )
    endif()

    add_dependencies(UpdateAll ${_name}-update )
#    add_dependencies(PackageAll ${_name}-package )
  else()
    message(STATUS "Skipping ${_name}")
    execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Build/${_name}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Source/${_name}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Download/${_name}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/Stamp/${_name}
                    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/tmp/${_name}
                    OUTPUT_QUIET ERROR_QUIET )
  endif()
endmacro(sb_add_project)


file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/ThisIsASourcePackage "This is a generated source package.")

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/ThisIsASourcePackage DESTINATION Source RENAME ThisIsASourcePackage.valid )
install(FILES CMakeLists.txt DESTINATION Source )
install(FILES ${CMAKE_CURRENT_LIST_FILE} DESTINATION . )

set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY TRUE)
