#!/bin/bash

#USER=ircuser
USER=adc
HOST=susanoganders.dk
PORT=12344
POSTCMD=\'bin/tmux-irc.sh\'

UNAMESTR=`uname`
if [[ "$UNAMESTR" == 'Linux' ]]; then
    autossh -t -p $PORT $USER@$HOST $POSTCMD
elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    ssh -t -p $PORT $USER@$HOST $POSTCMD
else
    echo "Platform not supported"
    exit 1
fi

