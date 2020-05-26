#!/bin/bash

# Download source 
echo "Download web page source"

curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# Specific thunmbali links fiel

cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

# download image for specific thumbail

while true; do 

    read -p "Enter specific thumbail DSC0 number range from 1533 - 2042 : " number

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
            echo "Downloaded in current direcotry"
            break 
        


        else :
            echo "Thumbail not found"
        fi

    else 
        echo "invaild input try again"
    fi

done









