#!/bin/bash
#FONT=uushi
#FONT=Terminus
FONT=lemon
printf '\33]50;%s%d\007' "xft:$FONT:pixelsize=" $1
