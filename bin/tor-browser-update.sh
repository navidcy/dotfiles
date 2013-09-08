#!/bin/bash

# Gets latest Tor Browser Bundle development version for Linux x86_64, downloads
# it, verifies it, and extracts it.

# To import the signing key to Debian run:
# $ gpg --keyserver keys.gnupg.net --recv 886DDD89
# $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
# $ sudo apt-get update
# $ sudo apt-get install deb.torproject.org-keyring

DOWNLOADCMD="torify wget"
TORFOLDER=~/tor
DIR="https://www.torproject.org/dist/torbrowser/linux/"

# Find latest TBB version
echo "Determining latest Tor Browser Bundle development version"
TMPFILENAME=.tordownloadpage.html
$DOWNLOADCMD https://www.torproject.org/projects/torbrowser.html.en#downloads -O $TMPFILENAME && \
LATESTTBB=`grep 'dev-en-US.tar.gz">64-bit' $TMPFILENAME | tail -n 1 | sed 's/.*tor-browser/tor-browser/' | sed 's/tar.gz.*/tar.gz/'` && \
echo "Latest Tor Browser Bundle dev. version is $LATESTTBB"
rm $TMPFILENAME

# Check if the TBB version is already downloaded
if [ -e $TORFOLDER/$LATESTTBB ]; then
    echo "You are up to date"
    exit
fi

mkdir -p $TORFOLDER
cd $TORFOLDER &&\
echo "Attempting to download Tor Browser Bundle and signature"
TARGET=$DIR$LATESTTBB.asc
echo $TARGET
$DOWNLOADCMD $TARGET &&\
TARGET=$DIR$LATESTTBB
echo $TARGET
$DOWNLOADCMD $TARGET &&\
gpg --verify $LATESTTBB{.asc,} &&\
tar xvfz $LATESTTBB &&\
echo "Installation complete. Start with $TORFOLDER"
