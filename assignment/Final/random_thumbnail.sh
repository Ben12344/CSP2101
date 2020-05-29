#!/bin/bash

# Ben Tirabosco
# ID 10393081

# This function prompt user for the number of random images and download that ammount of random images specified by the user 
random_thumbnail() {

    # This while loop searches if there is an existing directory associated with is ID at end (Random_images_0)
    # set n to zero to start id 0
    n=0
    # enter while loop until id doesnt exist
    # Search if that directory exists in current directory that user is running the script
    while true; do 
        # Append id number to string
        V=Random_images_$n

        # Directory found for V    
        if [ -d $V ]; then

            # incremment n 
            let "n=n+1"
        
        # Direcotry not found
        else
            # make new directory with at current ID (n)
            mkdir $V
            break    
        fi

    done

    # path that current user is running and construct path (rtdir)
    path=`pwd -P`
    rtdir=$path"/Random_images_"$n

    
    # This loop determines how many thumbnails are avialable in the 'thumbnalilinks.txt' and inccrements for each line for linenum
    linenum=0
    while IFS="\n" read -r line
    do 
        let "linenum=linenum+1"

    done < "thunmbalilinks.txt"



    # This loop prompts for the user to get integer for ammount of random images and ensure it vaild before procedding to next part
    while true; do 
        # This prompts for the user to input the ammount of random images 
        read -p "Enter an integer for the number of images to download: " input

        # Check if input is integer then break
        if [[ "$input" =~ ^[0-9]+$ ]]; then
            break
        # Not correct input stay in loop
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

        # Substring to get the thumbnail link nanme (DCS02043)  
        thumbname="${linetodwd:64:8}"

        # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
        # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
        bytefilesize=$(curl -sI $linetodwd | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

        #convert to byt to kb using bash caculator (bc) otherweise the script will return int instead of a float
        kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

        # Download the thumbnail and store into Random_images_** directory with its unique ID 
        wget -q $linetodwd -P $rtdir

        # Print details to user
        echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
        echo "Complete"

    done

    # print to user where the random images is saved
    echo "Saved into "$rtdir 

}