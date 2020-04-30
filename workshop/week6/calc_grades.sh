#!/bin/bash

source functions.sh

echo -e "Student\tGrade1\tGrade2\tGrade3\tScore\tResult"

while IFS=", " read sname grade1 grade2 grade3 
do 

    score=$(( grade1 + grade2 + grade3 ))
    
    calcresult $score

    echo -e "$sname\t$grade1\t$grade2\t$grade3\t$score\t$result"

done < grades.txt

exit 0