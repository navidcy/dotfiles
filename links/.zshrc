#### ZSH PERFORMANCE DEBUG
debug_startup=false
[ "$debug_startup" = true ] && zmodload zsh/zprof


#### ZSH OPTIONS

# man zshoptions
setopt append_history       # zsh sessions append their history to the hist file
setopt autocd               # cd into directory if called by name
setopt autopushd            # make cd push the old dir to the dir stack
setopt extendedglob         # globs (. is file, / is dir) see `man zshexpn`
setopt hist_ignore_dups     # ignore duplicate cmds in history
setopt interactivecomments  # allow in-line comments in prompt
setopt prompt_subst         # perform param exp, cmd subst, arith exp in prompt
setopt share_history        # import new commands from the history file
unsetopt beep               # beep on error
unsetopt hist_verify        # verify before executing cmd from history (e.g. !!)
unsetopt notify             # report status of bg jobs immediately
unsetopt nomatch            # show error if wildcards do not match any files

autoload -Uz add-zsh-hook cdr chpwd_recent_dirs compinit select-bracketed select-quoted

compinit
add-zsh-hook chpwd chpwd_recent_dirs

zstyle completion:*:*:cdr:*:* menu selection
zstyle :chpwd:* recent-dirs-insert fallback
zstyle :chpwd:* recent-dirs-pushd true

zle -N select-bracketed
zle -N select-quoted

HISTFILE=~/.zhistory
HISTSIZE=$((2 ** 16))
SAVEHIST=$((2 ** 17))


#### BINDINGS

set -o vi
bindkey -v
bindkey jk vi-cmd-mode
bindkey -a ? fzf-history-widget
bindkey -a k history-substring-search-up
bindkey -a j history-substring-search-down
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^ ' autosuggest-accept   # accept suggestion with ctrl+space

# use Ctrl-Z as fg
_foreground() {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N _foreground
bindkey '^Z' _foreground

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


for suffix in c cc cxx go graphql h html js json jsx md py rb rs ts tsx vim yml
do
    alias -s $suffix=$EDITOR
done

for suffix in txt log
do
    alias -s $suffix=$PAGER
done


#### ZSH APPEARANCE

# show execution time of previous command if more than 1 sec
convertsecs() {
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
preexec() {
    timer=${timer:-$SECONDS}
}
precmd() {
    if [ $timer ]; then
        timer_show=$(convertsecs $(($SECONDS - $timer)))
        export EXECTIME="${timer_show}"
        unset timer
    fi
}

git_branch() {
  branch_name=$(git symbolic-ref --short HEAD 2> /dev/null)

  if [ -n "$branch_name" ]
  then
    echo "$branch_name$(git_modified) "
  fi
}

git_grep_modified_files() {
  grep -e "^.M" -e "^M." -e "^A." -e "^D." -e "^.D"
}

git_modified() {
  if [ -n "$(git status --porcelain 2> /dev/null | git_grep_modified_files)" ]
  then
    echo "*"
  fi
}


prompt_with_vimode() {
    echo -ne '\n'
    echo -n '%(1j.%{$fg[yellow]%}%jbg %{$reset_color%}.)'  # background jobs
    echo -n "$1"
    [ "$1" == "" ] &&  # show prompt symbol if no insert/normal mode is passed
        echo -n '%(!.%{$fg_bold[red]%}#.%{$fg[green]%}$)%{$reset_color%}'
    echo -n '%{$reset_color%} '
}

insert_mode=''
normal_mode='%{$fg_bold[white]%}N'  # white and bold N

rprompt() {
    echo -n "%(?..%{$fg[red]%}[%?]%{$reset_color%})"  # return status
    echo -n "%{$fg[green]%}${EXECTIME}%{$reset_color%} "  # runtime of prev cmd
    echo -n "%B%{$fg[cyan]%}%~%{$reset_color%} "  # pwd
    echo -n "%{$fg[cyan]%}$(git_branch)%{$reset_color%}"  # git branch
    [ "$USER" != "ad" ] && echo -n "%n@"  #username
    echo -n "%m"  # hostname
}

PROMPT=$(prompt_with_vimode $insert_mode)
RPROMPT=$(rprompt)

function zle-line-init zle-keymap-select {
    PROMPT=$(prompt_with_vimode \
        ${${KEYMAP/vicmd/$normal_mode}/(main|viins)/$insert_mode})
    RPROMPT=$(rprompt)
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


#### PLUGINS

export ZPLUG_HOME=~/code/zplug
source $ZPLUG_HOME/init.zsh

zplug junegunn/fzf, use:shell/*.zsh
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions, lazy:true
zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-history-substring-search

if ! zplug check; then
  zplug install
fi
zplug load


#### EXTRA COMMANDS

# start ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent` && ssh-add
fi > /dev/null 2>&1

# pass **<tab>
_fzf_complete_pass() {
    _fzf_complete "--no-multi --preview-window=right:hidden" "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\/\(.*\)\.gpg/\1/'
    )
}

. ~/.commands.sh
. ~/.locale

if [[ -o interactive ]]; then
    function chpwd { ls }
fi

# report startup diagnostics if requested
[ "$debug_startup" = true ] && zprof || :
