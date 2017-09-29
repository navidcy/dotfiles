#!/bin/bash
[[ "$(uname)" != "Linux" ]] && return 1
[[ "$(cat /etc/issue 2> /dev/null)" =~ Debian ]] || return 1

set -e

apt_packages=(
    autossh
    bogofilter
    build-essential
    cmake
    curl
    dict
    dict-gcide
    dictd
    dunst
    elinks
    exuberant-ctags
    ffmpeg
    git
    haskell-platform
    hsetroot
    htop
    i3
    i3blocks
    i3lock
    imagemagick
    imapfilter
    ipython
    latexmk
    libnotify-bin
    locate
    mpc
    mpd
    mpv
    msmtp
    msmtp-gnome
    mutt
    notmuch
    notmuch-mutt
    ntp
    offlineimap
    okular
    paraview
    pass
    python-ipdb
    python-matplotlib
    python-numpy
    python-pip
    python-scipy
    redshift 
    ruby
    rxvt-unicode-256color
    screenfetch
    scrot
    sshfs
    texlive
    texlive-full
    tig
    tmux
    tor
    urlview
    vim
    vim-nox
    w3m
    weechat
    weechat-plugins
    weechat-scripts
    wordnet
    xautolock
    xbacklight
    xbindkeys
    youtube-dl
    zathura
    zsh
)

#for package in "${apt_packages[@]}"; do
    #sudo apt -qq install "$package"
#done
sudo apt -qq install "${apt_packages[@]}"


# configure xdg-open with `mimeopen -d <file>`
# set zathura as default pdf viewer
xdg-mime default zathura.desktop application/pdf
xdg-mime default files.desktop inode/directory   # nautilus
xdg-mime default eog.desktop image/jpeg
xdg-mime default eog.desktop image/png
xdg-mime default eog.desktop image/gif
xdg-mime default eog.desktop image/bmp
