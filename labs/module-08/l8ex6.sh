#!/bin/bash

# Check if a filename was passed as a positional parameter
if [ -z "$1" ]; then
    echo "Error: No filename provided."
    exit 1
fi

# Assign the positional parameter to a variable
FILE="$1"

# Check if the file has executable permission
if [ -x "$FILE" ]; then
    echo "The file '$FILE' is executable."
else
    echo "Error: The file '$FILE' is not executable."
fi

