#!/bin/sh
color="#eebf36"
out=$(uptime|sed 's/.* //')
echo "$out | color=$color"
