#!/bin/bash

#USER=ircuser
#USER=adc
USER=andersdc
#HOST=susanoganders.dk
HOST=adamsgaard.dk
#PORT=12344
PORT=22
#POSTCMD=\'bin/tmux-irc.sh\'
POSTCMD=

UNAMESTR=`uname`
if [[ "$UNAMESTR" == 'Linux' ]]; then
    autossh -t -p $PORT $USER@$HOST $POSTCMD
elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    #ssh -t -p $PORT $USER@$HOST $POSTCMD
    mosh $USER@$HOST $POSTCMD
else
    echo "Platform not supported"
    exit 1
fi

