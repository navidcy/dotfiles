#!/usr/bin/env bash
status_width=`echo "$(tput cols)/3"|bc|tr -d '\n'`
tmux new-window -n resize \
    "tmux set status-right-length $status_width; tmux set status-left-length $status_width"
