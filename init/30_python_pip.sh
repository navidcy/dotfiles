#!/usr/bin/env bash

# pip packages
pkgs=(
    bs4
    gcalcli
    grepg
    haxor-news
    howdoi
    jupyter
    neovim
    numexpr
    pandas
    Pillow
    protobuf
    psutil
    requests
    scikit-learn
    sympy
    tensorflow
    virtualenv
)

for PIP in pip pip2 pip3; do
    if [[ "$(type -P $PIP)" ]]; then
        echo "## Installing $PIP packages"
        for pkg in "${pkgs[@]}"; do
            $PIP install $pkg
            [ "$pkg" == "gcalcli" ] && gcalcli list
        done
    else
        echo "## $PIP not installed"
    fi
done

# tensorflow in virtualenv
#if [[ "$(type -P python3)" ]]; then
#    targetdir=~/code/tensorflow
#    mkdir -p $targetdir
#    [ -d $targetdir/lib ] || \
#        virtualenv --system-site-packages -p python3 $targetdir
#    source $targetdir/bin/activate
#    pip3 install --upgrade tensorflow
#fi
