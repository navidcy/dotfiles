#!/bin/bash -e
device=en0

yellow=`tput setaf 3`
reset=`tput sgr0`

function printmac {
    echo $(ifconfig $device | grep ether | sed 's/ether //')
}

echo -en "${yellow}Mac address of $device before:${reset}\t"
printmac

echo "Bringing $device down"
sudo ifconfig $device down

sleepduration=$(echo 10 + $RANDOM/1000 | bc)
echo -e "${yellow}Sleeping $sleepduration seconds...${reset}"
sleep $sleepduration

echo "Bringing $device up"
sudo ifconfig $device up

sleep 1

fakemac=$(od -An -N6 -tx1 /dev/urandom | \
    sed -e 's/^  *//' -e 's/  */:/g' -e 's/:$//' -e 's/^\(.\)[13579bdf]/\10/')
echo "Spoofing MAC address for $device"
sudo ifconfig $device ether $fakemac

echo -en "${yellow}Mac address of $device after:${reset}\t"
printmac
