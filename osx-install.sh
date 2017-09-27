
#brew tap railwaycat/emacsmacport
brew tap d12frosted/emacs-plus

# launch and monitor services with `brew services list`, `brew services start 
# offlineimap`, etc.
# If "Operation not permitted" errors are encountered, try outside tmux
brew tap gapple/services
brew tap homebrew/games

# from `brew list`
brews=( \
    "abook"\
    "asciinema"\
    "aspell"\
    "autoconf"\
    "automake"\
    "autossh"\
    "c2048"\
    "caskroom/cask/brew-cask"\
    "catimg"\
    "cmake"\
    "ctags-exuberant"\
    "emacs-plus"\
    "exiftool"\
    "ffmpeg"\
    "fortune"\
    "fzf"\
    "gdbm"\
    "gettext"\
    "git"\
    "gnu-getopt"\
    "gnupg"\
    "homebrew/science/paraview"\
    "htop-osx"\
    "id3v2"\
    "imagemagick"\
    "imapfilter"\
    "libevent"\
    "lua"\
    "mobile-shell"\
    "mpc"\
    "mpd"\
    "mpv"\
    "msmtp"\
    "mutt"\
    "--HEAD neovim/neovim/neovim"\
    "nmap"\
    "notmuch"\
    "homebrew/binary/kwm"\
    "homebrew/science/octave"\
    "offlineimap"\
    "openssl"\
    "pass"\
    "pcre"\
    "pkg-config"\
    "pwgen"\
    "qrencode"\
    "reattach-to-user-namespace"\
    "ripgrep"\
    "surfraw"\
    "tmux"\
    "the_silver_searcher"\
    "translate-shell"\
    "tig"\
    "tor"\
    "torsocks"\
    "tree"\
    "urlview"\
    "vim"\
    "vimpc"\
    "vtk --with-tcl --with-qt --with-python --with-matplotlib --with-examples"\
    "w3m"\
    "watch"\
    "wget"\
    "wireshark --with-lua --with-qt5"\
    "youtube-dl"\
    "zsh"\
    "scons"\  # for dcp2icc
    "lcms"\  # for dcp2icc
    )

for brew in "${brews[@]}"; do
    brew install $brew
    if [[ "$brew" == "emacs-plus" ]]; then
        brew linkapps emacs-plus
    fi
done


read -p "Do you want to clone terminal.app themes? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/tomislav/osx-terminal.app-colors-solarized \
        ~/code/dotfiles/osx-terminal.app-colors-solarized
    wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors
    wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
fi

read -p "Do you want to create symlinks in the home folder? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
    ln -s ~/iCloud/articles ~/articles
    ln -s ~/iCloud/src ~/src
    ln -s ~/iCloud/doc ~/doc
    ln -s ~/doc/.password-store ~/.password-store
    ln -s ~/iCloud/uni ~/uni
    ln -s ~/iCloud/videos ~/videos
    ln -s ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents/ ~/iawriter
fi

mkdir -p ~/tmp

# notmuch-mutt requirements
brew install cpanminus
cpanm Digest::SHA\
    Mail::Box\
    Mail::Header\
    Mail::Box::Maildir\
    String::ShellQuote\
    Term::ReadLine::Gnu

# install fzf shell extensions
/usr/local/opt/fzf/install
