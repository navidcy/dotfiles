#!/bin/bash
set -e


# pip packages
pips=( \
    "gcalcli"\
    "grepg"\
    )

for pip in "${pip[@]}"; do
    pip install $pip
    if [ "$pip" == "gcalcli" ]; then gcalcli list; fi
done
