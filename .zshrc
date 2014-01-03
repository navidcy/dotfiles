source /home/adc/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit promptinit colors
compinit
promptinit
colors

PROMPT="
%{$fg[red]%} »  %{$reset_color%}"
RPROMPT="%B%{$fg[cyan]%}%~%{$reset_color%}"

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

plugins=(git)

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward

function open() { xdg-open $1 &> /dev/null &disown; }
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }

alias svim='sudoedit'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gcgp='git commit && git push'
alias gcagp='git commit -a && git push'

alias alsamixer="alsamixer -g"
alias equalizer="alsamixer -D equal"

alias zshreload="source ~/.zshrc"

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
alias ll='ls -alF'
alias la='ls -A'
alias lla='ls -lA'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
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
export PATH=/home/adc/bin:$PATH
