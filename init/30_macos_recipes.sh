#!/usr/bin/env bash

# OSX-stuff only
[[ "$(uname)" != "Darwin" ]] && return 0

## Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && echo "Recipes need Homebrew to install." && return 1

# from `brew list`
brews=(
    abook       # manage email aliases
    aria2       # download with resume
    asciinema   # save and upload recordings of terminal
    asciinema2gif # convert asciinema recordings to gif
    aspell      # spell checking for vim
    autoconf
    automake
    bench       # benchmark cmdline commands with multiple runs and stats
    c2048       # start with `2048`
    catimg      # convert image to ASCII in terminal
    cmake
    colordiff   # diff with colorized output
    cpanminus   # required for notmuch CPAN packages
    ctags-exuberant
    exiftool    # used to manage RAW metadata
    ffmpeg
    fortune
    fzf         # fuzzy file finder
    git
    gnupg
    homebrew/science/paraview
    homebrew/science/matplotlib
    htop-osx
    highlight   # used for syntax highligting in fzf
    id3v2       # mp3 metadata management
    imagemagick
    imapfilter
    lua
    mdp         # markdown presentations
    mosh        # persistent SSH
    mpc         # command-line control over mpd
    mpd         # music player daemon
    mpv         # media player
    msmtp       # used to deliver mails
    mutt
    nmap
    neovim
    notmuch
    numpy
    nyancat
    offlineimap
    openssl
    pass
    pcre
    pkg-config
    proxychains-ng  # torify alternative?
    pwgen
    qrencode    # generate QR codes from command line
    reattach-to-user-namespace  # needed for tmux
    rename      # rename many files with convenient syntax
    ripgrep     # a faster grep
    ssh-copy-id # add public key to a remote's authorized_keys file
    sshfs
    subliminal  # search and download subtitles
    surfraw     # cmd-line interface to search engines (`sr` alias)
    the_silver_searcher  # ag
    tmux
    translate-shell  # provides `trans` interface to google translate
    tig         # git history
    tor
    torsocks
    tree
    urlview
    vim
    vimpc
    vitetris    # command line tetris
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
