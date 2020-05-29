#!/bin/bash

# Ben Tirabosco
# ID 10393081

# This function is to download thumbnails in a specific range
range_thumbnail() {

    # Make Range_images direcotry

    # This while loop searches if there is an existing directory associated with is ID at end (Range_images_0)
    # set n to zero to start id 0
    n=0
    # enter while loop until id doesnt exist
    # Search if that directory exists in current directory that user is running the script
    while true; do 
        # Append id number to string
        V=Range_images_$n

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
    rtdir=$path"/Range_images_"$n

    # print to let the user know what the range is
    echo "The range DSC0 is between 1533 - 2042"

    # Loop to set mix range value
    while true; do 
        # prompt user for min input
        read -p "Enter min DSC0 number greater or eqaul to 1533 and less than 2042: " min

        # check if min input meets the conditions: integer and 4 digits and greater than equal 1553 and less than 2042
        if [[ "$min" =~ ^[0-9]+$ ]] && [ ${#min} == 4 ] && [ $min -ge 1533 ] && [ $min -lt 2042 ]; then
            break
        
        # failed to meet requirements for min and redo min input
        else 
            echo "invaild min input"
        fi 
    done 

    # Loop to set max range values
    while true; do 

        # prompt user for max input
        read -p "Enter max DSC0 number less or eqaul to 2042 and greater then min ($min): " max
        
        # check if max input meets the conditions:  integer and 4 digits and less then equal 2042 and max is greater than min input which was processed before
        if [[ "$max" =~ ^[0-9]+$ ]] && [ ${#max} == 4 ] && [ $max -le 2042 ] && [ $max -gt $min ]; then
            break

        # failed to meet requirements for min and redo max input
        else 
            echo "invaild max input"
        fi 
    done 


    # Print to let user what range program is downloading
    echo "Processing to downloading images in DSC0 range "$min"-"$max 

    
    # Variable d for ammount of download done and set to 0
    d=0

    # while loop that reads line by line in "thunmbalilinks.txt"
    while IFS="\n" read -r line
    do 

        # obtain the number using the substring (for exaple DSC02222 --> is obtains varible to 2222)
        num="${line:68:4}"

         # Substring to get the thumbnail link nanme (DCS02043)  
        thumbname="${line:64:8}"

        
        # condition if thumbnail is in between range between min and max by comparing num variable
        if [ $num -ge $min ] && [ $num -le $max ]; then

            # This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
            # filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
            bytefilesize=$(curl -sI $line | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

            #convert to byt to kb using bash caculator (bc) otherweise the script will return int instead of a float
            kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

             # Download the thumbnail and store Range_images directory with its unique ID 
            wget -q $line -P $rtdir

            # Print details to user
            echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
            echo "Complete"

            # increment d varaible to comfirm that download has occured 
            let "d=d+1"
        fi

    done < "thunmbalilinks.txt"

    # check if d value is 0 (This means that there is no thumbnail that exist in the range given by the user)
    if [ $d == 0 ]; then

        # let user know
        echo "There are no images in that DSC0 range "$min"-"$max 

    # download had occured 
    else
        
        # print to user where the range images is saved
        echo "Saved to "$rtdir

    fi 

}