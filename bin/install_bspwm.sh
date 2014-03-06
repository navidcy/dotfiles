#!/bin/sh

# Using the guide from
# https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies

# Debian dependencies
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev \
    libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev xfonts-terminus \
    hsetroot compton unclutter zathura conky

# Fonts: search for artwiz-aleczapka fonts, download from sourceforce.
# Extract fonts to /home/adc/.fonts
# Run `sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
# Clear the font cache:
# sudo fc-cache -f -v
# fc-cache -f -v

# Core folder
FOLDER=~/code

cd $FOLDER && \
git clone git@github.com:baskerville/bspwm.git && \
cd bspwm && make && sudo make install

cd $FOLDER && \
git clone git@github.com:baskerville/sxhkd.git && \
cd sxhkd && make && sudo make install

# Panel
cd $FOLDER && \
git clone git@github.com:baskerville/sutils.git && \
cd sutils && make && sudo make install

cd $FOLDER && \
git clone git@github.com:baskerville/xtitle.git && \
cd xtitle && make && sudo make install

cd $FOLDER && \
git clone git@github.com:LemonBoy/bar.git && \
cp ~/code/dotfiles/bar/config.h $FOLDER/bar/ &&
cd bar && make && sudo make install

# Panel configuration
# Execute the following as root:
# echo 'export PANEL_FIFO="/tmp/panel-fifo"' >> /etc/profile
# echo 'export PANEL_FIFO="/tmp/panel-fifo"' >> /etc/zsh/zprofile
