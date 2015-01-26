#!/bin/bash
set -e
apt-get update

apt-get install vim tmux git zsh i3 exuberant-ctags haskell-platform \
    build-essential ruby mutt offlineimap msmtp autossh tor xbindkeys \
    xautolock pass urlview elinks redshift libnotify-bin owncloud-client \
    hsetroot xbacklight i3lock scrot imagemagick mpc htop \
    rxvt-unicode-256color texlive cmake sshfs paraview python-numpy \
    python-scipy python-matplotlib ipython

sudo gem install tmuxinator
