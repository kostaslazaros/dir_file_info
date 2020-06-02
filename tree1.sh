#!/bin/sh

echo "Monitored directory:" $1
echo "Depth:" $2
echo " "
if [ -d "$1" ]; then #checks if the parameter is a directory
    echo "Number of directories: $(find "$1" -type d | wc -l)"
    echo "Number of files: $(find "$1" -type f | wc -l)"
    
    
else
    echo    
    
fi

echo "Total size on disk:" 23
echo " "


echo "Permissions on files"
echo " "


echo "Large files"
echo " "


echo "Lastly created files"
echo " "


echo "Lastly modified files"
echo " "


echo "Dirs with more files"
echo " "


echo "Dirs with more files"
echo " "


echo "Largest dirs"
echo " "
