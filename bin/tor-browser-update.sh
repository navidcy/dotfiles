#!/bin/bash

# Gets latest Tor Browser Bundle (TBB) development version for Linux x86_64,
# downloads it, verifies it, and extracts it.
# The scripts downloads the files using "torify", if available.

# To import the signing key to Debian run:
# $ gpg --keyserver keys.gnupg.net --recv 886DDD89
# $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
# $ sudo apt-get update
# $ sudo apt-get install deb.torproject.org-keyring

# Folder where to download and extract the archives
TORFOLDER=~/tor

# Remote folder containing the TBB archives
UNAMESTR=`uname`
if [[ "$UNAMESTR" == 'Linux' ]]; then
    DIR="https://www.torproject.org/dist/torbrowser/linux/"
elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    DIR="https://www.torproject.org/dist/torbrowser/osx/"
else
    echo "Platform not supported"
    exit 1
fi

# Check if torify is installed
GETCMD="wget --no-verbose"
if command -v torify 2>/dev/null; then
    TORIFY="yes"
    DOWNLOADCMD="torify $GETCMD"
else
    DOWNLOADCMD=$GETCMD
fi

# Find latest TBB version
echo "Determining latest Tor Browser Bundle development version"
TMPFILENAME=.tordownloadpage.html
$DOWNLOADCMD https://www.torproject.org/projects/torbrowser.html.en#downloads -O $TMPFILENAME && \
LATESTTBB=`grep 'dev-en-US.tar.gz">64-bit' $TMPFILENAME | tail -n 1 | sed 's/.*tor-browser/tor-browser/' | sed 's/tar.gz.*/tar.gz/'` && \
echo "Latest Tor Browser Bundle dev. version is $LATESTTBB"
rm $TMPFILENAME

# Check if the TBB version is already downloaded
if [ -e $TORFOLDER/$LATESTTBB ]; then
    echo "The installed TBB version is up to date."
    exit
fi

# Download compressed file and signature, and verify
mkdir -p $TORFOLDER
cd $TORFOLDER &&\
echo "Attempting to download Tor Browser Bundle and signature"
TARGET=$DIR$LATESTTBB.asc
echo $TARGET
$DOWNLOADCMD $TARGET &&\
if [[ -z "$TORIFY" ]]; then
    $GETCMD $TARGET -O $TARGET.notor
fi
TARGET=$DIR$LATESTTBB
echo $TARGET
$DOWNLOADCMD $TARGET &&\
gpg --verify $LATESTTBB{.asc,} &&\
if [[ -z "$TORIFY" ]]; then
    gpg --verify $LATESTTBB{.asc.notor,}
fi

# Save the Tor data directory, if it exists
BACKUPDATA=0
DATAFOLDER=$TORFOLDER/tor-browser_en-US/Data/Tor
if [ -e $DATAFOLDER ]; then
    cp -r $DATAFOLDER $TORFOLDER/
    BACKUPDATA=1
fi

# Unpack the TBB
tar xvfz $LATESTTBB &&\
echo "Installation complete. Start with $TORFOLDER/tor-browser_en-US/start-tor-browser"

# Copy the old Data folder to the new TBB
if [ $BACKUPDATA == 1 ]; then
    mv $TORFOLDER/Tor $TORFOLDER/tor-browser_en-US/Data/
fi
cd -
