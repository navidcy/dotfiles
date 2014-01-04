#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Clone zsh syntax highlighting
mkdir -p $HOME/code && cd $HOME/code && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install fonts
git clone https://github.com/phallus/fonts ~/code/phallus-fonts &&
    cd ~/code/phallus-fonts && ./install

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
