#!/bin/bash

source ccodes.sh

function gen_rn () {
    range=$((($2-$1)+1));
    rand_num=$RANDOM
    let "rand_num %= $range"
    rand_num=$(($rand_num+$1))

}

calcresult() {

    if [ $1 -le 100 ] && [ $1 -ge 80 ] ; then
    
        result="HD"
   
    elif [ $1 -le 80 ] && [ $1 -ge 70 ] ; then
    
        result="D"
   
    elif [ $1 -le 70 ] && [ $1 -ge 60 ] ; then
    
        result="CR"

    elif [ $1 -le 60 ] && [ $1 -ge 50 ] ; then
    
        result="C"


    else

        result="${RED}N${NCOL}"

    fi

}