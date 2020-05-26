#!/bin/bash

source printlist.sh

# Download source 
curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# Specific thunmbali links field txt file 
cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

echo "Hi Wellcome! "

#Menu

echo "Please select the following options"
echo "\t 1. Download specific a thumbnail"
echo "\t 2. Download all thumbnails"
echo "\t 3. Download thumbnails in a range"
echo "\t 4. Download random thumbnails"
echo "\t e. exit "


