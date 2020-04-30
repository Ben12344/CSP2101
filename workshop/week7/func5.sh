#!/bin/bash

getpr() {

    local payrate=0

    if [[ $1 =~ ^[1-3] ]] ; then

        case $1 in
        1)
            payrate=25
        ;;
        2)
            payrate=35
        ;;
        3)
            payrate=45
        ;;
        
        esac

    fi
    return $payrate
}

read -p 'Enter the employees scale ID: ' pscale
getpr $pscale
phh=$?

if [ $phh -eq 0 ] ; then
    echo "Invaild Pay Rate ID entered"
else
    echo -e "The employee's hourly rate is ${YELLOW}$phh${NCOL}"
fi