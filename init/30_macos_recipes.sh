#!/usr/bin/env bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && return 0

## Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Recipes need Homebrew to install." && return 1

# from `brew list`
brews=(
    abook
    asciinema
    aspell
    autoconf
    automake
    autossh
    c2048
    catimg
    cmake
    cpanminus
    ctags-exuberant
    exiftool
    ffmpeg
    fortune
    fzf
    gdbm
    gettext
    git
    gnu-getopt
    gnupg
    homebrew/science/paraview
    htop-osx
    highlight
    id3v2
    imagemagick
    imapfilter
    libevent
    lua
    mosh
    mpc
    mpd
    mpv
    msmtp
    mutt
    nmap
    notmuch
    offlineimap
    openssl
    pass
    pcre
    pkg-config
    pwgen
    qrencode
    reattach-to-user-namespace
    rename
    ripgrep
    sshfs
    surfraw
    tmux
    translate-shell
    tig
    tor
    torsocks
    tree
    urlview
    vim
    vimpc
    vitetris
    "vtk --with-tcl --with-qt --with-python --with-matplotlib --with-examples"
    w3m
    watch
    wget
    "wireshark --with-lua --with-qt5"
    youtube-dl
    zsh
)

for brew in "${brews[@]}"; do
    brew install $brew
done


# notmuch-mutt requirements
[[ ! "$(type -P cpanm)" ]] && echo "cpanm failed to install." && return 1
cpanm Digest::SHA\
    Mail::Box\
    Mail::Header\
    Mail::Box::Maildir\
    String::ShellQuote\
    Term::ReadLine::Gnu

# install fzf shell extensions
/usr/local/opt/fzf/install
