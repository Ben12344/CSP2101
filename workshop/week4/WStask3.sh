#!/bin/bash

read -p 'Enter the name or part name of the file your looking for: ' reqfile

    for i in $( find  ~/Documents/csp2101 -name $reqfile\* ) ; do
        
        if [ -s "$i" ]; then
            echo "the content of $i are as follows"
            cat $i

        else 
            echo "the $i file is empty."
        fi

    done
