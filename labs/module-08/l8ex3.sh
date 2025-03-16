#!/bin/bash

# Check if roster.txt exists
if [ ! -f roster.txt ]; then
    echo "Error: roster.txt file does not exist."
    exit 1
fi

# Read the content of roster.txt into an array
mapfile -t ROSTERARRAY < roster.txt

# Create a directory in the home directory for each name in the array
for name in "${ROSTERARRAY[@]}"; do
    # Define the path for the new directory
    DIR_PATH="$HOME/$name"
    
    # Create the directory
    mkdir -p "$DIR_PATH"
    
    # Echo a message with the path of the created directory
    echo "Created directory: $DIR_PATH"
done

# List the contents of the home directory to show success
echo "Contents of the home directory:"
ls "$HOME"
