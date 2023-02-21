#!/bin/bash

# Check if the script is called with a file argument
if [ $# -eq 0 ]; then	
    echo "Enter path to file when executing! Example: $0 <path/to/file>"
    exit 1
fi

# Get the file path from the command line argument
file="$1"

# Use wc to count characters, words, and lines in the file
char_count=$(wc -m < "$file")
word_count=$(wc -w < "$file")
line_count=$(wc -l < "$file")

filename=$(basename "$file")

echo "The file $filename contains ${char_count} characters, ${word_count} words and ${line_count} lines"
