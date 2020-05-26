#!/bin/bash
source printlist.sh
source specific_thumbnail.sh
source all_thumbnail.sh
source range_thumbnail.sh
source random_thumbnail.sh

# Download source 
curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# Specific thunmbali links field txt file 
cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

echo "Hi Wellcome! "

#Menu

while true; do
    echo "The following options are"
    echo "  1. Download specific a thumbnail"
    echo "  2. Download all thumbnails"
    echo "  3. Download thumbnails in a range"
    echo "  4. Download random thumbnails"
    echo "  e. exit "

    read -p "Enter one of the options above: " menuinput

    if [[ $menuinput == 1 ]]; then

        spec_thumbnail

    elif [[ $menuinput == 2 ]]; then

        all_thumbnail

    elif [[ $menuinput == 3 ]]; then 

        range_thumbnail

    elif [[ $menuinput == 4 ]]; then

        random_thumbnail

    elif [[ $menuinput == "e" ]]; then

        echo "Thank you!"
        exit 0

    else
        echo "Invaild input"
    fi



done