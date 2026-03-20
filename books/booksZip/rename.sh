#!/bin/bash

unzip "*.zip"
rm *.zip

for f in *.txt; do
    # Extract title, remove "Title: ", sanitize characters, swap spaces for underscores, AND lowercase everything
    base_name=$(grep -m 1 "^Title: " "$f" | sed 's/^Title: //; s/\r//; s/[^a-zA-Z0-9 ]//g; s/ //g' | tr '[:upper:]' '[:lower:]' | xargs)
    
    if [ -n "$base_name" ]; then
        new_name="$base_name"
        counter=1
        
        # Check for duplicates
        while [ -e "$new_name.txt" ] && [ "$new_name.txt" != "$f" ]; do
            new_name="${base_name}_$counter"
            ((counter++))
        done
        
        # Only rename if the name actually changed
        if [ "$f" != "$new_name.txt" ]; then
            mv "$f" "$new_name.txt"
        fi
    fi
done

mv *.txt /home/njord/workspace/bootdev/python_bookbot/books