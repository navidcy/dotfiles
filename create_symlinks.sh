#!/bin/sh

# Home folder dotfiles
for F in .bashrc .vimrc .tmux.conf .xpdfrc .signature .Xdefaults .Xmodmap .xinitrc .xprofile .zshrc .conkyrc; do
  SOURCE=$PWD/$F
  TARGET=~/$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  rm $TARGET

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done

# Home folder dotfolders
for F in .config/uzbl .config/awesome .config/luakit .i3 .mutt .vim; do
  SOURCE=$PWD/$F
  TARGET=~/$F

  # Check if file exists, rename if so
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  rm -rf $TARGET

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done


