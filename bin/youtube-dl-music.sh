#!/bin/bash
set -e
set -u

read -p "torify? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    prefix=""
else
    prefix="torify"
fi

$prefix youtube-dl \
    --format bestaudio \
    --extract-audio \
    --audio-quality 0 \
    --audio-format mp3 \
    $1

read -p "add metadata? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    filename=$(youtube-dl \
        --get-filename \
        --format bestaudio \
        --extract-audio \
        --audio-quality 0 \
        --audio-format mp3 \
        $1)
    filename=$(echo $filename | sed "s/\..*$/.mp3/")

    read -p "artist: " artist
    read -p "album: " album
    read -p "song: " song

    id3v2 --artist "$artist" --album "$album" --song "$song" "$filename"
fi

read -p "move to music folder? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    if [[ "$(uname)" == 'Darwin' ]]; then
        musicroot="$HOME/Music/iTunes/iTunes Media/Music/"
    else
        musicroot="$HOME/music/"
    fi

    outdir="$musicroot/$artist/$album"
    mkdir -p "$outdir"
    mv "$filename" "$outdir/$song.mp3"

    echo "updating mpd"
    mpc update > /dev/null
fi
