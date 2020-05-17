#!/bin/bash

# Download source 
echo "Download web page source"

curl https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# Specific thunmbali links fiel

cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

# download image for specific thumbail

number=2042


if [ $(cat thunmbalilinks.txt | grep $number ) ]; then

    echo "found"

    link=$(cat thunmbalilinks.txt | grep $number )

    echo $link
    echo "Now Downloading"
    wget $link


else :
    echo "not found"

fi










