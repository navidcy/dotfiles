#!/bin/bash

# Define the increment between adjustments
#INC=5

# Define the brightness increment factor between adjustments
INC=3

# The folder containing keyboard backlight files
CTRLDIR=/sys/class/leds/smc::kbd_backlight

# The current brightness file
CTRLF=$CTRLDIR/brightness

# The current brightness value
V=`cat $CTRLF`

# The max. brightness value
MAXV=`cat $CTRLDIR/max_brightness`
MINV=0

if [[ "$1" == "up" ]]; then
    #NEWV=$((V+INC))
    NEWV=$(((2+V)*INC))
    if (( "$NEWV" <= "$MAXV" )); then
        echo $NEWV > $CTRLF
    else
        echo $MAXV > $CTRLF
    fi
elif [[ "$1" == "down" ]]; then
    #NEWV=$((V-INC))
    NEWV=$((V/INC-2))
    if (( "$NEWV" >= "$MINV" )); then
        echo $NEWV > $CTRLF
    else
        echo $MINV > $CTRLF
    fi
fi
