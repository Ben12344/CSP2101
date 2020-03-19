#!/bin/bash

rtdir=~/Documents/csp2101/


#Select a file

while true; do

echo "AVAILABLE DIRECTORIES in  $rtdir: "
ls $rtdir

read -p 'Select a directory from the list above: ' seldir
# echo $seldir

    if ! [ -d "${rtdir}${seldir}" ]; then  #~/Documents/
        
        #echo "The selected directory exists."
        echo "That direcotry does not exist. Please try agian."

    else
    
        echo "You have selected the $seldir directory."
        break

    fi

done

# Request a new password from a user

while true; do

    read -s -p  'Enter a new password for future use: ' selpw

        if ! [ -z "$selpw" ]; then
            #what to do if true
            echo "Thank you. Password accepted."
            break
        else 
            #what to do if true
            echo "No password provide - please try again!"
        fi


done

# Write password to text file nominated in directory

if ! [ -f "${rtdir}${seldir}/secret.txt" ]; then
    # What to do if true
    echo "The file secret.txt does not yet exist. Creating now"
    touch ${rtdir}${seldir}/secret.txt
    echo "Password now being written to file"
    echo "$selpw" > "${rtdir}${seldir}/secret.txt"
    echo "Password has been written to ${rtdir}${seldir}/secret.txt"
    cat "${rtdir}${seldir}/secret.txt"
else
    # What to do if false
    echo "The file secret.txt already exists. Password being to it now"
    echo "$selpw" >> "${rtdir}${seldir}/secret.txt"
    echo "Password has been written to ${rtdir}${seldir}/secret.txt"
    cat "${rtdir}${seldir}/secret.txt"
fi 

exit 0