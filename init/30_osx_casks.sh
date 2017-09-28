#!/bin/bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && exit 1

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Homebrew failed to install." && return 1

# from `brew cask list`
casks=(
    adobe-reader
    alfred
    battle-net
    bitbar
    duet
    firefox
    julia
    karabiner
    mactex
    osxfuse
    processing
    smoothmouse
    skim
    skype
    steam
    sshfs
    terminal-notifier
    torbrowser
    transmission
    vlc
    w3m
    xquartz
)

read -p "Do you want to install brew casks? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for cask in "${casks[@]}"; do
        #read -p "Do you want to install $cask? [y/n] " -n 1 -r
        ##echo
        #if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew cask install $cask
        #fi
    done
fi
