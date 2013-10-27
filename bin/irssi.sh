#!/bin/sh
#ssh -t -p 12344 ircuser@susanoganders.dk 'screen -rd irssi'
#ssh -t -p 12344 ircuser@susanoganders.dk 'bin/tmux-irssi.sh'
autossh -t -p 12344 ircuser@susanoganders.dk 'bin/tmux-irssi.sh'
