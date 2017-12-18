#!/bin/bash

# https://github.com/sferik/t

# test if t is available and working correctly
t help >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "t not working. Trying to (re)install ruby and gems"

    rm -rf /usr/local/lib/ruby/gems/
    brew uninstall ruby --ignore-dependencies
    brew install ruby
    brew link --overwrite ruby

    command -v gem >/dev/null 2>&1 || \
        { (>&2 echo "ERROR: gem command not available. Bye."); exit 1; }

    gem update
    gem install t

    t help >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        (>&2 echo "ERROR: t still not working. Bye.")
        exit 1
    fi
fi

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
nold="$(wc -l $tmpfile-old | awk '{ print $1 }')"
nnew="$(wc -l $tmpfile | awk '{ print $1 }')"
if [ "$nold" -eq "$nnew" ]; then
    echo -e "No change in followers (${GREEN}$nnew${NC})"
else
    echo -e "From ${RED}$nold${NC} to ${GREEN}$nnew${NC} followers"
fi
