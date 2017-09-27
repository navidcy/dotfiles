#!/bin/sh

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && exit 1

if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
    sudo xcode-select -switch /usr/bin
fi
