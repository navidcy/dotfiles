#!/usr/bin/env bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && return 0

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Homebrew failed to install." && return 1

# from `brew cask list`
casks=(
    adobe-acrobat-pro
    adobe-creative-cloud
    alfred
    battle-net
    bartender
    bitbar
    duet
    firefox
    julia
    karabiner
    mactex
    magicavoxel
    osxfuse
    processing
    signal
    skim
    skype
    steam
    torbrowser
    transmission
    vagrant
    vlc
    virtualbox
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
