#!/bin/bash
#output=$(echo $1 | sed 's/\..*$/.mp4/')
output=${1%.*}.mp4

ffmpeg -i $1 \
    -acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 \
    $output

# constant bitrate:
#ffmpeg -i $1 -vcodec libx264 -crf 20 $output

echo $output

