#!/bin/bash
set -e
remotecommand='tmux attach -dt 0'
host=adamsgaard.dk
user=andersdc
if [ "$1" = "-s" ]; then
    ssh $user@$host -t $remotecommand
elif [ "$1" = "-a" ]; then
    autossh $user@$host
else
    if [[ "$1" = "notmux" ]]; then
        remotecommand=""
    fi
    mosh $user@$host -- $remotecommand
fi
