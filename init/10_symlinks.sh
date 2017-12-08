#!/usr/bin/env bash

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

  # Rename any original files or directories
  [ -f $TARGET ] && mv $TARGET ${TARGET}_bck
  [ -d $TARGET ] && mv $TARGET ${TARGET}_bck

  # Remove old symlinks
  [ -L $TARGET ] && rm $TARGET

  ln -sv $SOURCE $TARGET
done

# Create folders and non-symlink files
mkdir -p ~/.ipython/profile_default
mkdir -p ~/.mutt/cache
chmod 0700 ~/.mutt/cache
[ -f ~/.mutt/aliases ] || touch ~/.mutt/aliases
mkdir -p ~/tmp
mkdir -p $(kpsexpand '$TEXMFHOME')/bibtex/bib/myfiles/

# Symlink directories from iCloud drive to home
if [ "$(uname)" = "Darwin" ]; then
    ln -shvf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs \
        ~/iCloud
    ln -shvf ~/iCloud/articles ~/articles
    ln -shvf ~/iCloud/articles/own/BIBnew.bib \
        $(kpsexpand '$TEXMFHOME')/bibtex/bib/myfiles/BIB.bib
    ln -shvf ~/iCloud/src ~/src
    ln -shvf ~/iCloud/doc ~/doc
    ln -shvf ~/doc/.password-store ~/.password-store
    ln -shvf ~/iCloud/uni ~/uni
    ln -shvf ~/iCloud/videos ~/videos
    ln -shvf \
        ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents/ \
        ~/iawriter
    ln -shvf misc_code/firefox/userContent.css \
        ~/Library/Application\ Support/Firefox/Profiles/

    # XQuartz.app doesn't work with .xinitrc
    [ -L ~/.xinitrc ] && rm ~/.xinitrc
fi

