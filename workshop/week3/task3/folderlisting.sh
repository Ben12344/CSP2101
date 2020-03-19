#!/bin/bash

rtdir=~/Documents/csp2101/

while true; do

echo "AVAILABLE DIRECTORIES in  $rtdir: "
ls $rtdir

read -p 'Select a directory from the list above: ' seldir
# echo $seldir

if [ -d "${rtdir}${seldir}" ]; then  #~/Documents/
    
    #echo "The selected directory exists."
    echo "Your have requested to see the contents of the $seldir"

    if [ "$(ls -A ${rtdir}${seldir})" ]; then
        #what to do if true
        #echo "Yes, there are files in there"
        ls ${rtdir}${seldir}

    else 
        #what to do if false
        echo "The $seldir directory is empty"
        
    fi
    break



else
   
    echo "The directory does not exist."

fi

done