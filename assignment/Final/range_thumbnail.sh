#!/bin/bash

range_thumbnail() {

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
    path=`pwd -P`
    rtdir=$path"/Ranage_images_"$n

    echo "The range DSC0 is between 1533 - 2042"

    while true; do 
        read -p "Enter min DSC0 number greater or eqaul to 1533 and less than 2042: " min
        if [[ "$min" =~ ^[0-9]+$ ]] && [ ${#min} == 4 ] && [ $min -ge 1533 ] && [ $min -lt 2042 ]; then
            break
        else 
            echo "invaild min input"
        fi 
    done 

    while true; do 
        read -p "Enter max DSC0 number less or eqaul to 2042 and greater then min ($min): " max
        if [[ "$max" =~ ^[0-9]+$ ]] && [ ${#max} == 4 ] && [ $max -le 2042 ] && [ $max -gt $min ]; then
            break
        else 
            echo "invaild max input"
        fi 
    done 

    echo "Processing to downloading images in DSC0 range "$min"-"$max 

    # Down load in range

    d=0

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
            let "d=d+1"
        fi

        
    done < "thunmbalilinks.txt"

    if [ $d == 0 ]; then

        echo "There are no images in that DSC0 range "$min"-"$max 

    else

        echo "Saved to "$rtdir

    fi 

}