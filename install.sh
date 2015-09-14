#!/bin/sh

# Create symlinks
mkdir -p ./.vim/bundle
./create_symlinks.sh

# Clone zsh syntax highlighting and git prompt
mkdir -p $HOME/code && cd $HOME/code && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/olivierverdier/zsh-git-prompt.git

# Install fonts
git clone https://github.com/phallus/fonts ~/code/phallus-fonts &&
    cd ~/code/phallus-fonts && ./install

mkdir -p ~/.vim/bundle

cd ~/bin && curl -OL https://raw.github.com/richo/battery/master/bin/battery &&\
    chmod +x ~/bin/battery

# Install Vundle
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install NeoBundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Install Spacemacs
git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d

# Install font
#cd /tmp &&\
#    wget http://susanoganders.dk/termsyn-1.8.7.tar.gz &&\
#    tar xvfz termsyn-*.tar.gz &&\
#    sudo mkdir -p /usr/share/fonts/local
#    sudo cp termsyn-*/*.pcf /usr/share/fonts/local/ &&\
#    sudo fc-cache -f &&\
#    sudo mkfontscale /usr/share/fonts/local/
#    sudo mkfontdir /usr/share/fonts/local/

# Install tmuxinator
sudo gem install tmuxinator

# Install Python GDB configuration
wget -P ~ git.io/.gdbinit
