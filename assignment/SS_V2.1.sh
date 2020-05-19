#!/bin/bash

# Downloading all images

# Find All_images dirtory 

if [ -f All_images ] ; then

    # Remove All_images dirtory 
    rm -r All_images

fi


# Make All_images direcotry
mkdir All_images

# Route to current path
rtdir=~/Documents/csp2101/assignment/All_images

#Loop to download all images 

while IFS= read -r line
do 

    wget $line -P $rtdir

done < "thunmbalilinks.txt"