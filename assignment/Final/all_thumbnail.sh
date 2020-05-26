#!/bin/bash

all_thumbnail() {

    # Find All_images dirtory 

    if [ -d All_images ] ; then

        # Remove All_images dirtory 
        rm -r All_images

    fi

    # Make All_images direcotry
    mkdir All_images

    # Route to current path
    path=`pwd -P`
    rtdir=$path"/All_images"

    #Loop to download all images 

    while IFS="\n" read -r line
    do 
        num="${line:68:4}"
        thumbname="${line:64:8}"

        # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
        # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
        bytefilesize=$(curl -sI $line | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

        #convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
        kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

        wget -q $line -P $rtdir
        echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
        echo "Complete"
            
    done < "thunmbalilinks.txt"
    echo "Saved to: $rtdir "


}