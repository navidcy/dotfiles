#### ZSH PERFORMANCE DEBUG (enable all)
# setopt prompt_subst
# zmodload zsh/datetime
# PS4='+[$EPOCHREALTIME]%N:%i> '
# set -x
debug_startup=false
[ "$debug_startup" = true ] && zmodload zsh/zprof

#### GENERAL
export EDITOR="vim"

# Returns whether the given command is executable or aliased.
_has() {
  return $( (( $+commands[$1] )) )
}

[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f $HOME/.locale ] && $HOME/.locale

autoload -Uz compinit promptinit colors
compinit -d
promptinit
colors

set -o noclobber  # prevent overwriting files with > (override with 1>)
unset AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
setopt interactivecomments  # allow in-line comments in zsh prompt
export HISTFILE=~/.zsh-history
export HISTSIZE=$((2 ** 16))
export SAVEHIST=$((2 ** 17))


#### ZSH APPEARANCE

# show execution time of previous command if more than 1 sec
function convertsecs() {
    ((d=${1}/3600/24))
    ((h=${1}/3600%24))
    ((m=(${1}%3600)/60))
    ((s=${1}%60))
    if [ "$d" -gt "0" ]; then
        printf " %dd%02dh%02dm%02ds" $d $h $m $s
    elif [ "$h" -gt "0" ]; then
        printf " %dh%02dm%02ds" $h $m $s
    elif [ "$m" -gt "0" ]; then
        printf " %dm%02ds" $m $s
    elif [ "$s" -gt "0" ]; then
        printf " %ds" $s
    fi
}
function preexec() {
    timer=${timer:-$SECONDS}
}
function precmd() {
    if [ $timer ]; then
        timer_show=$(convertsecs $(($SECONDS - $timer)))
        export EXECTIME="${timer_show}"
        unset timer
    fi
}

function git_branch() {
    branch_name=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ -n "$branch_name" ]; then
        echo -n "$branch_name$(git_modified) "
    fi
}

function git_grep_modified_files() {
    grep -e "^.M" -e "^M." -e "^A." -e "^D." -e "^.D"
}

function git_modified() {
    if [ -n "$(git status --porcelain 2> /dev/null | git_grep_modified_files)" ]; then
        echo -n "*"
    fi
}

# check for background jobs
local bg_jobs="%(1j.%{$fg[yellow]%}%j%{$fg[blue]%}bg %{$reset_color%}.)"
local return_status="%(?..%{$fg[red]%}%?%{$reset_color%})"
local prompt_root="%(!.%{$fg_bold[red]%}#.%{$fg[green]%}$)%{$reset_color%}"

PROMPT="
${bg_jobs}%{$fg[red]%}${prompt_root} %{$reset_color%}"

RPROMPT="${return_status}\
${EXECTIME}\
%{$fg[green]%}${EXECTIME}%{$reset_color%} \
%B%{$fg[cyan]%}%~%{$reset_color%} \
%{$fg[cyan]%}$(git_branch)\
%{$reset_color%}%n@%m"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select


#### ZSH KEYBINDS

set -o vi
bindkey -v
bindkey jk vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# use Ctrl-Z as fg
_fzf-foreground () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N _fzf-foreground
bindkey '^Z' _fzf-foreground

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

# launch vim+fzf for recent files with Ctrl-o
_editor_fuzzy_history() {
    BUFFER="vim -c ':History'"
    zle accept-line
}
zle -N _editor_fuzzy_history
bindkey '^o' _editor_fuzzy_history

# launch vim+fzf+rg with Ctrl-g
_editor_fuzzy_grep() {
    BUFFER="vim -c ':Rg'"
    zle accept-line
}
zle -N _editor_fuzzy_grep
bindkey '^g' _editor_fuzzy_grep


#### FUNCTIONS AND ALIASES
source ~/.commands.sh

# open files with certain suffix in $EDITOR when calling their name
for suffix in c cc cxx go h html jl js json md py rb rst vim yml
do
  alias -s $suffix=$EDITOR
done

for suffix in txt log
do
  alias -s $suffix=$PAGER
done

#### ZSH PLUGINS

# zgen is faster than zplug
if [ -f ~/code/zgen/zgen.zsh ]; then
    source ~/code/zgen/zgen.zsh

    if ! zgen saved; then

        echo "Creating a zgen save"

        zgen load "junegunn/fzf"
        zgen load "zsh-users/zsh-autosuggestions"
        zgen load "zsh-users/zsh-completions"
        zgen load "zsh-users/zsh-syntax-highlighting"

        zgen save
    fi
fi


#### AUTOCOMPLETE

bindkey '^ ' autosuggest-accept   # accept suggestion with ctrl+space

if _has fzf; then
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
    # redefine git log alias
    alias gl="git log --graph --oneline --decorate --all --color=always |
        fzf --ansi +s --preview='git show --color=always {2}' \
        --bind='pgdn:preview-page-down' \
        --bind='pgup:preview-page-up' \
        --bind='enter:execute:git show --color=always {2} | less -R' \
        --bind='ctrl-x:execute:git checkout {2} .'"
fi

[ "$debug_startup" = true ] && zprof || :
