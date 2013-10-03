#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Clone oh-my-zsh
OMZDIR=~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $OMZDIR
wget https://cs.au.dk/\~adc/files_nonpub/ys-mod.zsh-theme -O $OMZDIR/themes/ys-mod.zsh-theme

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
