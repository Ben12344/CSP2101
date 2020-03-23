#!/bin/bash

rtdir=~/Documents/csp2101

read -p 'Enter the name or part name of the file your looking for: ' reqfile

cd $rtdir
find -mindepth 1 -maxdepth 1 -type d | while read -r dir 
do 
cd "$dir"
    if [[ $(find -name $reqfile\*) ]]; then 
        i=$(find -name $reqfile\*)
        echo -n "${dir//.}"
        echo -n "${i#?}"
        echo " contains "
        cat $i
    fi

cd $rtdir
done 

