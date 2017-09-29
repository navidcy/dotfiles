#!/bin/bash
input=$(cat -)  # read stdin as a single line
echo $input
echo

# Work in progress.
# 
# This script should:
# - remove the word after year in the keyword
# - capitalize the keyword
# - put double brackets around the title string to preserve case
# - fix author firstnames to be initial(s) with spacing and dot(s) appended

output=$(echo $input |\
    sed -e 's/[a-z]*,/,/' |\  # Remove word after year in keyword
    )


echo $output
