#!/bin/bash

source ccodes.sh

ktm () {

    toMiles=1.60934
    echo "You want $1 km coverted to miles..."
    miles=$(echo "scale=2; $1/$toMiles" | bc)
    echo -e "${YELLOW}$1${NCOL} km is eequivent to ${GREEN}$miles${NCOL} miles."
     
}

read -p 'Enter kilometers to convert to miles: ' kvar
ktm $kvar