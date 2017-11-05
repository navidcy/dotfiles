#!/usr/bin/env bash

# pip packages
pkgs=(
    bs4
    gcalcli
    grepg
    haxor-news
    neovim
    requests
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
