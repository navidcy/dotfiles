#!/usr/bin/env bash

# add to crontab with:
# */3 *  * * *  ~/bin/mailcheck.sh

# Check every ten seconds if the process identified as $1 is still running. 
# After 5 checks (~60 seconds), kill it. Return non-zero to 
# indicate something was killed.
monitor() {
    local pid=$1 i=0

    while ps $pid &>/dev/null; do
        if (( i++ > 5 )); then
            echo "Max checks reached. Sending SIGKILL to 
            ${pid}..." >&2
            kill -9 $pid; return 1
        fi

        sleep 10
    done

    return 0
}

read -r pid < ~/.offlineimap/pid

if ps $pid &>/dev/null; then
    echo "Process $pid already 
    running. Exiting..." >&2
    exit 1
fi

# count new mail for every maildir
maildirnew="$HOME/Mail/*/INBOX/new/"
new="$(find $maildirnew -type f | wc -l | sed 's/ //g')"
mailboxes="$(find $maildirnew -type f | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"
if [ $new -gt 0 ]; then

    UNAMESTR=`uname`
    announcement="New mail: $new\nIn $mailboxes"
    if [[ "$UNAMESTR" == 'Darwin' ]]; then
        osascript -e "display notification \"$announcement\" with title \"offlineimap\""

        # Linux
    elif [[ "$UNAMESTR" == 'Linux' ]]; then
        export DISPLAY=:0; export XAUTHORITY=~/.Xauthority
        notify-send "$announcement"
    fi
fi



#/usr/local/bin/offlineimap -o -u quiet & monitor $!

# sync INBOXes only
/usr/local/bin/offlineimap -qf INBOX -o -u quiet & monitor $!
