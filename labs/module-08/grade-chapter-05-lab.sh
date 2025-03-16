#!/usr/bin/bash

# Define colors for output
GREEN='\e[0;32m'
RED='\e[0;31m'
NC='\e[0m' # No Color

# Define paths & files
CLASSNOTES=~/Documents/class-notes
DISTROS=~/Documents/class-notes/distros
# BSD files
BSD=~/Documents/class-notes/distros/BSD
NETBSD=~/Documents/class-notes/distros/BSD/netbsd.txt
OPENBSD=~/Documents/class-notes/distros/BSD/openbsd.txt
FREEBSD=~/Documents/class-notes/distros/BSD/freebsd.txt
# Debian files
DEBIAN=~/Documents/class-notes/distros/Debian
DEBIANTXT=~/Documents/class-notes/distros/Debian/debian.txt
UBUNTUTXT=~/Documents/class-notes/distros/Debian/ubuntu.txt
XUBUNTUTXT=~/Documents/class-notes/distros/Debian/xubuntu.txt
# Redhat files
REDHAT=~/Documents/class-notes/distros/Redhat
FEDORATXT=~/Documents/class-notes/distros/Redhat/fedora.txt
RHELTXT=~/Documents/class-notes/distros/Redhat/rhel.txt
# Illumos
ILLUMOS=~/Documents/class-notes/distros/illumos
OMNIONS=~/Documents/class-notes/distros/illumos/omnions.txt
# Define paths
LAB_DIRS_FILES=($CLASSNOTES $DISTROS $BSD $DEBIAN $REDHAT $ILLUMOS $NETBSD $OPENBSD $FREEBSD $DEBIANTXT $UBUNTUTXT $XUBUNTUTXT $FEDORATXT $RHELTXT $OMNIONS) 

# Function to check directory/file and print status
echo "Checking item... "

# Initialize score
score=0
total_points=15  # Total number of items to check

check_item() {
    for item in "${LAB_DIRS_FILES[@]}"; do
        if [ -d "$item" ]; then
             echo -e "${GREEN}$item FOUND${NC}"
                ((score++))
        elif [ -f "$item" ]; then
             echo -e "${GREEN}$item FOUND${NC}"
                ((score++))
        else
             echo -e "${RED}$item NOT FOUND${NC}"
        fi
    done
}

echo "Starting Chapter 05 Lab Grading Script..."
check_item

echo "Grading Summary:"
echo "Items found: $score/$total_points"

# Calculate percentage
percentage=$((score * 100 / total_points))
echo "Final Score: $percentage%"

if [ $percentage -eq 100 ]; then
    echo -e "${GREEN}All items present. Great job!${NC}"
elif [ $percentage -gt 0 ]; then
    echo -e "${RED}Some items are missing. Please check the results above.${NC}"
else
    echo -e "${RED}No required items found. Please review the lab requirements.${NC}"
fi

exit 0
