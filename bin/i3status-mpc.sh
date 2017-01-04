#!/bin/bash
mpdcolor="#81a2be"
host=bigquake.ucsd.edu

i3status --config ~/.i3/status | (read line && echo $line && read line && echo $line && while :
do
    read line
    dat=""
    if [[ -n $(mpc -h $host | grep playing) ]]
	then
        dat="$(mpc current -h $host -f '[%artist%]'): $(mpc current -h $host -f '[%title%]')"
    fi
    newmails=$(find ~/Mail/*/INBOX/new -type f | wc -l)
    kbdlayout=$(cat ~/.kbd-layout)
    mailcolor="#859900"
    if [ "$newmails" -gt 0 ]; then
        mailcolor="#cb4b16"
    fi

    dat="["\
"{\"full_text\":\"${dat}\",\"color\":\"${mpdcolor}\"},"\
"{\"full_text\":\"M: ${newmails}\",\"color\":\"${mailcolor}\"},"\
"{\"full_text\":\"${kbdlayout}\"},"

    #dat="[{\"name\":\"mpd\",\"full_text\":\"asdf\"},"
    echo "${line/[/$dat}" || exit 1
done)
