#!/bin/bash
remotecommand='tmux attach -dt 0'
set -e
if [ "$1" = "-s" ]; then
    ssh -i ~/.ssh/google-cloud-ssh-key andersdc@104.154.231.211 \
        -t $remotecommand
elif [ "$1" = "-a" ]; then
    autossh -i ~/.ssh/google-cloud-ssh-key andersdc@104.154.231.211
else
    mosh --ssh="ssh -i ~/.ssh/google-cloud-ssh-key" andersdc@104.154.231.211 \
        -- $remotecommand
fi
