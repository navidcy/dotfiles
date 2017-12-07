#!/bin/bash

output=${1%.*}.mp4

#ffmpeg -i $1 \
    #-crf 20 -vcodec libx264 -x264opts keyint=25 \
    #$output

# From media9 LaTeX package documentation.
# Generates sufficient keyframes to allow for precise seeking within video.
ffmpeg -i $1 \
    -vf scale="trunc(iw/2)*2:trunc(ih/2)*2" \
    -c:v libx264 -profile:v high -pix_fmt yuv420p \
    -g 30 -r 30 \
    $output

#ffmpeg -i movie.avi -sameq -vcodec libx264 -x264opts keyint=25 \
#-acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 \

# constant bitrate:
#ffmpeg -i $1 -vcodec libx264 -crf 20 $output

# Output first frame as an image
ffmpeg -i $1 -vframes 1 -f image2 ${output%.*}.png

# Output last frame as an image
#lastframe_index=$(ffprobe -show_streams "$1" 2> /dev/null | \
#    grep nb_frames | head -1 | cut -d \= -f 2)
#ffmpeg -i $1 -vf "select='eq(n,$lastframe_index)'" -vframes 1 -f image2 \
#    ${output%.*}-last.png

echo $output

