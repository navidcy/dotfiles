#!/usr/bin/env zsh
#### FUNCTIONS AND ALIASES

if [[ "$(uname)" != 'Darwin' ]]; then
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
function news { 
    local url
    if [ $# -eq 0 ]; then
        url="https://text.npr.org"
    elif [ "$1" = "npr" ]; then
        url="https://text.npr.org"
    elif [ "$1" = "cnn" ]; then
        url="https://lite.cnn.io/en"
    else
        url=$1
    fi
    torify w3m $url
}

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
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
    fi
    cat $tmpfile
    rm -f $tmpfile
    echo ""
} 

alias svim='sudo -e'
alias v='vim'
alias f='fg'
alias vi='vim -u NONE'
alias gs='git status | less'
alias gl='git log --graph --oneline --decorate --all'
alias ga='git add'
alias gd='git diff --'
alias gch='git diff HEAD^..HEAD'
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
alias date-denmark='TZ=Europe/Copenhagen date'
alias date-eastern='TZ=US/Eastern date'
alias date-pacific='TZ=US/Pacific date'
alias date-mountain='TZ=US/Mountain date'
alias date-central='TZ=US/Central date'
alias sha256sum='shasum -a 256'
alias cala="gcalcli agenda"
alias youtube-dl='youtube-dl --format mp4'
alias html="ansifilter -H -f"
alias w3m="w3m -B"

function cd() { [[ "$1" == "..." ]] && builtin cd ../.. || builtin cd $@; }

# enable color support of ls and also add handy aliases
if [[ "$(uname)" != 'Darwin' ]]; then
    alias ls='ls --color=auto -F'
else
    alias ls='ls -G -F'
fi
function chpwd() { ls }

alias grep='grep --color=auto'
