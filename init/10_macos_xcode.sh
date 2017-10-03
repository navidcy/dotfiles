#!/usr/bin/env bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && return 1

# check if command line tools are installed
xcode-select --print-path >/dev/null 2>&1
xcodestatus=$?
gcc --version >/dev/null 2>&1
gccstatus=$?
if [[ $xcodestatus -ne 0 || $gccstatus -ne 0 ]]; then
    echo "xcode status: $xcodestatus, gcc status: $gccstatus"
    sudo xcode-select --install
fi
