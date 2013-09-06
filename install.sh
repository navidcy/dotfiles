#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Clone oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
