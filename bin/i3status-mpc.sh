#!/bin/bash
mpdcolor="#81a2be"

i3status --config ~/.i3/status | (read line && echo $line && read line && echo $line && while :
do
    read line
    dat=""
    if [[ -n $(mpc | grep playing) ]]
	then
        dat="$(mpc current -f '[%artist%]'): $(mpc current -f '[%title%]')"
    fi
    newmails=$(find ~/Mail/*/INBOX/new -type f | wc -l)
    kbdlayout=$(cat ~/.kbd-layout)
    mailcolor="#859900"
    if [ "$newmails" -gt 0 ]; then
        mailcolor="#cb4b16"
    fi

    dat="["\
"{\"full_text\":\"${kbdlayout}\"},"\
"{\"full_text\":\"M: ${newmails}\",\"color\":\"${mailcolor}\"},"\
"{\"full_text\":\"${dat}\",\"color\":\"${mpdcolor}\"},"

    #dat="[{\"name\":\"mpd\",\"full_text\":\"asdf\"},"
    echo "${line/[/$dat}" || exit 1
done)
