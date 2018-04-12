#!/bin/sh
# where $1 is a webpage, e.g. https://adamsgaard.dk
wget --spider -e robots=off --wait 1 -r -p $1
