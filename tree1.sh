#!/bin/bash

echo "Monitored directory:" $1
echo "Depth:" $2
echo " "

tabs 12

shopt -s globstar
FILENO=0
DIRNO=0
MY_ARRAY=()

while read file; do
    #echo  "${file}"
    #echo "${found}"
    if [ -d "${file}" ]; then
        DIRNO=$(( $DIRNO + 1 ))
	#echo "${DIRNO}"

    else
        FILENO=$(( $FILENO + 1 ))
        index=$(stat -c "%a " "${file}")
        MY_ARRAY[${index}]=$(( MY_ARRAY[${index}] + 1 ))
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


# echo "Large files $(find $1 -type f -printf '%s %p\n' | sort -nr | head -5)"
# echo " "



#bash tree2.sh $1 $(( $2 - 1 ))

for i in "${!MY_ARRAY[@]}"; do
    percentage=$(( ${MY_ARRAY[$i]} * 100 / ${FILENO} ))
    if [ ${percentage} -eq 0 ]; then
        percentage=1
    fi
    # printf "%s\t%s\n" "$i" "$(( ${MY_ARRAY[$i]} * 100 / ${FILENO} ))%"
    printf "%s\t%s\n" "$i" "${percentage}%"

    # printf "%s\t%s\n" "$i" "${MY_ARRAY[$i]}"
done

echo " "
echo "Large files"
echo "$(find $1 -maxdepth $2 -type f -printf '%s\t%P\n' | sort -nr | head -5)"
echo " "

tabs 8

echo "Lastly created files"
echo "$( find $1 -maxdepth $2 -type f -printf "%TY-%Tm-%Td %TH:%TM:%TS\t%P\n" | sort -r | head -n 5)"
echo " "


echo "Lastly modified files"
echo "$(find $1 -maxdepth $2 -type f -not -path '*/\.*' -printf '%TY.%Tm.%Td %THh%TM %Ta %P\n' |sort -nr |head -n 5)"
echo " "


echo "Dirs with more files"
echo " "


echo "Dirs with more files"
echo " "


echo "Largest dirs"

