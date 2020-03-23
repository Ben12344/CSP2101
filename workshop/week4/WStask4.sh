#!/bin/bash


if ! [ $# -eq 3 ]; then
   echo "Incorrect number of arguments. Exiting script"
   exit 1
fi

filecnt=0
newestfile=""

for i; do 


    if [[ -f $i ]];then
        ((filecnt++))
        echo "$i is a file"

        if [[ $filecnt < 1 ]];then
            newestfile=$i
        else 

            if [[ $i -nt $newestfile ]]; then
                newestfile=$i
            fi
        fi


    else
        echo "$i is not a file"
    fi 

done

echo "File count is set to $filecnt"
echo "Arguments passed is set to $#"

if [[ (( $filecnt -eq $# )) ]] ; then 

    echo "The newest file is $newestfile"

else

    echo " Insufficent files for comparsion"

fi

exit 