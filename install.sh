#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Clone zsh syntax highlighting
mkdir -p $HOME/code && cd $HOME/code && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
