#!/bin/bash
#FONT=uushi
#FONT=Terminus
#FONT=lemon
FONT="Monaco for Powerline"
printf '\33]50;%s%d\007' "xft:$FONT:pixelsize=" $1
