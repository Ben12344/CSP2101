#!/bin/bash

#Ben Tirabosco
#ID: 10393081


if [ -f rectangle_f.txt ] ; then

   
    rm rectangle_f.txt 

fi



if [ -f rectangle.txt ] ; then

    sed -e '1d;'\ 
        -e 's/^/Name: /;'\ 
        -e 's/,/\t Height: /;'\ 
        -e 's/,/\t Width: /;'\ 
        -e 's/,/\t Area: /;'\ 
        -e 's/,/\t Colour: /p' rectangle.txt > rectangle_f.txt
        
    exit 0;


else :
    echo "Cannot find rectangle.txt file"
    exit 0;

fi
