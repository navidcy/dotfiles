#!/bin/bash
[[ ! "$(type -P pip)" ]] && echo "Pip needs to be installed." && exit 1

# pip packages
pips=(
    bs4
    gcalcli
    grepg
    requests
)

for pip in "${pip[@]}"; do
    pip install $pip
    if [ "$pip" == "gcalcli" ]; then gcalcli list; fi
done
