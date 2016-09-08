#!/bin/bash
read -p "torify? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
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

    read -p "artist: " artist
    read -p "album: " album
    read -p "song: " song

    id3v2 --artist "$artist" --album "$album" --song "$song" $filename
fi
