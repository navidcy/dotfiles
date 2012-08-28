# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors ~/.dir_colors`
fi

# Useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls $LS_OPTIONS -hF'
alias c="clear"

# Set bash title for certain terminals
#echo -n -e "\033]0;`hostname`\007"

# Dircolors
export CLICOLOR=1

# Add path to my own custom executables:
export PATH=$HOME/bin:$PATH

export GNUTERM='X11'

export HISTTIMEFORMAT='%F %T '

export EDITOR=vim

if [ `hostname` == "adc-stationary" ]; then
  # Sort out OS X top
  alias top="top -o cpu"
  # Use GNU time
  alias time="gtime"
  # Homebrew
  export PATH=/usr/local/bin:$PATH
  export PATH=/usr/local/sbin:$PATH
  # Python
  export PATH=/usr/local/share/python:$PATH
  export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
  # CUDA 
  export PATH=/usr/local/cuda/bin:$PATH
  export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
  # Julia
  export PATH=/Users/adc/install/julia:$PATH
  # Growl
  growl() { echo -e $'\e]9;'${1}'\007' ; return ; }
fi

# Transparent xterm background
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID >/dev/null

complete -cf sudo

# Locales
export LANG=en_DK.UTF-8

# The ls command will sort dotfiles first, followed by uppercase and lowercase filenames
export LC_ALL=
export LC_COLLATE="C"

