#/bin/bash



echo "Wellcome to age guess game!"

while true; do

    read -p "Press p to play new round or Press e to finish : " player

    if [[ "$player" = "p" ]]; then

        currentage=$((( RANDOM % 100 ) + 1 ))

        start="$(date -u +%s)" 

        echo "Guess the age between 0-100"
        
        while true; do

            read -p 'Enter age : ' guessage

            if [[ "$guessage" =~ ^[0-9]+$ ]]; then

                [ "$guessage" = "$currentage" ] && stop="$(date -u +%s)" && timedif="$(($stop-$start))" && echo "Correct! the current age is $currentage and you completed in $timedif seconds"  &&  break
                [ "$guessage" -gt "$currentage" ] && echo "Too high try again!"
                [ "$guessage" -lt "$currentage" ] && echo "Too low try again!"

            else 
                echo "No float/deciminals and strings/characters "
            fi

        done

    elif [[ "$player" = "e" ]]; then
        echo "Thanks for playing"
        break

    else 
        echo "Invaild input"

    fi


done 