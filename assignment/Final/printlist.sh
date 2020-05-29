#!/bin/bash

# Ben Tirabosco
# ID 10393081

# Purpose of this function is to echo the avialbale thumbnail to the user is specific format 

printlist() {



# This loop determines how many thumbnails are avialable in the 'thumbnalilinks.txt' and inccrements for each line for linenum
max=0
while IFS="\n" read -r line
do 
    let "linenum=linenum+1"

done < "thunmbalilinks.txt"


# This line variable is set to one
line=1

# While loop to echo the screen
while true; do

    # if line is greater than 78 get break the look
    if [ $line -ge 76 ]; then
        break
    fi

    # 1
    
    # Set variable linexx1 string "NR==**" (** is number from line for example "NR==24" )  
    linexx1=NR==$line

    # This varaible returns awk command for particular line in thunmbalilinks.txt
    linetodwd1=`awk $linexx1 thunmbalilinks.txt`

    # Strip to get DSC0**** for example (DSC03024)
    thumbname1="${linetodwd1:64:8}"

    # Increment line 
    let "line=line+1"

    # Below is the exact same code before however it is increment upto 5 for each variable (2, 3, 4, 5)

    #2

    linexx2=NR==$line

    linetodwd2=`awk $linexx2 thunmbalilinks.txt`

    thumbname2="${linetodwd2:64:8}"

    let "line=line+1"

    # 3

    linexx3=NR==$line

    linetodwd3=`awk $linexx3 thunmbalilinks.txt`

    thumbname3="${linetodwd3:64:8}"

    let "line=line+1"

    # 4

    linexx4=NR==$line

    linetodwd4=`awk $linexx4 thunmbalilinks.txt`

    thumbname4="${linetodwd4:64:8}"

    let "line=line+1"

    # 5
    linexx5=NR==$line

    linetodwd5=`awk $linexx5 thunmbalilinks.txt`

    thumbname5="${linetodwd5:64:8}"

    let "line=line+1"


    # The echo prints out the DSC0**** avaible to the user in a specific format

    echo $thumbname1"   "$thumbname2"   "$thumbname3"   "$thumbname4"   "$thumbname5


done 

}

