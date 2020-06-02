#!/bin/sh

echo "Monitored directory:" $1
echo "Depth:" $2
echo " "
#if [ -d "$1" ]; then #checks if the parameter is a directory
#   echo "Number of directories: $(find "$1" -type d | wc -l)"
#  echo "Number of files: $(find "$1" -type f | wc -l)"


#else
#   echo

#fi

shopt -s globstar
FILENO=0
DIRNO=0

while read file; do
    #echo  "${file}"
    #echo "${found}"
    if [ -d "${file}" ]; then
        DIRNO=$(( $DIRNO + 1 ))
	#echo "${DIRNO}"

    else
        FILENO=$(( $FILENO + 1 ))
        stat -c "%a" "${file}"
        # du -h ${file}
    fi
    # du -h ${file}


done <<<$(find $1 -maxdepth $2 -name "*")

echo "Number of directories: ${DIRNO}"
echo "Number of files: ${FILENO}"
echo "Total size on disk: $(du $1 -d 0 -h | cut -f1)"
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

bash tree2.sh $1 $(( $2 - 1 ))