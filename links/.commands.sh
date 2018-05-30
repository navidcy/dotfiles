#!/bin/bash


#### FUNCTIONS AND ALIASES


## cd

alias cg='c "$(git rev-parse --show-toplevel)"'  # cd under git repo
alias ch='cd "$(dirs -lp | sort -u | fzf)"'      # cd from history

# change to directory under pwd
c() {
    local dir
    dir=$(find "${1:-.}" -type d | grep -v '/\.' | fzf)

    [ -n "$dir" ] && cd "$dir" || return
}


## ls

if [[ "$(uname)" != 'Darwin' ]]; then
    alias ls='ls --color=auto -F'
else
    alias ls='ls -G -F'
fi
alias l='ls -alFh'
alias la='ls -A'


## Open files
if [ "$(uname)" != 'Darwin' ]; then
    open() { xdg-open "$@" &> /dev/null &disown; }
    say() { echo "$@" | festival --tts; }
fi


## editor

e() {
    if [ $# -eq 0 ]; then
        # open file under PWD
        local file
        file=$(find . -type f | grep -v '/\.' | fzf)
        [ -n "$file" ] && $EDITOR "$file"
    else
        $EDITOR "$@"
    fi
}

# edit file anywhere in git repository
eg() {
    # open file under PWD
    local file
    file=$(find "$(git rev-parse --show-toplevel)" -type f | grep -v '/\.' | fzf)
    [ -n "$file" ] && $EDITOR "$file"
}


alias vi='vim -u NONE'


## dotfiles

alias zshreload="source ~/.zshrc"
alias dotfiles-update="cd ~/code/dotfiles && git pull ; zshreload ; cd -"
alias dotfiles-commit="cd ~/code/dotfiles && git commit -a -S -v ; git push ; cd -"


## python

alias ipython-prof='ipython -m cProfile -s time'
alias python-prof='python -m cProfile -s time'



## make

alias m="make"
alias mc="make clean"
alias me="make edit"


## date

alias date-denmark='TZ=Europe/Copenhagen date'
alias date-eastern='TZ=US/Eastern date'
alias date-pacific='TZ=US/Pacific date'
alias date-mountain='TZ=US/Mountain date'
alias date-central='TZ=US/Central date'


## git

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

# redefine git log alias
alias gl="git log --graph --oneline --decorate --all --color=always |
    fzf --ansi +s --preview='git show --color=always {2}' \
    --bind='pgdn:preview-page-down' \
    --bind='pgup:preview-page-up' \
    --bind='enter:execute:git show --color=always {2} | less -R' \
    --bind='ctrl-x:execute:git checkout {2} .'"


## grep

alias grep='grep --color=auto'


## speech synthesis

sayfile() { festival --tts "$@"; }


## w3m

alias w3m="w3m -B"
w3mtor() { 
    local url
    if [ $# -eq 0 ]; then
        url="https://check.torproject.org/"
    else
        url=$1
    fi
    torify w3m "$url"
}

w3mddg() { torify surfraw ddg "$@"; }

news() { 
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
    torify w3m "$url"
}


## web services

alias youtube-dl='youtube-dl --format mp4'
weather() { curl "wttr.in/?m"; }
define() { curl --silent dict://dict.org/d:"$1"; }
transfer() { # use transfer.sh to share files over the net
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage: transfer.sh <file>"
        return 1
    fi
    tmpfile=$( mktemp -t transferXXX )
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" \
            >> "$tmpfile"
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" \
            >> "$tmpfile"
    fi
    cat "$tmpfile"
    rm -f "$tmpfile"
    echo ""
} 
