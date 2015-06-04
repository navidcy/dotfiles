#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap railwaycat/emacsmacport

# from `brew list`
brews=( "autoconf"\
    "automake"\
    "brew-cask"\
    "cmake"\
    "emacs-mac"\
    "gdbm"\
    "gettext"\
    "git"\
    "gnu-getopt"\
    "gnupg"\
    "htop-osx"\
    "libevent"\
    "lua"\
    "nmap"\
    "openssl"\
    "pass"\
    "pcre"\
    "pkg-config"\
    "pwgen"\
    "reattach-to-user-namespace"\
    "tmux"\
    "the_silver_searcher"\
    "tree"\
    "vim"\
    "watch"\
    "wget"\
    "youtube-dl"\
    "zsh" )

for brew in "${brews[@]}"; do
    brew install $brew
done

# install homebrew-cask
brew install caskroom/cask/brew-cask

# from `brew cask list`
casks=( "adobe-creative-cloud" \
    "adobe-reader"\
    "amethyst"\
    "battle-net"\
    "caffeine"\
    "disk-inventory-x"\
    "duet"\
    "firefox"\
    "flux"\
    "google-chrome"\
    "google-drive"\
    "google-hangouts"\
    "inkscape"\
    "iterm2"\
    "karabiner"\
    "libreoffice"\
    "mactex"\
    "menumeters"\
    "minecraft"\
    "osxfuse"\
    "paraview"\
    "skim"\
    "skype"\
    "steam"\
    "sshfs"\
    "torbrowser"\
    "transmission"\
    "virtualbox"\
    "vlc"\
    "xquartz" )

for cask in "${casks[@]}"; do
    echo $cask
    brew cask install $cask
done
