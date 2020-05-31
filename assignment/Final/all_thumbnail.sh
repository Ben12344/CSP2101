#!/bin/bash

# Ben Tirabosco
# ID 10393081

# This function is download all the thumbnails available 

all_thumbnail() {

    # Find All_images dirtory 
    if [ -d All_images ] ; then

        # Remove All_images dirtory 
        rm -r All_images

    fi

    # Make All_images direcotry
    mkdir All_images

    # path that current user is running and construct path (rtdir)
    path=`pwd -P`
    rtdir=$path"/All_images"

    #Loop to download all images 
    while IFS="\n" read -r line
    do 
        # obtain the number using the substring (for exaple DSC02222 --> is obtains varible to 2222)
        num="${line:68:4}"

         # Substring to get the thumbnail link nanme (DCS02043)  
        thumbname="${line:64:8}"

        # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
        # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
        bytefilesize=$(curl -sI $line | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

        #convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
        kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

        # Download the thumbnail and store directory into ALL_images 
        wget -q $line -P $rtdir

        # Print details to user
        echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"

        echo "Complete"
            
    done < "thunmbalilinks.txt"

     # print to user where the all images is saved
    echo "Saved to: $rtdir "


}