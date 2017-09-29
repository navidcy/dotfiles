#!/bin/sh

# Run initialization scripts
for s in init/*.sh; do
    echo "\n### $s ###########################"
    source $s
done
