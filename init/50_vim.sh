#!/usr/bin/env bash

# Install vim-plug
[ ! -e ~/.vim/autoload/plug.vim ] && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -e ~/.local/share/nvim/site/autoload/plug.vim ] && \
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install and upgrade plugins
if [[ "$(type -P vim)" ]]; then
    vim +PlugUpgrade +PlugUpdate +qall
fi
