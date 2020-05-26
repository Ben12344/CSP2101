#!/bin/bash

# Get how many lines in html file
n=0
while true; do 
    V=Random_images_$n

    if [ -d $V ]; then
        let "n=n+1"
    else
        mkdir $V
        break    
    fi

done

path=`pwd -P`
rtdir=$path"/Random_images_"$n

linenum=0
while IFS="\n" read -r line
do 
    let "linenum=linenum+1"

done < "thunmbalilinks.txt"



while true; do 
    read -p "Enter an integer for the number of images to download: " input

    if [[ "$input" =~ ^[0-9]+$ ]]; then
        break
    else 
        echo "Invaild input"
    fi
done 

## For loop or ammount of images
for ((i=0; i<($input); i++)) do 

    #Get randomline number
    randomline=$((( RANDOM % $linenum ) + 1 ))

    # String for awk
    linexx=NR==$randomline

    # Link to download
    linetodwd=`awk $linexx thunmbalilinks.txt`

    thumbname="${linetodwd:64:8}"

    # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
    # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
    bytefilesize=$(curl -sI $linetodwd | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

    #convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
    kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

    wget -q $linetodwd -P $rtdir
    echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
    echo "Complete"

done

echo "Saved into "$rtdir 