#!/bin/sh

# Set background color
xsetroot -solid '#000000' &

# Disable beeps
xset -b

# Keyboard layout
#setxkbmap dk
setxkbmap us

# Read .xbindkeysrc for special key-bindings
xbindkeys

# Read .Xmodmap for modified keys
xmodmap ~/.Xmodmap

# Set display color profile
[ -f ~/doc/colorprofile.icc ] && xcalib ~/doc/colorprofile.icc 

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

# Disable touchpad when typing
syndaemon -t -k -i 2 -d &

# Automatically suspend system after 20 mins of inactivity
#xautolock -time 20 -locker "sudo pm-suspend" &
# Automatically lock the screen after 10 mins of inactivity
xautolock -time 10 -locker "i3lock -c 1d1f21" &

#DEFAULT_SESSION=awesome
DEFAULT_SESSION=i3
#DEFAULT_SESSION=enlightenment_start
case $1 in
  awesome|i3|enlightenment_start) exec $1 ;;
  *) exec $DEFAULT_SESSION ;;
esac

