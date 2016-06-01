#!/bin/sh
newmails=$(find ~/Mail/*/INBOX/new -type f)
numbernewmails=$(echo $newmails | wc -w | sed 's/ *//')
mailcolor="#859900"
debug=false
offlineimap=/usr/local/bin/offlineimap

if [ "$numbernewmails" -gt 0 ]; then
    mailcolor="#cb4b16"
fi

echo "M: ${numbernewmails} | color=${mailcolor}"

# everything below in drop down menu
echo "---"

mailboxes="$(echo $newmails | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"
echo $mailboxes

echo "---"

from="$(cat $newmails | grep 'From: ' | sed 's/From: //' | sed 's/>/>\\n/')"
echo $from

echo "---"

echo "Sync inboxes | bash=\"$offlineimap\" param1=-qf param2=INBOX terminal=$debug"
echo "Sync all | bash=\"$offlineimap\" terminal=$debug"
