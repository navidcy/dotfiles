#!/bin/sh

# Set background color
xsetroot -solid '#222222' &

# Disable beeps
xset -b

# Keyboard layout with caps as ctrl
#setxkbmap dk
#setxkbmap us -option ctrl:nocaps
setxkbmap dvorak -option ctrl:nocaps

# Read .xbindkeysrc for special key-bindings
xbindkeys

# Set display color profile
[ -f ~/doc/colorprofile.icc ] && xcalib ~/doc/colorprofile.icc 

# Make sure this is before the 'exec' command or it won't be executed.
[ -f ~/.xprofile ] && . ~/.xprofile
xrdb ~/.Xresources

# screen powersave
xset +dpms # Energy Star features on
xset dpms 300 600 900 # standby -> suspend -> off (seconds)

# mouse acceleration (xset m <acceleration> <threshold>)
xset m 3/2 4
#xset m 2/1 4

# Set dim LCD brightness
#xbacklight -set 30 &

# Load local fonts
xset +fp ~/.fonts
xset fp rehash
fc-cache
fc-cache -fv

# Notification deamon
dunst &

# Bluetooth applet
#blueman-applet &

#gnome-settings-daemon &      # handles themes, starts gnome-screensaver. You may have to use gconf to disable it setting the background.
#nm-applet &                  # assuming you're using Network Manager
#pidgin &                     # if you're using pidgin. You can really put any programs here.
#gnome-power-manager &        # for laptops and stuff
#gnome-volume-manager &       # for mounting CDs, USB sticks, and such
#eval `gnome-keyring-daemon`  # SSH/GPG agent

owncloud &
dropbox start &


# Disable touchpad when typing
#syndaemon -t -k -i 2 -d &

# Enable tap-to-click on touchpad
synclient TapButton1=1 TapButton2=2 TapButton3=3

# Automatically suspend system after 20 mins of inactivity
#xautolock -time 20 -locker "sudo pm-suspend" &
# Automatically lock the screen after 10 mins of inactivity
xautolock -time 10 -locker "i3lock -c 1d1f21" &

# Read .Xmodmap for modified keys
setxkbmap -option ctrl:nocaps
xmodmap ~/.Xmodmap

exec i3
