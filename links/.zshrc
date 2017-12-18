#### GENERAL

ARCH=$(uname)

set -o noclobber  # prevent overwriting files with > (override with 1>)
set -o vi

export EDITOR="vim"

# Returns whether the given command is executable or aliased.
_has() {
  return $( (( $+commands[$1] )) )
}

[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f $HOME/.locale ] && $HOME/.locale

autoload -Uz compinit promptinit colors
compinit
promptinit
colors


#### ZSH APPEARANCE

# check for background jobs
local bg_jobs="%(1j.%{$fg[yellow]%}%j%{$fg[blue]%}bg %{$reset_color%}.)"
local return_status="%(?..%{$fg[red]%}%?%{$reset_color%})"
local prompt_root="%(!.%{$fg_bold[red]%}#.%{$fg[green]%}$)%{$reset_color%}"

PROMPT="
${bg_jobs}%{$fg[red]%}${prompt_root} %{$reset_color%}"
RPROMPT='${return_status} %B%{$fg[cyan]%}%~%{$reset_color%} $(git_super_status) %n@%m'

unset AUTO_CD
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


#### ZSH KEYBINDS

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

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

# launch $EDITOR with Ctrl-e
_editor() {
    BUFFER="$EDITOR"
    zle accept-line
}
zle -N _editor
bindkey '^e' _editor

# launch vim+fzf with Ctrl-f
_editor_fuzzy_find() {
    BUFFER="vim -c ':FZF'"
    zle accept-line
}
zle -N _editor_fuzzy_find
bindkey '^f' _editor_fuzzy_find

# launch vim+fzf+rg with Ctrl-g
_editor_fuzzy_grep() {
    BUFFER="vim -c ':Rg'"
    zle accept-line
}
zle -N _editor_fuzzy_grep
bindkey '^g' _editor_fuzzy_grep


#### FUNCTIONS AND ALIASES

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
function weather { curl 'wttr.in/?m'; }
function define { curl --silent dict://dict.org/d:$1 }

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

function transfer() { # use transfer.sh to share files over the net
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

alias svim='sudo -e'
#alias e='emacs -nw'
alias v='vim'
#alias v='nvim'
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
alias c='xsel -ib'
alias h='history | tail'
alias ']'='open'
alias l='ls -alFh'
alias la='ls -A'
alias lla='ls -lA'
alias ipython-prof='ipython -m cProfile -s time'
alias python-prof='python -m cProfile -s time'
alias pipupgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install -U'
alias denmark-date='TZ=Europe/Copenhagen date'
alias eastern-date='TZ=US/Eastern date'
alias pacific-date='TZ=US/Pacific date'
alias date-denmark='denmark-date'
alias date-eastern='eastern-date'
alias date-pacific='pacific-date'
alias sha256sum='shasum -a 256'
alias cala="gcalcli agenda"
_has exa && alias ls='exa --git'

# enable color support of ls and also add handy aliases
if [[ "$ARCH" != 'Darwin' ]]; then
    alias ls='ls --color=auto -F'
else
    alias ls='ls -G -F'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


#### AUTOCOMPLETE

# pass **<tab>
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
  )
}

#### PATH AND MACHINE SPECIFIC CONFIGS

[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:$PATH
[ -d $HOME/local/bin ] && export PATH=$HOME/local/bin:$PATH
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH
if [ -d $HOME/.linuxbrew ]; then
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
    export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH
fi
if [ -d /home/linuxbrew/.linuxbrew ]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
    export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH
fi

if [ -d $HOME/local/python ]; then
    export PYTHONPATH=$HOME/local/python:$PYTHONPATH
    export PATH=$HOME/local/python:$PATH
fi

if [ $(echo $HOSTNAME | grep flaptop) ]; then
    #source ~/.xsh
    #export PATH=~/miniconda3/bin:$PATH
    export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
fi

if [ $(echo $HOSTNAME | grep cosmo) ]; then
    export PATH=/usr/local/MATLAB/R2015a/bin:$PATH
fi

export GOPATH=$HOME/src/golang
export GPG_TTY=`tty`

[ -d $HOME/pism ] && export PATH=$HOME/pism/bin:$PATH
[ -d ~/code/issm/trunk ] && export ISSM_DIR=~/code/issm/trunk
[ -d ~/torch/install/bin ] && export PATH=~/torch/install/bin:$PATH
[ -d ~/code/tensorflow ] && alias tensorflow='source ~/code/tensorflow/bin/activate'

if _has fzf; then

    # trigger fzf completion by entering **<TAB> or <Pattern>**<TAB>
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS="
    --preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -100'
    "

    # fzf can be launched with ctrl-t or alt-c
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

    # use ripgrep if available
    if _has rg; then
        # --files: List files that would be searched but do not search
        # --no-ignore: Do not respect .gitignore, etc...
        # --hidden: Search hidden files and folders
        # --follow: Follow symlinks
        # --glob: (in this case ignore everything in the .git/ folder)
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*"'

    # use the_silver_searcher if available
    elif _has ag; then
        export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f --nocolor -g ""'
    fi
fi

if [ -f /usr/local/Modules/default/init/zsh ]; then
    source /usr/local/Modules/default/init/zsh && \
    #module load git vim #python paraview ncview matlab ifort
    module load git vim paraview ifort anaconda python/2.7.1
fi

[ -d ~/code/basilisk/src ] && export BASILISK=~/code/basilisk/src
[ -d ~/code/basilisk/src ] && export PATH=~/code/basilisk/src:$PATH

#### ZSH PLUGINS

[ -f ~/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    source ~/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/code/zsh-git-prompt/zshrc.sh ] && source ~/code/zsh-git-prompt/zshrc.sh

[ -f ~/code/fzf-mpd/fzf-mpd.zsh ] && source ~/code/fzf-mpd/fzf-mpd.zsh

if _has cabal && _has stack; then
    GIT_PROMPT_EXECUTABLE='haskell'
fi
ZSH_THEME_GIT_PROMPT_CACHE=true
