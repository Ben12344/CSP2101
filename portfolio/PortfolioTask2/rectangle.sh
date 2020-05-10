#!/bin/bash

# Check to find rectangle
if [ -f rectangle_f.txt ] ; then

    # Remove rectangle_f.txt 
    rm rectangle_f.txt 

fi


# Check to find rectangle.txt
if [ -f rectangle.txt ] ; then

# Sed command explaination for lines 23-28: 
    # Line 23 Remove first line
    # Line 24 Add 'Name: ' at start of line
    # Line 25 Substitute first "," with tab follow "Height: "
    # Line 26 Substitute second "," with tab follow "Width: "
    # Line 27 Substitute thrid "," with tab follow "Area:: "
    # Line 28 Substitute fourth "," with tab follow "Colour: " install new text into rectangle_f.txt from rectangle file

    sed -e '1d;'\
        -e 's/^/Name: /'\
        -e 's/,/\t Height: /'\
        -e 's/,/\t Width: /'\
        -e 's/,/\t Area: /'\
        -e 's/,/\t Colour: /' rectangle.txt > rectangle_f.txt
        
    exit 0;

# Rectangle.txt does not exist and exit
else :
    echo "Cannot find rectangle.txt file"
    exit 0;

fi
