#!/bin/bash
set -e
remotecommand='tmux attach -dt 0'
host=104.154.231.211
user=andersdc
if [ "$1" = "-s" ]; then
    ssh -i ~/.ssh/google-cloud-ssh-key $user@$host \
        -t $remotecommand
elif [ "$1" = "-a" ]; then
    autossh -i ~/.ssh/google-cloud-ssh-key $user@$host
else
    mosh --ssh="ssh -i ~/.ssh/google-cloud-ssh-key" $user@$host \
        -- $remotecommand
fi