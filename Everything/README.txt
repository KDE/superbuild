This is a superbuild containing all projects from projects.kde.org.

The kde_projects.xml is downloaded via
$ wget http://projects.kde.org/kde_projects.xml

kde_projects.xml.giturls was created using:
$ grep "git://" kde_projects.xml > kde_projects.xml.giturls

This file is intended to be checked when repositories are added or removed.

Then sb.rb was used to generate the CMakeLists.txt initially, and later on
to update it manually.

Alex
