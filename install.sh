#!/bin/sh
#set -e

# Create symlinks
./create_symlinks.sh

# Clone zsh syntax highlighting and git prompt
mkdir -p $HOME/code && cd $HOME/code && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/olivierverdier/zsh-git-prompt.git

cd ~/bin && curl -OL https://raw.github.com/richo/battery/master/bin/battery &&\
    chmod +x ~/bin/battery

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Python GDB configuration
curl -OL git.io/.gdbinit
