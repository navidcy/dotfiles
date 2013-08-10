#!/bin/sh
for d in `ls -F | grep /`; do
    echo $d
    cd $d
    git pull
    cd ..
done
