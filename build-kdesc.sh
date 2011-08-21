#!/bin/sh

# a little script to build all of KDE SC
# TODO: specify a branch to build

if ( test $# -ne 1 )
then
  echo "Usage: `basename $0` <top_level_install_directory>"
  exit 0
fi
install_dir=$1

modules="\
kdesupport \
kdelibs \
kdepimlibs \
kdepim \
kdepim-runtime \
kdebase \
kdeaccessibility \
kdeedu \
kdegraphics \
kdeplasma-addons \
kdeutils \
kdebindings \
"

builddir="build"

# update any changes to the SuperBuild setup for this module
git pull -q

for m in $modules
do
  if ( test ! -d $m )
  then
    echo "No such module \"$m\" available in SuperBuild"
    exit 1
  fi

  echo "== Building $m ========"

  cd $m

  # setup the build dir
  mkdir -p $builddir
  cd $builddir

  # configure
  cmake -DCMAKE_INSTALL_PREFIX=$install_dir ..
  cmakestatus=$?
  if ( test $cmakestatus -ne 0 )
  then
    echo "cmake error detected"
    exit $cmakestatus
  fi

  # make
  make
  makestatus=$?
  if ( test $makestatus -ne 0 )
  then
    echo "make error detected"
    exit $makestatus
  fi

  echo "=== Finished Building $m ======="
  cd ../..

done
echo "= Finished Installing KDE SC ========="


