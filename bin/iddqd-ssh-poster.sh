#!/bin/sh

if [[ "$(ifconfig | grep 10.17.8)" ]]; then
    echo "On geo lan, connecting directly..."
    ssh -X iddqd.nfit.au.dk -t 'tmuxinator poster'
else
    echo "Outside geo lan, connecting through fresh-horse..."
    ssh -X fh.cs.au.dk -t 'ssh -X iddqd.nfit.au.dk -t "tmuxinator poster"'
fi
