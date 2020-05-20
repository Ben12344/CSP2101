#!/bin/bash

# Get how many lines in html file

linenum=0
while IFS="\n" read -r line
do 
    let "linenum=linenum+1"
done < "thunmbalilinks.txt"
actulnumLines=0
let "actulnumLines=linenum"


#Get randomline number
randomline=$((( RANDOM % $actulnumLines ) + 1 ))

linexx=NR==$randomline

linetodwd=`awk $linexx thunmbalilinks.txt`

thumbname="${linetodwd:64:8}"

# This is causing carriage return (\\r) and the command gsub("\\r", "") in awk removes it for next block of codes
# filesize=$(curl -sI $line | awk '/Content-Length:/{printf $2}')        
bytefilesize=$(curl -sI $linetodwd | awk '/Content-Length:/{gsub("\\r", ""); printf $2}')

#convert to byt to kb using bash caculator (bc) otherweise it script will return int instead of a float
kbfilesize=$(bc <<< "scale=2; $bytefilesize/1024")

wget -q $linetodwd  
echo "Downloading" $thumbname "with the file name" $thumbname".jpg, with a file size of" $kbfilesize "KB... Download"
echo "Complete"


