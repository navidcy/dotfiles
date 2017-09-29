#!/usr/bin/env bash

# Run initialization scripts
for s in init/*.sh; do
    echo -e "\n### $s ###########################"
    source $s
done
