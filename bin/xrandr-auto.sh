#!/bin/bash

LAPTOPSCR=eDP1
EXTSCR=DP1
#PROJECTOR=


while true
do

    EXTSCRSTATUS=$(xrandr -q | grep "^$EXTSCR connected")
    #PROJSTATUS=$(xrandr -q | grep "$EXTSCR connected")

    # Enable external display if connected
    if [ -n "$EXTSCRSTATUS" ]; then  # if string is not empty
        xrandr --output $EXTSCR --auto --output $LAPTOPSCR --off
    else
        xrandr --auto
    fi

    sleep 5

done
