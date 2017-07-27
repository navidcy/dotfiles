#!/bin/sh
SESSION=utility
echo "starting $SESSION tmux session"

tmux has-session -t $SESSION
if [ $? != 0 ]
then
    mpd ~/.mpd/mpd.conf
    ssh-add

    # Create new session, name it, name the window, detach
    tmux new-session -s $SESSION -n misc -d

    tmux send-keys -t $SESSION 'echo $PWD' C-m
    tmux send-keys -t $SESSION 'mutt' C-m

    tmux split-window -h -t $SESSION
    #tmux send-keys -t $SESSION 'fortune' C-m
    tmux send-keys -t $SESSION 'bin/todo.sh' C-m

    tmux select-pane -t $SESSION:1.1
    tmux split-window -p 33 -v -t $SESSION
    tmux send-keys -t $SESSION 'vimpc' C-m

    tmux select-pane -t $SESSION:1.3
    tmux split-window -v -t $SESSION
    #tmux send-keys -t $SESSION 'mosh ad@idkfa.ucsd.edu' C-m
    tmux send-keys -t $SESSION 'bin/google-cloud-lamps-instance1-ssh.sh' C-m

    # optionally load additional windows
    if [ "$1" = "seaice" ]; then
        tmux new-window -t $SESSION -n SeaIce
        tmux select-pane -t $SESSION:2.1
        tmux send-keys -t $SESSION 'cd ~/code/SeaIce && vim' C-m
        tmux split-window -p 33 -h -t $SESSION
        tmux send-keys -t $SESSION 'cd ~/code/SeaIce && julia' C-m

        tmux new-window -t $SESSION -n SeaIce-exp
        tmux select-pane -t $SESSION:3.1
        tmux send-keys -t $SESSION 'cd ~/code/SeaIce-experiments' C-m
        tmux split-window -p 33 -h -t $SESSION
        tmux send-keys -t $SESSION \
            'cd ~/code/SeaIce-experiments && ~/bin/seaice-status.sh' C-m

        tmux new-window -t $SESSION -n idkfa
        tmux select-pane -t $SESSION:4.1
        tmux send-keys -t $SESSION \
            'sshfs ad@idkfa.ucsd.edu:/home/ad ~/idkfa && ~/bin/idkfa-ssh' C-m
    fi

    #tmux select-layout tiled
    tmux select-pane -t $SESSION:1.1

    #tmux send-keys -t $SESSION 'irc.sh' C-m   # process in first pane
    #tmux split-window -h -p 65 -t $SESSION  # horizontal split
    #tmux split-window -v -p 10 -t $SESSION  # bottom right
    #tmux send-keys -t $SESSION 'htop' C-m  
    #tmux select-pane -t $SESSION:1.1        # select first pane
    #tmux split-window -v -p 60 -t $SESSION  # create a pane below first pane
    #tmux split-window -v -p 56 -t $SESSION  # create a pane below first pane
    #tmux send-keys -t $SESSION 'htop' C-m   # process in third pane
    #tmux split-window -v -p 75 -t $SESSION  # create a pane below second pane
    #tmux send-keys -t $SESSION 'irc.sh' C-m  # process in fourth pane
    #tmux send-keys -t $SESSION 'ncmpcpp' C-m  # process in fourth pane
    #tmux send-keys -t $SESSION 'mpd; vimpc' C-m  # process in fourth pane
    #tmux select-pane -t $SESSION:1.1        # select first pane
fi
tmux attach -t $SESSION
