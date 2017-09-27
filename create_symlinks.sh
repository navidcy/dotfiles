#!/bin/bash

# Create folders
mkdir -p ~/bin
mkdir -p ~/.ipython/profile_default
mkdir -p ~/.mutt/cache
chmod 0700 ~/.mutt/cache

shopt -s dotglob
for f in *; do

  # Skip . and ..
  [ "$f" = "." ] && continue
  [ "$f" = ".." ] && continue

  # Skip shell scripts and markdown
  [ "${f##*.}" = "sh" ] && continue
  [ "${f##*.}" = "md" ] && continue

  # Do not symlink these files/directories
  [[ "$f" =~ tags|.git/|.DS_Store|bar|userChrome.css ]] && continue

  # .xinitrc doesn't work with XQuartz
  [[ "$(uname)" = "Darwin" && "$f" == ".xinitrc" ]] && continue

  SOURCE=$PWD/$f
  TARGET=~/$f

  # Skip symlink generation if the link already exists
  [ -L $TARGET ] && continue

  # Rename any original files or directories
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  [ -d $TARGET ] && mv $TARGET ${TARGET}_bck

  echo "Symlink: $SOURCE -> $TARGET"
  ln -s $SOURCE $TARGET
done
