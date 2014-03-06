#!/bin/sh

# Create symlinks
mkdir -p ./.vim/bundle
./create_symlinks.sh

# Clone zsh syntax highlighting
mkdir -p $HOME/code && cd $HOME/code && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install fonts
git clone https://github.com/phallus/fonts ~/code/phallus-fonts &&
    cd ~/code/phallus-fonts && ./install

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install font
cd /tmp &&\
    wget http://susanoganders.dk/termsyn-1.8.7.tar.gz &&\
    tar xvfz termsyn-*.tar.gz &&\
    sudo cp termsyn-*/*.pcf /usr/share/fonts/ &&\
    sudo fc-cache -f &&\
    sudo mkfontscale /usr/share/fonts/
    sudo mkfontdir /usr/share/fonts/
