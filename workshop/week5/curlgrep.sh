#!/bin/bash

wpcount=0
wpccount=0
wpicount=0

read -p 'Please provide a full URL to test: ' url

curl $url > wpage.txt 

wpcount="`grep -c -i 'wordpress' wpage.txt`"
echo "There term wordpress appears $wpcount times in this website"

wpccount="`grep -c -i 'wp-content' wpage.txt`"
echo "There term wp-content appears $wpccount times in this website"

wpicount="`grep -c -i 'wp-includes' wpage.txt`"
echo "There term wp-includes appears $wpicount times in this website"

if [[ $wpcount > 0 ]] && [[ $wpccount > 0 ]] && [[ $wpicount > 0 ]]; then
    echo "Thise is def wordpress website"
else
    echo "This is unlikey wordpress count"
fi

exit 0

