#!/usr/bin/env bash

# zsh plugin manager
(mkdir -p ~/code && cd ~/code &&
    if [ ! -d zplug ]; then
        git clone https://github.com/zplug/zplug
    fi
)
