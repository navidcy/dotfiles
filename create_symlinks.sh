#!/bin/sh

# Home folder dotfiles
for F in bashrc vimrc tmux.conf xpdfrc; do
  SOURCE=$PWD/$F
  TARGET=~/.$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done

# rc.lua
SOURCE=$PWD/rc.lua
TARGET=~/.config/awesome/rc.lua
[ -f $TARGET ] && mv $TARGET ${TARGET}_bck
echo "Symlink: $SOURCE -> $TARGET"
ln -s $SOURCE $TARGET

