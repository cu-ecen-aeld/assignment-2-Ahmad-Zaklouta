#!/bin/bash

filesdir=$1
searchstr=$2

if [ $# -ne 2 ] || [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Usage: $0 <directory> <search string>"
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Directory $filesdir does not exist"
    exit 1
fi

# Count the number of files in the directory and all subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines in the files
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"

# Search for the string in all files in the directory
#find "$filesdir" -type f -exec grep -H "$searchstr" {} +