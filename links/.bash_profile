#### LOCALE

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


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

#if [ -d $HOME/local/python ]; then
#    export PYTHONPATH=$HOME/local/python:$PYTHONPATH
#    export PATH=$HOME/local/python:$PATH
#fi

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
    [ $(echo $SHELL | grep zsh) ] && [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    [ $(echo $SHELL | grep bash) ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
    #module load git vim #python paraview ncview matlab ifort anaconda
    module load git python/2.7.1
    [ -d /net/and/anaconda3/bin ] && export PATH="/net/and/anaconda3/bin:$PATH"
    [ -d /work/and/anaconda3/bin ] && export PATH="/work/and/anaconda3/bin:$PATH"
fi
[ -f /etc/pki/tls/certs/ca-bundle.crt ] && export CURL_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

[ -d ~/code/basilisk/src ] && export BASILISK=~/code/basilisk/src
[ -d ~/code/basilisk/src ] && export PATH=~/code/basilisk/src:$PATH
