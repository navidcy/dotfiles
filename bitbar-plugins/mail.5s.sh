#!/bin/sh
newmails=$(find ~/Mail/*/INBOX/new -type f | wc -l | sed 's/ *//')
mailcolor="#859900"
debug=false
offlineimap=/usr/local/bin/offlineimap

if [ "$newmails" -gt 0 ]; then
    mailcolor="#cb4b16"
fi

echo "M: ${newmails} | color=${mailcolor}"

# everything below in drop down menu
echo "---"

mailboxes="$(find ~/Mail/*/INBOX/new -type f | sed 's/.*Mail\///' | sed 's/\/INBOX.*//')"
echo $mailboxes

echo "---"

echo "Sync inboxes | bash=\"$offlineimap\" param1=-qf param2=INBOX terminal=$debug"
echo "Sync all | bash=\"$offlineimap\" terminal=$debug"
