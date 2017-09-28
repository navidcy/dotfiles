#!/bin/sh

# Run initialization scripts
for s in init/*.sh; do
  bash $s;
done
