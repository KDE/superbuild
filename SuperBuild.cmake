
add_custom_target(UpdateAll)
add_custom_target(PackageAll)


include(ExternalProject)
include(CMakeParseArguments)

macro(sb_add_project _name )
  option(BUILD_${_name} "Build subproject ${_name}" TRUE)

  set(oneValueArgs CVS_REPOSITORY GIT_REPOSITORY SVN_REPOSITORY SOURCE_DIR )
  set(multiValueArgs DEPENDS)
  cmake_parse_arguments(_SB "" "${oneValueArgs}" "${multiValueArgs}"  ${ARGN})

  if(EXISTS ${CMAKE_SOURCE_DIR}/${_name}/src/ ) # we are building an installed version of the source package
    set(GET_SOURCES_ARGS SOURCE_DIR ${CMAKE_SOURCE_DIR}/${_name}/src/${_name}
                         DOWNLOAD_COMMAND "")
  else()
    set(GET_SOURCES_ARGS DOWNLOAD_DIR ${CMAKE_BINARY_DIR}/src/${_name}/ )

    if(_SB_CVS_REPOSITORY)
      set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} CVS_REPOSITORY ${_SB_CVS_REPOSITORY} )
    elseif(_SB_GIT_REPOSITORY)
      set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} GIT_REPOSITORY ${_SB_GIT_REPOSITORY} SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${_name})
    elseif(_SB_SVN_REPOSITORY)
      set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SVN_REPOSITORY ${_SB_SVN_REPOSITORY} )
    elseif(_SB_SOURCE_DIR)
      set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SOURCE_DIR ${_SB_SOURCE_DIR} )
    endif()
#    set(GET_SOURCES_ARGS ${GET_SOURCES_ARGS} SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${_name} )
  endif()

  if (BUILD_${_name})
    message(STATUS "Adding project ${_name}")

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
#                        PREFIX ${_name}
                        ${GET_SOURCES_ARGS}
                        TMP_DIR ${CMAKE_BINARY_DIR}/tmpfiles/${_name}
                        STAMP_DIR ${CMAKE_BINARY_DIR}/stampfiles/${_name}
                        BINARY_DIR ${CMAKE_BINARY_DIR}/build/${_name}
                        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#                        INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} -C${CMAKE_BINARY_DIR}/${_name}/build install DESTDIR=${CMAKE_BINARY_DIR}/Install
                        CMAKE_ARGS -DQT_QMAKE_EXECUTABLE=${QT_QMAKE_EXECUTABLE} -DCMAKE_PREFIX_PATH=${CMAKE_INSTALL_PREFIX} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                        STEP_TARGETS update
                        ${DEPENDS_ARGS}
                        )
#    externalproject_add_step(${_name}  package
#                             COMMAND  ${CMAKE_MAKE_PROGRAM} package
#                             WORKING_DIRECTORY <BINARY_DIR>
#                             DEPENDEES build)
#
#    externalProject_Add_StepTargets(${_name} package)
    install(DIRECTORY ${CMAKE_BINARY_DIR}/${_name}/src/ DESTINATION src/${_name}/src/ )

    add_dependencies(UpdateAll ${_name}-update )
#    add_dependencies(PackageAll ${_name}-package )
  else()
    message(STATUS "Skipping ${_name}")
  endif()
endmacro(sb_add_project)

install(FILES CMakeLists.txt DESTINATION src )

set(CMAKE_SKIP_INSTALL_ALL_DEPENDENCY TRUE)
