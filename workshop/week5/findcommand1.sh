#!/bin/bash

function cal_rand () {
    floor=20;
    celling=70;
    range=$(($celling-$floor+1));
    rand_num=$RANDOM;
    let "rand_num %= $range";
    rand_num=$(($rand_num+$floor));
}

rtdir=~/Documents/csp2101 budir=~/Documents/csp2101/backup bufile="" tmstamp="date+%s"

read -p 'Enter the name or part of the file(s) you wish to backup: ' reqfile

for i in $(find $rtdir -name $reqfile\*); do

    if [ -s "$i" ] ; then
        cal_rand 1 99
        origpath=${i%/*}
        origfile=${i##*/}

        bufile="$tmstamp$sepchar$rand_num$sepchar$origfile"
        cp $origpath$pathsep$origfile $origpath$pathsep$bufile
        mv $origpath$pathsep$bufile $budir

        (( successcount++ ))

    else
        echo "The $i file is empty and was not backed up. "
        ((failcount++)) 
    fi


done

echo "$successcount files were backuped successfully to the $budir"
echo "$failcount file(s) were not backuped "