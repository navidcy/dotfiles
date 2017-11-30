#!/bin/bash

# https://github.com/sferik/t

tmpfile=~/tmp/t-followers.txt
mv $tmpfile{,-old}

#t followers -l | awk '{ print $13 }' > $tmpfile
t followers | \
    sed 's/ */ /' | sed 's/ *//g' \
    > $tmpfile

echo "> = unfollowed   < = new follower"
diff $tmpfile{,-old}
echo "To $(wc -l $tmpfile | awk '{ print $1 }') from $(wc -l $tmpfile-old | awk '{ print $1 }') followers"
