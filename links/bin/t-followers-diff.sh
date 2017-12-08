#!/bin/bash

# https://github.com/sferik/t

tmpfile=~/tmp/t-followers.txt
mv $tmpfile{,-old}

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#t followers -l | awk '{ print $13 }' > $tmpfile
t followers | \
    sed 's/ */ /' | sed 's/ *//g' \
    > $tmpfile

#echo -e "${RED}< unfollowed   ${GREEN}> new follower${NC}"
colordiff $tmpfile{-old,} | sed 's/ / https:\/\/twitter.com\//'
echo -e -n "From ${RED}$(wc -l $tmpfile-old | awk '{ print $1 }')${NC} "
echo -e "to ${GREEN}$(wc -l $tmpfile | awk '{ print $1 }')${NC} followers"
