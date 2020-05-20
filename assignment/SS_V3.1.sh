#!/bin/bash
# get image in range


# Make Range_images direcotry
## mkdir Range_images

# Path
rtdir=~/Documents/csp2101/assignment/Range_images

min=2007
max=2031

# Down load in range

while IFS="\n" read -r line
do 

    num="${line:68:4}"

    thumbname="${line:64:8}"

    

    if [ $num -ge $min ] && [ $num -le $max ]; then

        #filesize=$(curl -sI $line | awk '/content-length:/{printf $2}')

        # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
        # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
        bytefilesize=$(curl -sI $line | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

        #convert to 

        # kbfilesize=$((bytefilesize/1024))

        kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

        wget -q $line -P $rtdir ## | 
        echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
        echo "Complete"
        
        

    
    fi

    
done < "thunmbalilinks.txt"