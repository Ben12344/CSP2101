#!/bin/bash
# Ben Tirabosco
# ID 10393081


# Bellow are the souces that stores functions in sperate file

source printlist.sh
source specific_thumbnail.sh
source all_thumbnail.sh
source range_thumbnail.sh
source random_thumbnail.sh


# Download source - this is the http link that is going to donwnload the webpage source and write into a text file 
curl -s https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 > websitesource.txt

# The line of code below is designed to strip the source and produce the text file that just have the http links 
    # cat produces the output of the websitesource.txt that was produced before
    # grep searches for lines that match "<img =scr" , this line contains the specific jpg http links for the thumbail
    # sed ensure the that thumbail links only have http links and everything else on that line stripped
    # the result of this is stored into a text file "thumbalilinks.txt"
cat websitesource.txt | grep "<img src=" | sed -e 's/<img src=//; s/alt="DSC0....">//; s/"//; s/"//' > thunmbalilinks.txt

echo "Hi Wellcome! "


# The purpose of this while true look is maintain menu input that have access to 4 task functions
while true; do
    # Display the options to the user
    echo "The following options are"
    echo "  1. Download specific a thumbnail"
    echo "  2. Download all thumbnails"
    echo "  3. Download thumbnails in a range"
    echo "  4. Download random thumbnails"
    echo "  e. exit "

    # prompt an input for the user to choose the following options above     
    read -p "Enter one of the options above: " menuinput

    # input equals 1 
    if [[ $menuinput == 1 ]]; then

        # Function to download a specific thumbnail 
        spec_thumbnail

    # input equals 2
    elif [[ $menuinput == 2 ]]; then

        # Function to download All thumbnail
        all_thumbnail

    # input equals 3
    elif [[ $menuinput == 3 ]]; then 

        # Function to download a specific range of thumbnail
        range_thumbnail

    # input equals 4
    elif [[ $menuinput == 4 ]]; then

        # Function to down random thumbnail
        random_thumbnail
        
    # input equals e
    elif [[ $menuinput == "e" ]]; then

        # Print to user 
        echo "Thank you!"
        exit 0
    
    # input doesn't match above 
    else
        echo "Invaild input"
    fi



done