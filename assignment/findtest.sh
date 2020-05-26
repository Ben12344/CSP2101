#!/bin/bash

max=0
while IFS="\n" read -r line
do 
    let "linenum=linenum+1"

done < "thunmbalilinks.txt"

line=1

while true; do

    if [ $line -ge 76 ]; then
        break
    fi

    # 1

    linexx1=NR==$line

    linetodwd1=`awk $linexx1 thunmbalilinks.txt`

    thumbname1="${linetodwd1:64:8}"

    let "line=line+1"

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

    echo $thumbname1"   "$thumbname2"   "$thumbname3"   "$thumbname4"   "$thumbname5


done 