#!/bin/bash

read -p "type the na,me of the folder you like to copy: " foldername
#if the name is valid directory

if [ -d "$foldername" ]; then
    #copy it to a new location
    read -p "type the name of the destination folder: " newFoldernName
    cp -r "$foldername" "$newFoldernName"
else
    echo "I can't find that folder"
fi

