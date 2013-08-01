#!/bin/sh

# Edit central todo-file by ssh and Vim.
# Requires vim 6.x or later

# Check Vim version
VIMVERS=`vim --version | head -n 1 | awk '{print $5 }'`
REQVIMVERS="6.0"

if [ `echo $VIMVERS'>='$REQVIMVERS | bc -l` -eq "1" ]; then
    vim scp://adc@susanoganders.dk:12344//home/adc/doc/todo.rst
else
    echo "The installed Vim version is too old ($VIMVERS). This script needs version $REQVIMVERS or later."
    exit 1;
fi
