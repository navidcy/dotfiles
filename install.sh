#!/bin/sh

# Create symlinks
./create_symlinks.sh

# Run initialization scripts
for s in init/*.sh; do
  bash $s;
done
