#!/bin/bash

# Check if a filename was passed as a positional parameter
if [ -z "$1" ]; then
    echo "Error: No filename provided."
    exit 1
fi

# Define the file path in the ~/topsecret directory
FILE_PATH=~/topsecret/"$1"

# Check if the file exists
if [ -e "$FILE_PATH" ]; then
    echo "The file '$FILE_PATH' exists."
else
    echo "Error: The file '$FILE_PATH' does not exist."
fi

