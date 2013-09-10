#!/bin/bash

# the language is written to ./.kbd-layout
LAYOUTFILE="./.kbd-layout"

# define two languages
LANG1="us"
LANG2="dk"

# write the file if it doesn't exist
if [ ! -f $LAYOUTFILE ]; then
    echo "us" > $LAYOUTFILE
    setxkbmap $LANG1
    exit
fi

# read the language file, and switch to the other language
CURRLANG="`cat $LAYOUTFILE`"

if [ "$CURRLANG" == "$LANG1" ]; then
    echo $LANG2 > $LAYOUTFILE
    setxkbmap $LANG2
else
    echo $LANG1 > $LAYOUTFILE
    setxkbmap $LANG1
fi
