#/bin/bash

#Name: Ben Tirabosco
#ID: 10393081


#Menu to guessage
echo "Welcome to age guess game!"

#Keep menu after or exit when user finishes
while true; do

    #Input user to play or exit game
    read -p "Press p to play new round or Press e to finish : " player

    #Game process beigins 
    if [[ "$player" = "p" ]]; then

        #Generate Random Age
        currentage=$((( RANDOM % 100 ) + 1 ))

        #Print guess age between 0-100
        echo "Guess the age between 0-100"

        #Start Time
        start="$(date -u +%s)" 
        

        #Keep guess age game unitl user guess age = age from radnom generator
        while true; do

            #User input for guessage
            read -p 'Enter age : ' guessage

            #Check if user input is an integer 
            if [[ "$guessage" =~ ^[0-9]+$ ]]; then

                # guess age equal to age from random generator and finish game 
                [ "$guessage" = "$currentage" ] && stop="$(date -u +%s)" && timedif="$(($stop-$start))" && echo "Correct! the current age is $currentage and you completed in $timedif seconds"  &&  break
                #guess age greater than age from random generator
                [ "$guessage" -gt "$currentage" ] && echo "Too high try again!"
                #guess age less than age from random generator
                [ "$guessage" -lt "$currentage" ] && echo "Too low try again!"

            #User input is not integer 
            else 
                echo "No float/deciminals and strings/characters "
            fi

        done

    #player finsih game
    elif [[ "$player" = "e" ]]; then
        echo "Thanks for playing"
        break

    #input invaild 
    else 
        echo "Invaild input"

    fi


done 