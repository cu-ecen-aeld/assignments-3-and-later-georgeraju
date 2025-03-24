#!/bin/sh
# Tester script for assignment 1 - Finder app
# Author: George Raju, with ref from LLM


# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Argument Error: Two arguments required - <directory path> <search string>"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

# Check if the first argument is a valid directory
if [ ! -d "$FILESDIR" ]; then
    echo "Error: '$FILESDIR' is not a valid directory"
    exit 1
fi

# Count the number of files in the directory and subdirectories
file_count=$(find "$FILESDIR" -type f | wc -l)

# Count the number of matching lines containing the search string
matching_lines_count=$(grep -r "$SEARCHSTR" "$FILESDIR" 2>/dev/null | wc -l)

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines_count"