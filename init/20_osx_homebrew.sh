#!/usr/bin/env bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && return 0

[[ "$(type -P brew)" ]] && echo "Homebrew already installed." && return 0

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Homebrew failed to install." && return 1
