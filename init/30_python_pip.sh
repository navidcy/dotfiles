#!/usr/bin/env bash
[[ ! "$(type -P pip)" ]] && echo "Pip needs to be installed." && return 1

# pip packages
pips=(
    bs4
    gcalcli
    grepg
    haxor-news
    requests
)

for pip in "${pip[@]}"; do
    pip install $pip
    if [ "$pip" == "gcalcli" ]; then gcalcli list; fi
done
