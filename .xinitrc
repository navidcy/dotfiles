#!/bin/sh

# Set background color
xsetroot -solid '#101010' &

# Disable beeps
xset -b

# Keyboard layout
setxkbmap dk

# Read .xbindkeysrc for special key-bindings
xbindkeys

# Read .Xmodmap for modified keys
xmodmap ~/.Xmodmap

# Set display color profile
xcalib ~/doc/colorprofile.icc

# Make sure this is before the 'exec' command or it won't be executed.
[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

# screen powersave
xset +dpms # Energy Star features on
xset dpms 300 600 900 # standby -> suspend -> off (seconds)

# Set dim LCD brightness
#xbacklight -set 30 &

# Notification deamon
dunst &

# Automatically suspend system after 20 mins of inactivity
#xautolock -time 20 -locker "sudo pm-suspend" &

#DEFAULT_SESSION=awesome
DEFAULT_SESSION=i3
case $1 in
  awesome|i3|xmonad) exec $1 ;;
  *) exec $DEFAULT_SESSION ;;
esac
