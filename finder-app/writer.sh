#!/bin/bash

# Get the file path and content from the arguments
writefile="$1"
writestr="$2"

# Check if arguments are provided
if [ $# -ne 2 ] || [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Usage: $0 <writefile> <string_to_write>"
    exit 1
fi

# Create the directory if it doesn't exist
mkdir -p $(dirname "$writefile")

# Write the content to the file
echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
    echo "Failed to write to file: $writefile"
    exit 1
fi