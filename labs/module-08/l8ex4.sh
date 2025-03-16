#!/bin/bash

# Check if roster.txt exists
if [ ! -f roster.txt ]; then
    echo "Error: roster.txt file does not exist."
    exit 1
fi

# Read the content of roster.txt into an array
mapfile -t ROSTERARRAY < roster.txt

# For each name in the array, check if the directory exists, or create it
for name in "${ROSTERARRAY[@]}"; do
    # Define the path for the directory
    DIR_PATH="$HOME/$name"
    
    # Check if the directory exists
    if [ -d "$DIR_PATH" ]; then
        echo "Directory $DIR_PATH exists."
    else
        # Create the directory since it does not exist
        mkdir -p "$DIR_PATH"
        echo "Created new directory: $DIR_PATH"
    fi
done

# List the contents of the home directory to show success
echo "Contents of the home directory:"
ls "$HOME"

