#!/usr/bin/bash


# Define the chapter05 path
CHAPTER05_CONTENT=~/Documents/class-notes

# Check if dir exist 
# [ -f ~/date-time-script.sh ]
if [ -d "$CHAPTER05_CONTENT" ] ; then
	# Delete all the output
	rm -r "$CHAPTER05_CONTENT"
	echo "Remove Chapter05 content."
else
	echo "Chapter05 content doesn't exist."
fi
