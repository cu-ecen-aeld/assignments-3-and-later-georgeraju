#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required - <writefile> <writestr>"
    exit 1
fi

# Assign arguments to variables
writefile="$1"
writestr="$2"

# Extract the directory path from the writefile
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
mkdir -p "$dirpath"

# Attempt to write the string to the file
echo "$writestr" > "$writefile"

# Check if the file was successfully created and written to
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to the file $writefile"
    exit 1
fi

echo "Successfully wrote to $writefile"
exit 0