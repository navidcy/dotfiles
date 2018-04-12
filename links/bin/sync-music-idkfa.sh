#!/bin/bash
host=ad@idkfa.ucsd.edu:/home/ad/music/
musicdir="$HOME/Music/iTunes/iTunes Media/Music/"

echo "syncing new music from $host"
rsync -rav --progress -e "ssh" $host "$musicdir"

echo "syncing new music to $host"
rsync -rav --progress -e "ssh" "$musicdir" $host
