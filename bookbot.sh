#!/bin/bash

echo
echo "Welcome to Bookbot!"

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) echo ; return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function find_book() {
    local dir="$(dirname "$0")/books"

    while true; do
        bookName="${bookName// /}"
        exact_file=$(find "$dir" -maxdepth 1 -type f -iname "$bookName.txt" | head -n 1)

        if [ -n "$exact_file" ]; then
            # Get the actual basename without .txt for the python command
            actual_name=$(basename "$exact_file" .txt)
            python3 /home/njord/workspace/bootdev/python_bookbot/main.py "$actual_name" "$1"
            break
        else
            echo
            echo "'$bookName' was not found.  Here are some potential matches:"
            matches=$(find "$dir" -maxdepth 1 -type f -iname "*$bookName*.txt" | head -n 5 | xargs -I {} basename {} .txt)
            
            if [ -z "$matches" ]; then
                echo
                echo "No books containing '$bookName' were found."
            else
                echo "$matches"
            fi

            echo
            if yes_or_no "Try a diffrent title?"; then
                echo
                echo "Please re-enter a Book Name."
                read bookName
            else
                polite_exit
                break
            fi
        fi
    done
}

function polite_exit {
    echo "Thank you for using Bookbot!"
    echo "See you next time.  Exiting."
    echo
    exit 1
}

if yes_or_no "Would you like a book report?"; then
    echo
    echo "Enter a Book Name"
    read bookName
    echo
    find_book
else
    polite_exit
fi
