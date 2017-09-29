#!/usr/bin/env bash

# Clone zsh syntax highlighting and git prompt
(mkdir -p $HOME/code && cd $HOME/code &&
if [ ! -d zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi
if [ ! -d zsh-git-prompt ]; then
    git clone https://github.com/olivierverdier/zsh-git-prompt.git 
fi)
