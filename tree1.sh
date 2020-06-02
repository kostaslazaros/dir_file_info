#!/bin/sh

if [ -d "$@" ]; then #checks if the parameter is a directory
    echo "Number of files is $(find "$@" -type f | wc -l)"
    echo "Number of directories is $(find "$@" -type d | wc -l)"
    
else
    echo "[ERROR]  Please provide a directory." #if not a directory, print error message
    exit 1
fi
