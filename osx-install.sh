#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap railwaycat/emacsmacport

# from `brew list`
brews=( "asciinema"\
    "aspell"\
    "autoconf"\
    "automake"\
    "autossh"\
    "caskroom/cask/brew-cask"\
    "cmake"\
    "emacs-mac --with-spacemacs-icon"\
    "ffmpeg"\
    "gdbm"\
    "gettext"\
    "git"\
    "gnu-getopt"\
    "gnupg"\
    "htop-osx"\
    "imagemagick"\
    "libav"\
    "libevent"\
    "lua"\
    "--HEAD neovim/neovim/neovim"\
    "nmap"\
    "homebrew/science/octave"\
    "openssl"\
    "pass"\
    "pcre"\
    "pkg-config"\
    "pwgen"\
    "reattach-to-user-namespace"\
    "tmux"\
    "the_silver_searcher"\
    "tig"\
    "tor"\
    "torsocks"\
    "tree"\
    "vim"\
    "vtk --with-tcl --with-qt --with-python --with-matplotlib --with-examples"\
    "watch"\
    "wget"\
    "youtube-dl"\
    "zsh" )

for brew in "${brews[@]}"; do
    brew install $brew
done

# from `brew cask list`
casks=("adobe-reader"\
    "alfred"\
    "amethyst"\
    "android-studio"\
    "battle-net"\
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
    "processing"\
    "smoothmouse"\
    "skim"\
    "skype"\
    "steam"\
    "sshfs"\
    "torbrowser"\
    "transmission"\
    "virtualbox"\
    "vlc"\
    "xquartz" )

read -p "Do you want to install brew casks? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for cask in "${casks[@]}"; do
        echo $cask
        brew cask install $cask
    done
fi

read -p "Do you want to clone terminal.app themes? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/tomislav/osx-terminal.app-colors-solarized \
        ~/code/dotfiles/osx-terminal.app-colors-solarized
fi

read -p "Do you want to create symlinks in the home folder? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
    ln -s ~/iCloud/articles ~/articles
    ln -s ~/iCloud/src ~/src
    ln -s ~/iCloud/doc ~/doc
    ln -s ~/doc/.password-store ~/.password-store
    ln -s ~/iCloud/uni ~/uni
    ln -s ~/iCloud/videos ~/videos
fi

mkdir -p ~/tmp
