#!/bin/bash
set -e
sudo apt-get update

sudo apt-get install \
    autossh \
    bogofilter \
    build-essential \
    cmake \
    dunst \
    elinks \
    exuberant-ctags \
    ffmpeg \
    git \
    haskell-platform \
    hsetroot \
    htop \
    i3 \
    i3blocks \
    i3lock \
    imagemagick \
    imapfilter \
    ipython \
    latexmk \
    libnotify-bin \
    locate \
    mpc \
    mpd \
    mplayer \
    msmtp \
    msmtp-gnome \
    mutt \
    ncmpcpp \
    notmuch \
    notmuch-mutt \
    ntp \
    offlineimap \
    okular \
    paraview \
    pass \
    python-matplotlib \
    python-numpy \
    python-pip \
    python-scipy \
    redshift \
    ruby \
    rxvt-unicode-256color \
    screenfetch \
    scrot \
    sshfs \
    texlive \
    texlive-full \
    tig \
    tmux \
    tor \
    torbrowser-launcher \
    urlview \
    vim \
    vim-nox \
    w3m \
    xautolock \
    xbacklight \
    xbindkeys \
    youtube-dl
    zathura \
    zsh \


sudo gem install tmuxinator

# configure xdg-open with `mimeopen -d <file>`
# set zathura as default pdf viewer
xdg-mime default zathura.desktop application/pdf
xdg-mime default files.desktop inode/directory   # nautilus
xdg-mime default eog.desktop image/jpeg
xdg-mime default eog.desktop image/png
xdg-mime default eog.desktop image/gif
xdg-mime default eog.desktop image/bmp
