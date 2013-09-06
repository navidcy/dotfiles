#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Clone oh-my-zsh
./clone_oh_my_zsh.sh

# Clone mutt solarized color scheme
cd .mutt
git clone https://github.com/altercation/mutt-colors-solarized.git

# Clone or update Vim repositories (with Pathogen)
#cd .vim/bundle
#./clone-repos.sh
#./update-repos.sh

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
