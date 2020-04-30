#!/bin/bash

source ccodes.sh

ccarea () {

    pi_val=$(echo 3.14159)

    if [[ "$1" =~ ^[0-9]+$ ]] || [[ "$1" =~ ^[-+][0-9]+\.?[0-9]+$ ]]; then
    
        area=$(echo "scale=1; $pi_val*$1*$1" |bc) #bc is bash calulator
        echo -n "The area of a circle with a radius of $1 units is "
        printf "%0.2f" $area
        echo " Units squared. "

    else

        echo "Invaild Value entered. Calculation failed."
        exit 1

    fi

}

read -p 'Enter a radius value: ' rval
ccarea $rval