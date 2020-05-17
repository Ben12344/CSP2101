#!/bin/bash

# Download source 

curl https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# Specific thunmbali links fiel

cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

# download image for specific ID

link=$(cat thunmbalilinks.txt | grep "1536" )

echo $link
echo "Now Downloading"
wget $link








