#!/bin/bash -e
maildir=~/Mail
if [ ! -d $maildir ]; then
    exit 0
fi
newmails=$(find $maildir/*/{INBOX,geodatahub}/new -type f)
numbernewmails=$(echo $newmails | wc -w | sed 's/ *//')
mailboxes="$(echo $newmails | tr ' ' '\n' | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"

mailcolor="#859900"
debug=false
#debug=true
offlineimap=/usr/local/bin/offlineimap

accounts=""
if [[ $mailboxes == *"adamsgaard"* ]]; then
    if [[ $mailboxes == *"geodatahub"* ]]; then
        accounts="${accounts}G"
    else
        accounts="${accounts}a"
    fi
fi
if [[ $mailboxes == *"princeton"* ]]; then
    accounts="${accounts}p"
fi
if [[ $mailboxes == *"noaa"* ]]; then
    accounts="${accounts}n"
fi
if [[ $mailboxes == *"gmail"* ]]; then
    accounts="${accounts}g"
fi
if [[ $mailboxes == *"geomail"* ]]; then
    accounts="${accounts}e"
fi
if [[ $mailboxes == *"ucsd"* ]]; then
    accounts="${accounts}u"
fi
if [[ $mailboxes == *"riseup"* ]]; then
    accounts="${accounts}r"
fi

if [ "$numbernewmails" -gt 0 ]; then
    echo "#[fg=red]M: ${numbernewmails} (${accounts})"
else
    echo "#[fg=green]M: ${numbernewmails}"
fi
