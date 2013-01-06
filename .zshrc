# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Set vi-like movement on cmd lines
#bindkey -v
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adc/.zshrc'

# Enable autocompletion
autoload -Uz compinit
compinit

# End of lines added by compinstall

# Make default promt use theme
autoload -U promptinit
promptinit
prompt adam2

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# path
export PATH=~/bin:$PATH
export PATH=~/code/metasploit:$PATH
export PATH=~/.gem/ruby/1.9.1/bin:$PATH

