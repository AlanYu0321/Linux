#!/usr/bin/bash

# part 1
# `cd` to your Documents directory, use the `mkdir` command to create a directory named: class-notes
cd ~/Documents
mkdir class-notes
# Create the a directory named `distros` in the `class-notes` directory.
cd ./class-notes
mkdir distros
# Under the `distros` directory create a directory named: `BSD`
cd ./distros
mkdir BSD Debian redhat
# In the directory `BSD` use the command to create a file: Create three files names: oracle-linux.txt, openbsd.txt, and netbsd.txt
cd ./BSD
touch oracle-linux.txt openbsd.txt netbsd.txt
# In the directory `Debian` use the command to create a file: Create three three names: ubuntu.txt, freebsd.txt, and xubuntu.txt
cd ../Debian
touch ubuntu.txt freebsd.txt xubuntu.txt
# In the directory `redhat` use the command to create a file: Create three files names: fedora.txt, rhel.txt, and debian.txt
cd ../redhat
touch fedora.txt rhel.txt debian.txt
# `cd` to the `distro` directory and create a file named: `omnios.txt`
cd ../ && touch omnions.txt
# move the text files to the correct locations
cd ./redhat
mv debian.txt ../Debian
cd ../Debian
mv freebsd.txt ../BSD
# Use the mv command to rename the redhat directory to have an uppercase "R"
cd ../
mv redhat Redhat
# Use the rm command to delete the oracle-linux.txt file
cd ./BSD && rm oracle-linux.txt
# Use the mkdir command to create a directory in the distros directory named: illumos and move the omnios.txt file into the illumos directory
cd ~/Documents/class-notes/distros
mkdir illumos
mv omnions.txt illumos

