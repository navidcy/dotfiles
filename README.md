# ATTENTION
This repository has moved to [gitlab.com/admesg/dotfiles](https://gitlab.com/admesg/dotfiles).

# dotfiles

Configuration files for zsh, vim, tmux, X, etc. Licensed under GPL v. 3.

After cloning the repository, create symbolic links to your home folder using:

    ./install.sh

This script will launch all scripts from the `init/` directory, and 
automatically skip the ones that aren't applicable to the host system.  This 
includes installation of a package manager ([Homebrew](https://brew.sh) for 
macOS) and package installation via `brew` or `apt` in the case of Debian 
GNU/Linux.  The script `init/10_symlinks.sh` will make symbolic links between 
everything in the `links/` folder and the home folder.  In the case of 
conflicts, existing files will be renamed with the suffix `_bck`.

## Author
Written by Anders Damsgaard.  The macOS script `init/10_macos.sh` is inspired 
by Mathias Bynen's 
[.macos](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) script, 
and folder structure and initialization is similar to Ben Alman's [dotfiles 
repository](https://github.com/cowboy/dotfiles).
