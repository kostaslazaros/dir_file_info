#!/bin/bash

FILENO=0
DIRNO=0


if [ "$#" -eq 0 ]; then
    startdir="$HOME"
    depth=1000000

elif [ "$#" -eq 1 ]; then
    startdir="$1"
    depth=1000000

else
    startdir="$1"
    depth="$2"
fi

# echo "The start depth is" ${depth}
for f in ${startdir}/*
do

    if [ -d "${f}" ]; then
        echo "Directory ${f}"
        if [ ${depth} -gt 0 ]; then
            depth=$(( $depth - 1 ))
            # echo ${depth}
            bash "$0" "$f" "$depth" 1
            depth=$(( $depth + 1 ))
        fi
    else
       echo "File ${f}"
    fi
done
