#!/bin/bash

# Create folders
mkdir -p ~/bin
mkdir -p ~/.ipython/profile_default
mkdir -p ~/.mutt/cache
chmod 0700 ~/.mutt/cache

# Symlink directories from iCloud drive to home
if [ "$(uname)" = "Darwin" ]; then
    ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
    ln -s ~/iCloud/articles ~/articles
    ln -s ~/iCloud/src ~/src
    ln -s ~/iCloud/doc ~/doc
    ln -s ~/doc/.password-store ~/.password-store
    ln -s ~/iCloud/uni ~/uni
    ln -s ~/iCloud/videos ~/videos
    ln -s ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents/ ~/iawriter
fi

shopt -s dotglob
for f in links/*; do

  # Skip . and ..
  [ "$f" = "." ] && continue
  [ "$f" = ".." ] && continue

  # Skip shell scripts and markdown
  [ "${f##*.}" = "sh" ] && continue
  [ "${f##*.}" = "md" ] && continue

  # Do not symlink these files/directories
  [[ "$f" =~ tags|.git/|.DS_Store|bar/|userChrome.css|init/ ]] && continue

  # .xinitrc doesn't work with XQuartz
  [[ "$(uname)" = "Darwin" && "$f" == ".xinitrc" ]] && continue

  SOURCE=$PWD/$f
  TARGET=~/$(basename $f)

  # Skip symlink generation if the link already exists
  [ -L $TARGET ] && continue

  # Rename any original files or directories
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  [ -d $TARGET ] && mv $TARGET ${TARGET}_bck

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done
