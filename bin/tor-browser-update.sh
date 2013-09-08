#!/bin/bash

# Optionally specify filename as command line argument

# To import the signing key to Debian with:
# $ gpg --keyserver keys.gnupg.net --recv 886DDD89
# $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
# $ sudo apt-get update
# $ sudo apt-get install deb.torproject.org-keyring

DOWNLOADCMD=torify wget
TORFOLDER=~/tor
DIR="https://www.torproject.org/dist/torbrowser/linux/"

if [[ -z "$1" ]]; then
    FILENAME="tor-browser-gnu-linux-x86_64-2.4.17-beta-1-dev-en-US"
else 
    FILENAME=$1
fi

cd $TORFOLDER &&\
echo "Attempting to download Tor Browser Bundle and signature"
TARGET=$DIR$FILENAME.tar.gz.asc
echo $TARGET
$DOWNLOADCMD $TARGET &&\
TARGET=$DIR$FILENAME.tar.gz
echo $TARGET
$DOWNLOADCMD $TARGET &&\
gpg --verify $FILENAME.tar.gz{.asc,} &&\
tar xvfz $FILENAME.tar.gz
