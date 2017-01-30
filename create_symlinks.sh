#!/bin/bash

# Home folder dotfiles
for F in .bashrc .vimrc .inputrc .tmux.conf .xpdfrc .signature .Xresources \
    .Xmodmap .xinitrc .xprofile .zshrc .conkyrc .xbindkeysrc .gitconfig \
    .vimperatorrc .vimpcrc .compton.conf .locale .ctags .spacemacs \
    .juliarc.jl .mailcap .offlineimaprc .msmtprc .notmuch-config; do
  SOURCE=$PWD/$F
  TARGET=~/$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  rm $TARGET

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done

mkdir -p ~/.ipython/profile_default
# Home folder dotfolders
for F in .colors .config/uzbl .config/awesome .config/dwb .config/bspwm \
    .config/sxhkd .config/luakit .config/openbox .config/zathura .tmuxinator \
    .i3 .mutt .ncmpcpp .vim .vimperrator .w3m wallpapers .kwm .mpd \
    .imapfilter .weechat .ipython/profile_default/ipython_config.py; do
  SOURCE=$PWD/$F
  TARGET=~/$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  rm -rf $TARGET

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done

mkdir -p ~/bin
# Home folder bin directory
for F in `ls bin/`; do
  SOURCE=$PWD/bin/$F
  TARGET=~/bin/$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  rm -rf $TARGET

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done

# .xinitrc doesn't work with XQuartz
if [[ "$UNAMESTR" == 'Darwin' ]]; then
    rm ~/.xinitrc
fi

# Neovim configuration symlinks
cd $HOME
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
cd -

# Mutt cache folder
mkdir -p ~/.mutt/cache
chmod 0700 ~/.mutt/cache
