#!/bin/bash
maildir=~/Mail
if [ ! -d $maildir ]; then
    exit 0
fi
newmails=$(find $maildir/*/INBOX/new -type f)
numbernewmails=$(echo $newmails | wc -w | sed 's/ *//')
mailboxes="$(echo $newmails | tr ' ' '\n' | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"

mailcolor="#859900"
debug=false
#debug=true
offlineimap=/usr/local/bin/offlineimap

accounts=""
if [[ $mailboxes == *"riseup"* ]]; then
    accounts="${accounts}r"
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
    accounts="${accounts}a"
fi
if [[ $mailboxes == *"ucsd"* ]]; then
    accounts="${accounts}u"
fi

if [ "$numbernewmails" -gt 0 ]; then
    echo "#[fg=red]M: ${numbernewmails} (${accounts})"
else
    echo "#[fg=green]M: ${numbernewmails}"
fi
