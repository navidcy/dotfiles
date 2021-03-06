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

outputdir=$TMPDIR/ytdl-playlist
mkdir -p "$outputdir"
cd "$outputdir"

$prefix youtube-dl \
    --format bestaudio \
    --extract-audio \
    --audio-quality 0 \
    --audio-format mp3 \
    --output "%(playlist_index)s-%(title)s.%(ext)s" \
    "$1"

read -p "add metadata? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    artist="Unknown Artist"
    album="Unknown Album"
    track=1

    # Loop over files with spaces
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for f in *.mp3; do

        echo -e "\033[0;31m$f\033[0m"

        song=$(echo "$f" | sed 's/.*-//' | sed 's/^ //' | sed 's/\.mp3//')
        read -r -p "song [$song]: " input
        song="${input:-$song}"

        read -r -p "track [$track]: " input
        track="${input:-$track}"

        read -r -p "album [$album]: " input
        album="${input:-$album}"

        read -r -p "artist [$artist]: " input
        artist="${input:-$artist}"

        id3v2 --artist "$artist" --album "$album" \
            --song "$song" --track "$track" \
            "$f"
        (( track += 1 ))
    done
    # Revert default behavior
    IFS=$SAVEIFS

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
        mv ./*.mp3 "$outdir"

        echo "updating mpd"
        mpc update > /dev/null

        rmdir "$outputdir"
        cd -
    fi
fi
