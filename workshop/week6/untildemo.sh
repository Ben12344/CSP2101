#!/bin/bash

source functions.sh
source ccodes.sh 
result=0
counter=0

read -p "Enter a number between 2 and 20 inclusive: " usrval

until [[ $result -eq $usrval ]]; do

    (( counter++ ))

    gen_rn 1 10 
    rnum1=$rand_num
    gen_rn 1 10 
    rnum2=$rand_num
    result=$(($rnum1 + $rnum2))

    if ! [[ $usrval -eq $result ]] ; then
     
        echo -e "The entered value does $usrval ${RED}not match${NCOL} the randomly generated value $result"
        echo "The loop is being repeated!" 
    
    else
    
    echo -e "The entered value does $usrval ${BLUE}match${NCOL} the randomly generated value $result"
    echo "The loop is being exited!" 

    fi

done

echo -e "The loop has been excited after ${YELLOW}$counter${NCOL} attempts to find the match"

exit 0