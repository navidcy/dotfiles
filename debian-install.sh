#!/bin/bash
set -e
sudo apt-get update

sudo apt-get install vim tmux git zsh i3 exuberant-ctags haskell-platform \
    build-essential ruby mutt offlineimap msmtp msmtp-gnome autossh tor \
    xbindkeys xautolock pass urlview elinks redshift libnotify-bin \
    hsetroot xbacklight i3lock scrot imagemagick mpd ncmpcpp mpc htop \
    rxvt-unicode-256color texlive cmake sshfs paraview python-numpy \
    python-scipy python-matplotlib ipython mplayer zathura okular python-pip \
    dunst latexmk texlive-full screenfetch i3blocks torbrowser-launcher \
    vim-nox w3m imapfilter bogofilter tig ntp youtube-dl

sudo gem install tmuxinator

# configure xdg-open with `mimeopen -d <file>`
# set zathura as default pdf viewer
xdg-mime default zathura.desktop application/pdf
xdg-mime default files.desktop inode/directory   # nautilus
xdg-mime default eog.desktop image/jpeg
xdg-mime default eog.desktop image/png
xdg-mime default eog.desktop image/gif
xdg-mime default eog.desktop image/bmp
