#!/bin/bash

# Set the directory to iterate over
directory="."

# Iterate over all files in the directory
find "$directory" -maxdepth 1 -type d -print0 | while IFS= read -r -d $'\0' dir; do 
    # process each dir here
    echo "Processing dir: $dir"

    find "$dir" -maxdepth 1 -tyoe f -print0 | while IFS= read -r -d $'\0' file; do
        filename="$file"
        echo "Processing file: $filename"
        sed -i "s/textToMatch/newText/g" "$filename"
    done
done