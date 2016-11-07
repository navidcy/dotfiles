#!/bin/bash

color="#f0c674"

#kwmc=$HOME/code/kwm/bin/kwmc
kwmc=/usr/local/bin/kwmc

currentFocus=$($kwmc query focus)
currentMouse=$($kwmc query mouse-follows)
tag=$($kwmc query tag)

if [ "$1" = 'quit' ]; then
  killall kwm
  exit
fi

if [ "$1" = 'reload' ]; then
  $kwmc config reload
  exit
fi

if [ "$1" = 'refresh' ]; then
  $kwmc tree -c refresh
  exit
fi

if [ "$1" = 'bsp' ]; then
  $kwmc space -t bsp
  exit
fi

if [ "$1" = 'monocle' ]; then
  $kwmc space -t monocle
  exit
fi

if [ "$1" = 'float' ]; then
  $kwmc space -t float
  exit
fi

if [ "$1" = 'toggle-autoraise' ]; then
  [[ $currentFocus = "autoraise" ]] && value="disabled" || value="autoraise"
  $kwmc config focus $value
  exit
fi

if [ "$1" = 'toggle-mouse-follows' ]; then
  [[ $currentMouse = "enabled" ]] && value="disable" || value="enable"
  $kwmc config focus mouse-follows $value
  exit
fi

echo "$(echo kwm $tag | sed 's/kwm Connection failed!//') | dropdown=false color=${color}"

echo "---";

echo "BSP | bash=$0 param1=bsp terminal=false"
echo "Monocle | bash=$0 param1=monocle terminal=false"
echo "Floating | bash=$0 param1=float terminal=false"

echo "---"

[[ $currentFocus = "autoraise" ]] && focus="Disable" || focus="Enable"

echo "$focus Focus Follows Mouse | bash=$0 param1=toggle-autoraise terminal=false"

[[ $currentMouse = "enabled" ]] && mouse="Disable" || mouse="Enable"

echo "$mouse Mouse Follows Focus | bash=$0 param1=toggle-mouse-follows terminal=false"

echo "---"

echo "Refresh kwm | bash=$0 param1=refresh terminal=false"
echo "Reload kwm | bash=$0 param1=reload terminal=false"
echo "Quit kwm | bash=$0 param1=quit terminal=false"

