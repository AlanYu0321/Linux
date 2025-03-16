#!/bin/bash


if [ "$#" -ne 3 ]; then
	echo "Usage: $0 name1 name2 name3"
	exit 1
fi

# Apeend each name to roster.txt
echo "$1" >> roster.txt
echo "$2" >> roster.txt
echo "$3" >> roster.txt

echo "Names have been added to roster.txt"
exit 0
