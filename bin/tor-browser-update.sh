#!/bin/bash

# Optionally specify filename as command line argument

if [[ -z "$1" ]]; then
    FILENAME="tor-browser-gnu-linux-x86_64-2.4.17-beta-1-dev-en-US"
else 
    FILENAME=$1
fi

DIR="https://www.torproject.org/dist/torbrowser/linux/"

TORFOLDER=~/tor
cd $TORFOLDER &&\
echo "Attempting to download Tor Browser Bundle and signature"
TARGET=$DIR$FILENAME.tar.gz.asc
echo $TARGET
wget $TARGET &&\
TARGET=$DIR$FILENAME.tar.gz
echo $TARGET
wget $TARGET &&\
gpg --verify $FILENAME.tar.gz{.asc,} &&\
tar xvfz $FILENAME.tar.gz
