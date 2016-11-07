#!/bin/bash
host=ad@idkfa.ucsd.edu:/home/ad/music/

echo "syncing new music from $host"
rsync -rav --progress -e "ssh" $host /Users/ad/Music/iTunes/Music/

echo "syncing new music to $host"
rsync -rav --progress -e "ssh" /Users/ad/Music/iTunes/Music/ $host
