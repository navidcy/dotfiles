# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
#ZSH_THEME="agnoster"
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# disable autocorrect
unsetopt correctall

# set vi-like movement
set -o vi
export EDITOR=vim

# Add local bin folder to path
export PATH=$HOME/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/code/metasploit:$PATH
export PATH=~/.gem/ruby/1.9.1/bin:$PATH
export PATH=~/code/julia:$PATH
export PATH=~/code/elmerfem/fem/src:$PATH

# CUDA 5.0 (installed with `sudo sh cuda_5.0.35_linux_64_ubuntu11.10-1.run -override`)
export PATH=/usr/local/cuda-5.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-5.0/lib64:/usr/local/cuda-5.0/lib:$LD_LIBRARY_PATH

alias l='ls -lh'
alias ll='ls -lha'
alias m='make'
alias mc='make clean'
alias zshreload='source ~/.zshrc'

# mark functionality
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# speech synth command
say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

# LPP (liggghts post-processing)
CFDEM_pizzaPath=/home/adc/code/liggghts/lpp-git
alias pizza='python -i $CFDEM_pizzaPath/src/pizza.py'

# ESYS-Particle
export PATH=/usr/local/bin/:$PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib/:$LIBRARY_PATH
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages/:$PYTHONPATH
export PYTHONPATH=/home/adc/code/esys-particle/own-modules/:$PYTHONPATH

# LMGC90v2
if [ -z ${PYTHONPATH} ]; then
  export PYTHONPATH=/home/adc/code/lmgc90/LMGC90v2/builds/Lmgc90_v2
  export PYTHONPATH=${PYTHONPATH}://home/adc/code/lmgc90/LMGC90v2/builds/Lmgc90_v2/lib
else
  export PYTHONPATH=${PYTHONPATH}://home/adc/code/lmgc90/LMGC90v2/builds/Lmgc90_v2
  export PYTHONPATH=${PYTHONPATH}://home/adc/code/lmgc90/LMGC90v2/builds/Lmgc90_v2/lib
fi
export PATH=${PATH}:/home/adc/code/lmgc90/LMGC90v2/src/LMGC90v2_dev/addons

# Set locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
