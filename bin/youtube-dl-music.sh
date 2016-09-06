#!/bin/bash
youtube-dl \
        --format bestaudio \
        --extract-audio \
        --audio-quality 0 \
        --audio-format mp3 \
        $1
