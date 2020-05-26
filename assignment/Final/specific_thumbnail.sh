#!/bin/bash
source printlist.sh


spec_thumbnail() {

    # download image for specific thumbail
    path=`pwd -P`

    #Print images
    echo "Images that are avialable are: "

    printlist

    while true; do 

        read -p "Enter specific thumbail DSC0 number from range in 1533 - 2042 as listed above (for example DSC01688 -> enter 1688): " number

        if [[ "$number" =~ ^[0-9]+$ ]] && [ ${#number} == 4 ]; then


            if [ $(cat thunmbalilinks.txt | grep $number ) ]; then

                link=$(cat thunmbalilinks.txt | grep $number )

                thumbname="${link:64:8}"

                # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
                # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
                bytefilesize=$(curl -sI $link | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

                #convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
                kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

                wget -q $link  
                echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
                echo "Complete"
                echo "Downloaded in current direcotry : $path"
                break 
            


            else :
                echo "Thumbail not found"
            fi

        else 
            echo "invaild input try again"
        fi

    done


}