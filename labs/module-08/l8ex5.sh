#!/bin/bash

# Define paths
INPUT_FILE=~/Documents/Linux-text-book-part-1/files/Chapter-08/lab/names.txt
DUPLICATE_FILE=/tmp/duplicates.txt

# Clear previous duplicates.txt file, if it exists
> "$DUPLICATE_FILE"

# Create Dir and xfile.txt
if [ ! -f ~/topsecret/xfile.txt ] && [ ! -d ~/topsecret ];then
    echo "Create Directory ~/topsecret and File xfile.txt"
    mkdir ~/topsecret
    touch ~/topsecret/xfile.txt
    exit 1
fi
# Check if names.txt exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: $INPUT_FILE file does not exist."
    exit 1
fi

# Read names.txt line by line
while IFS= read -r name; do
    # Define the directory path
    DIR_PATH="/tmp/$name"
    
    # Check if the directory already exists
    if [ -d "$DIR_PATH" ]; then
        echo "$name" >> "$DUPLICATE_FILE"
        echo "Directory $DIR_PATH already exists; logged to duplicates.txt."
    else
        # Create the directory since it does not exist
        mkdir -p "$DIR_PATH"
        echo "Created directory: $DIR_PATH"
    fi
done < "$INPUT_FILE"

echo "Script completed. Check $DUPLICATE_FILE for duplicate entries."

