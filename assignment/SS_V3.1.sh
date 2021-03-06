#!/bin/bash
# get image in range


# Make Range_images direcotry
n=0
while true; do 
    V=Range_images_$n

    if [ -d $V ]; then
        let "n=n+1"
    else
        mkdir $V
        break    
    fi

done


# Path
rtdir=~/Documents/csp2101/assignment/Range_images_$n

min=2007
max=2031

# Down load in range

while IFS="\n" read -r line
do 

    num="${line:68:4}"

    thumbname="${line:64:8}"

    

    if [ $num -ge $min ] && [ $num -le $max ]; then

        # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
        # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
        bytefilesize=$(curl -sI $line | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

        #convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
        kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

        wget -q $line -P $rtdir
        echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
        echo "Complete"
        
        

    
    fi

    
done < "thunmbalilinks.txt"

echo "Saved into "$V 