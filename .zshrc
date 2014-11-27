source ~/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/code/zsh-git-prompt/zshrc.sh

ARCH=$(uname)

autoload -U compinit promptinit colors
compinit
promptinit
colors

PROMPT="
%{$fg[red]%} » %{$reset_color%}"
#PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT='
#%b$(git_super_status) %{$fg[red]%}»%{$reset_color%} '
RPROMPT='%B%{$fg[cyan]%}%~%{$reset_color%} $(git_super_status) %n@%m'

setopt AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward

if [[ "$ARCH" != 'Darwin' ]]; then
    function open() { xdg-open $1 &> /dev/null &disown; }
fi
function lt() { ls -ltrsa "$@" | tail; }
function lT() { ls -ltrsa "$@" | head; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function say() { echo "$@" | festival --tts; }
function sayfile() { festival --tts $@; }
function tnew { tmux new-session -As `basename $PWD` }

# Start tmux on shell login
#[[ -z "$TMUX" ]] && exec tmux

alias svim='sudoedit'
alias e='emacs -nw'
alias v='vim'
alias f='fg'
alias vi='vim -u NONE'
alias gs='git status'
alias gl='git log --oneline'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gpu='git pull'
alias gcgp='git commit && git push'
alias gcagp='git commit -a && git push'
alias clear='clear && tmux clear-history'
alias ct='ctags -R .'
alias findgrep='find . | grep -i '

alias zshreload="source ~/.zshrc"

alias m="make"
alias mc="make clean"
alias me="make edit"

#alias rm='rm -i'
alias rmi='rm -i'
#alias mv='mv -i'
alias c='xsel -ib'
alias h='history | tail'
alias hg='history | grep '
alias ch='chmod 755 '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ']'='open'
alias ll='ls -alFh'
alias la='ls -A'
alias lla='ls -lA'
alias l='ls -CF'
alias ipython-prof='ipython -m cProfile -s time'
alias python-prof='python -m cProfile -s time'
alias pipupgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'

# enable color support of ls and also add handy aliases
if [[ "$ARCH" != 'Darwin' ]]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

set -o noclobber
set -o vi

# MUTT BG fix
COLORFGBG="default;default"

pathdirs=(
    ~/scripts
)
for dir in $pathdirs; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done

export EDITOR="vim"
export XDG_CONFIG_HOME="/home/adc/.config"

# Environment variables
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

HOSTNAME=$(hostname)
if [[ "$HOSTNAME" == "iddqd" ]]; then

    # OpenFOAM from unofficial Ubuntu repositories
    #if [ -f /opt/openfoam222/etc/bashrc ]; then
    #    . /opt/openfoam222/etc/bashrc
    #fi

    # Manual OpenFOAM installation
    export FOAM_INST_DIR=$HOME/OpenFOAM
    #foamDotFile=$FOAM_INST_DIR/OpenFOAM-2.1.x/etc/bashrc
    foamDotFile=$FOAM_INST_DIR/OpenFOAM-2.2.x/etc/bashrc
    #[ -f $foamDotFile ] && . $foamDotFile

    # CFDEM vars
    export CFDEM_VERSION=PUBLIC
    export CFDEM_PROJECT_DIR=$HOME/CFDEM/CFDEMcoupling-$CFDEM_VERSION-$WM_PROJECT_VERSION
    export CFDEM_SRC_DIR=$CFDEM_PROJECT_DIR/src
    export CFDEM_SOLVER_DIR=$CFDEM_PROJECT_DIR/applications/solvers
    export CFDEM_DOC_DIR=$CFDEM_PROJECT_DIR/doc
    export CFDEM_UT_DIR=$CFDEM_PROJECT_DIR/applications/utilities
    export CFDEM_TUT_DIR=$CFDEM_PROJECT_DIR/tutorials
    export CFDEM_PROJECT_USER_DIR=$HOME/CFDEM/$LOGNAME-$CFDEM_VERSION-$WM_PROJECT_VERSION
    export CFDEM_bashrc=$CFDEM_SRC_DIR/lagrangian/cfdemParticle/etc/bashrc
    export CFDEM_LIGGGHTS_SRC_DIR=$HOME/LIGGGHTS/LIGGGHTS-PUBLIC/src
    export CFDEM_LIGGGHTS_MAKEFILE_NAME=fedora_fpic
    export CFDEM_LPP_DIR=$HOME/LIGGGHTS/mylpp/src
    #export CFDEM_PIZZA_DIR=$HOME/LIGGGHTS/PIZZA/gran_pizza_17Aug10/src
    export CFDEM_PIZZA_DIR=$CFDEM_LPP_DIR
    #. $CFDEM_bashrc

    alias lpp="python $CFDEM_LPP_DIR/lpp.py"
    alias pizza="python $CFDEM_LPP_DIR/pizza.py"

    # PETSc

    
fi

[ -f $HOME/code/julia/julia ] && export PATH=$HOME/code/julia:$PATH

[ -f $HOME/.locale ] && $HOME/.locale

source ~/.tmuxinator/tmuxinator.zsh
