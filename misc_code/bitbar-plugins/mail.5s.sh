#!/bin/bash
newmails=$(find ~/Mail/*/INBOX/new -type f)
numbernewmails=$(echo $newmails | wc -w | sed 's/ *//')
mailboxes="$(echo $newmails | tr ' ' '\n' | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"

mailcolor="#859900"
debug=false
#debug=true
offlineimap=/usr/local/bin/offlineimap

accounts=""
if [[ $mailboxes == *"adamsgaard"* ]]; then
    accounts="${accounts}a"
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
    mailcolor="#cb4b16"
    echo "M: ${numbernewmails} (${accounts}) | color=${mailcolor}"
else
    echo "M: ${numbernewmails} | color=${mailcolor}"
fi

# everything below in drop down menu
echo "---"

echo $mailboxes

echo "---"

from="$(cat $newmails | grep '^From: ' | sed 's/From: //')"
printf "$from\n"

echo "---"

echo "Sync inboxes | bash=\"$offlineimap\" param1=-qf param2=INBOX terminal=$debug"
echo "Sync all | bash=\"$offlineimap\" terminal=$debug"


if [[ $debug == "true" ]]; then
    echo "---"
    
    echo "newmails: $newmails"
    echo "numbernewmails: $numbernewmails"
    echo "mailboxes: $mailboxes"
fi

