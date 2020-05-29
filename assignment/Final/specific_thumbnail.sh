#!/bin/bash
# Ben Tirabosco
# ID 10393081

# This source provide a function to echo the thumbnails avialble to the user (funtion is printlist)
source printlist.sh

# Download image for specific thumbail
spec_thumbnail() {

    # This command provide the variable "path" the current directory path the user is working with this software solution
    path=`pwd -P`

    
    echo "Images that are avialable are: "

    # printlist function echos the thumbnails that are avialble (see printlist.sh for code for it)
    printlist

    # This loop to keep user in until a specific thumbnail is downloaded
    while true; do 


        # Prompt user for thumbnail number they want to download 
        read -p "Enter specific thumbail DSC0 number from range in 1533 - 2042 as listed above (for example DSC01688 -> enter 1688): " number


        # check if number is an integer and has 4 digits
        if [[ "$number" =~ ^[0-9]+$ ]] && [ ${#number} == 4 ]; then

            # check if number matches in "thumbalilinks.txt" 
            if [ $(cat thunmbalilinks.txt | grep $number ) ]; then

                # assign the matched http link line to variable link
                link=$(cat thunmbalilinks.txt | grep $number )

                # Substring to get the thumbnail link nanme (DCS02043)
                thumbname="${link:64:8}"

                # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
                # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
                bytefilesize=$(curl -sI $link | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

                # convert to byt to kb using bash caculator (bc) otherweise the script will return int instead of a float
                kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

                # Download thumbnail
                wget -q $link  

                # Print to echo results to user
                echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
                echo "Complete"

                 # print to user where the specific is saved
                echo "Downloaded in current direcotry : $path"
                break 
            

            # DSC number not found so let user know
            else :
                echo "Thumbail not found"
            fi
        
        # Invaild input 
        else 
            echo "invaild input try again"
        fi

    done


}