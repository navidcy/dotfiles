#!/bin/sh

if [[ "$(ifconfig | grep 10.17.8)" ]]; then
    echo "On geo lan, connecting directly..."
    ssh -X iddqd.st.client.au.dk -t 'tmuxinator poster'
elif [[ "$(ifconfig | grep 10.17.2)" ]]; then
    echo "On geo VPN, connecting directly..."
    ssh -X iddqd.st.client.au.dk -t 'tmuxinator poster'
else
    echo "Outside geo lan, connecting through fresh-horse..."
    ssh -X fh.cs.au.dk -t 'ssh -X iddqd.st.client.au.dk -t "tmuxinator poster"'
fi
