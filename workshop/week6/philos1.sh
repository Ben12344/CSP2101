#!/bin/bash


counter=0

read -p 'Enter search term ' searchterm

while read line; do

    if [[ $line =~ $searchterm ]] ; then
    
        (( counter++ ))

        if [ $counter -eq 1 ] ; then
            echo "$counter) $line" > temp.txt
        else
            echo "$counter) $line" >> temp.txt
        fi
    fi

done < philosophy.txt

if [[ $counter -ge 1  ]] ; then

    grep --color=always -e "^" -e "$searchterm" temp.txt

else
    echo "No match found"
fi

exit 0