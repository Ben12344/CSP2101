#!/bin/bash

ccsp() {
    local volume
    volume=$(($1*$2*$3))
    echo $volume
}

room1=$(ccsp 4 3 2)
room2=$(ccsp 5 4 2)
room3=$(ccsp 6 5 2)

echo "Room 1 is $room1 cubic metres."
echo "Room 2 is $room2 cubic metres."
echo "Room 3 is $room3 cubic metres."

exit 0