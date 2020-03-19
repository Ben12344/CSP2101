#!/bin/bash

read -p 'Provide a name for the new directory: ' foldername
# echo "$foldername"
mkdir $foldername
echo "The $foldername directory has been created."
cp foldermaker.sh $foldername  
echo "The file foldermaker.sh has been coped to $foldername directory."
