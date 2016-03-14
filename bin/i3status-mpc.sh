#!/bin/bash

i3status --config ~/.i3/status | (read line && echo $line && read line && echo $line && while :
do
    read line
    #dat=""
    dat="$(cat ~/.kbd-layout)"
	if [[ -n $(mpc | grep playing) ]]
	then
        dat="$(mpc current -f '[%artist%]'): $(mpc current -f '[%title%]')"
    fi
    dat="[{ \"full_text\": \"${dat}\" },"
    echo "${line/[/$dat}" || exit 1
done)
