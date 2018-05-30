export EDITOR="vim"
#### LOCALE

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# shellcheck source=/dev/null
[ -f ~/.secret_env_vars ] && . ~/.secret_env_vars


#### PATH AND MACHINE SPECIFIC CONFIGS

[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:$PATH
[ -d ~/local/bin ] && export PATH=~/local/bin:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH
if [ -d ~/.linuxbrew ]; then
    export PATH=~/.linuxbrew/bin:$PATH
    export MANPATH=~/.linuxbrew/share/man:$MANPATH
    export INFOPATH=~/.linuxbrew/share/info:$INFOPATH
fi
if [ -d /home/linuxbrew/.linuxbrew ]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
    export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH
fi

export GOPATH=~/src/golang
export PATH=$PATH:$GOPATH/bin
GPG_TTY=$(tty)
export GPG_TTY

[ -d ~/pism ] && export PATH=~/pism/bin:$PATH
[ -d ~/code/issm/trunk ] && export ISSM_DIR=~/code/issm/trunk
[ -d ~/torch/install/bin ] && export PATH=~/torch/install/bin:$PATH
[ -d ~/code/tensorflow ] && alias tensorflow='source ~/code/tensorflow/bin/activate'

if [ -x "$(command -v fzf)" ]; then

    export FZF_DEFAULT_OPTS="
    --preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -100'
    "

    # fzf can be launched with ctrl-t or alt-c
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

    # use ripgrep if available
    if [ -x "$(command -v rg)" ]; then
        # --files: List files that would be searched but do not search
        # --no-ignore: Do not respect .gitignore, etc...
        # --hidden: Search hidden files and folders
        # --follow: Follow symlinks
        # --glob: (in this case ignore everything in the .git/ folder)
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*"'

    # use the_silver_searcher if available
    elif [ -x "$(command -v ag)" ]; then
        export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f --nocolor -g ""'
    fi
fi

if [ -f /usr/local/Modules/default/init/zsh ]; then
    # shellcheck disable=SC1091
    . /usr/local/Modules/default/init/zsh && \
    #module load git vim #python paraview ncview matlab ifort anaconda
    module load git python/2.7.1
    [ -d /net/and/anaconda3/bin ] && export PATH="/net/and/anaconda3/bin:$PATH"
    [ -d /work/and/anaconda3/bin ] && export PATH="/work/and/anaconda3/bin:$PATH"
fi
[ -f /etc/pki/tls/certs/ca-bundle.crt ] && export CURL_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

[ -d ~/code/basilisk/src ] && export BASILISK=~/code/basilisk/src
[ -d ~/code/basilisk/src ] && export PATH=~/code/basilisk/src:$PATH
