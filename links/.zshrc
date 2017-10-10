source ~/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/code/zsh-git-prompt/zshrc.sh

if command -v cabal &>/dev/null; then
    if command -v stack &>/dev/null; then
        GIT_PROMPT_EXECUTABLE='haskell'
    fi
fi
ZSH_THEME_GIT_PROMPT_CACHE=true

ARCH=$(uname)

autoload -U compinit promptinit colors
compinit
promptinit
colors

# check for background jobs
local bg_jobs="%(1j.%{$fg[yellow]%}%j%{$fg[blue]%}bg %{$reset_color%}.)"
local return_status="%(?..%{$fg[red]%}%?%{$reset_color%})"
local prompt_root="%(!.%{$fg_bold[red]%}#.%{$fg[green]%}$)%{$reset_color%}"

PROMPT="
${bg_jobs}%{$fg[red]%}${prompt_root} %{$reset_color%}"
#PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT='
#%b$(git_super_status) %{$fg[red]%}»%{$reset_color%} '
RPROMPT='${return_status} %B%{$fg[cyan]%}%~%{$reset_color%} $(git_super_status) %n@%m'

unset AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=10000
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
    function say() { echo "$@" | festival --tts; }
fi
function lt() { ls -ltrsa "$@" | tail -n $(( $LINES - 10 )); }
function lT() { ls -ltsa "$@" | tail -n $(( $LINES - 10 )); }
function lz() { ls -laShr "$@" | tail -n $(( $LINES - 10 )); }
function lZ() { ls -laSh "$@" | tail -n $(( $LINES - 10 )); }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function cgrep() { egrep --color -i "$@|$"; }
function fname() { find . -iname "*$@*"; }
function sayfile() { festival --tts $@; }
function tnew { tmux new-session -As `basename $PWD` }
function w3mtor { 
    local url
    if [ $# -eq 0 ]; then
        url="https://check.torproject.org/"
    else
        url=$1
    fi
    torify w3m $url
}
function w3mddg { torify surfraw ddg $@ }
#function weather { curl wttr.in/SanDiego; }
function weather { curl 'wttr.in/?m'; }

# Start tmux on shell login
#[[ -z "$TMUX" ]] && exec tmux

# Start emacs daemon if it is not running, then attach client
function e () {
    if [ ! $(pgrep emacs --daemon) ]; then
        echo starting emacs daemon
        emacsdaemonlog=~/.emacs-daemon.log
        [ -f ~/.emacs-daemon.log ] && rm $emacsdaemonlog # delete old logfile
        emacs --daemon > $emacsdaemonlog 2>&1
    fi
    emacsclient -t
}

alias svim='sudo -e'
#alias e='emacs -nw'
#alias v='vim'
alias v='nvim'
alias f='fg'
alias vi='vim -u NONE'
#alias vi='nvim -u NONE'
alias gs='git status | less'
alias gl='git log --graph --oneline --decorate --all'
alias ga='git add'
alias gd='git diff --'
alias gc='git commit --verbose --gpg-sign'
alias gca='git commit --all --verbose --gpg-sign'
alias gp='git push'
alias gpu='git pull'
alias gcgp='git commit --verbose --gpg-sign && git push'
alias gcagp='git commit --all --verbose --gpg-sign && git push'
alias clear='clear && tmux clear-history'
alias ct='ctags -R .'
alias findgrep='find . | grep -i '
alias lsgrep='ls -la | grep -in '
alias fixdisplay='export DISPLAY=:0'

alias zshreload="source ~/.zshrc"
alias dotfiles-update="cd ~/code/dotfiles && git pull ; zshreload ; cd -"
alias dotfiles-commit="cd ~/code/dotfiles && git commit -a -S -v ; git push ; cd -"

alias m="make"
alias mc="make clean"
alias me="make edit"

alias 2048='2048 bluered'

#alias rm='rm -i'
alias rmi='rm -i'
#alias mv='mv -i'
alias c='xsel -ib'
alias h='history | tail'
alias ch='chmod 755 '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ']'='open'
#alias ll='ls -alFh'
alias l='ls -alFh'
alias la='ls -A'
alias lla='ls -lA'
#alias l='ls -CF'
alias ipython-prof='ipython -m cProfile -s time'
alias python-prof='python -m cProfile -s time'
alias pipupgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install -U'
alias denmark-date='TZ=Europe/Copenhagen date'
alias eastern-date='TZ=US/Eastern date'
alias pacific-date='TZ=US/Pacific date'
alias date-denmark='denmark-date'
alias date-eastern='eastern-date'
alias date-pacific='pacific-date'
function define() { curl --silent dict://dict.org/d:$1 }

# use transfer.sh to share files over the net
function transfer() {
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
    tmpfile=$( mktemp -t transferXXX )
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
    fi
    cat $tmpfile
    rm -f $tmpfile
    echo ""
} 


# enable color support of ls and also add handy aliases
if [[ "$ARCH" != 'Darwin' ]]; then
    alias ls='ls --color=auto -F'
else
    alias ls='ls -G -F'
fi
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f /usr/local/Modules/default/init/zsh ]; then
    source /usr/local/Modules/default/init/zsh && \
    #module load git vim #python paraview ncview matlab ifort
    module load git vim paraview ifort anaconda python/2.7.1
fi

# use Ctrl-Z as fg
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

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
#export XDG_CONFIG_HOME="/home/ad/.config"

# Environment variables
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
if [ -d $HOME/.linuxbrew ]; then
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
    export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH
fi

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
fi

[ -f $HOME/code/julia/julia ] && export PATH=$HOME/code/julia:$PATH
[ -d $HOME/local/bin ] && export PATH=$HOME/local/bin:$PATH
if [ -d $HOME/local/python ]; then
    export PYTHONPATH=$HOME/local/python:$PYTHONPATH
    export PATH=$HOME/local/python:$PATH
fi

[ -f $HOME/.locale ] && $HOME/.locale

source ~/.tmuxinator/tmuxinator.zsh

if [ $(echo $HOSTNAME | grep flaptop) ]; then
    #source ~/.xsh
    #export PATH=~/miniconda3/bin:$PATH
    export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
fi

if [ $(echo $HOSTNAME | grep cosmo) ]; then
    export PATH=/usr/local/MATLAB/R2015a/bin:$PATH
fi

# Added by termtile (https://github.com/apaszke/termtile)
alias kl='osascript ~/.termtile/tile.scpt up left'
alias kh='osascript ~/.termtile/tile.scpt up right'
alias jh='osascript ~/.termtile/tile.scpt down left'
alias jl='osascript ~/.termtile/tile.scpt down right'
alias hh='osascript ~/.termtile/tile.scpt left'
alias ll='osascript ~/.termtile/tile.scpt right'
alias kk='osascript ~/.termtile/tile.scpt up'
alias jj='osascript ~/.termtile/tile.scpt down'
alias big='osascript ~/.termtile/resize.scpt '
alias cen='osascript ~/.termtile/center.scpt '
alias sha256sum='shasum -a 256'

# calendar aliases
alias cala="gcalcli agenda"

[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -d /home/ad/pism ] && export PATH=/home/ad/pism/bin:$PATH
[ -d ~/code/issm/trunk ] && export ISSM_DIR=~/code/issm/trunk
[ -f ~/torch ] && source ~/torch/install/bin/torch-activate
export GOPATH=$HOME/src/golang

export GPG_TTY=`tty`

# trigger fzf completion by entering **<TAB> or <Pattern>**<TAB>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -100'"

[ -d ~/code/tensorflow ] && alias tensorflow='source ~/code/tensorflow/bin/activate'
