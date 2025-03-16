#!/bin/bash

# Check if roster.txt exists
if [ ! -f roster.txt ]; then
    echo "Error: roster.txt file does not exist."
    exit 1
fi

# Read the content of roster.txt into an array
mapfile -t ROSTERARRAY < roster.txt

# Check if there are at least 2 elements in the array
if [ "${#ROSTERARRAY[@]}" -lt 2 ]; then
    echo "Error: roster.txt does not contain at least two entries."
    exit 1
fi

# Echo the second element of the array
echo "The second element in the array is: ${ROSTERARRAY[1]}"

