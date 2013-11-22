set nocompatible    " Disable vi-compatibility
filetype off

set rtp+=~/.vim/bundle/vundle " use Vundle plugin manager
call vundle#rc()

""" Vundle plugins 
" By default fom github.
" Install and update with :BundleInstall(!), see :h vundle

" let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" more functional statusline
Bundle 'Lokaltog/vim-powerline'

" successor to vim-powerline
"Bundle 'Lokaltog/powerline'

" file system browser
Bundle 'scrooloose/nerdtree'

" syntax checking plugin
Bundle 'scrooloose/syntastic'

" fuzzy file, buffer, and tag finder
Bundle 'kien/ctrlp.vim'

" solarized colorscheme
Bundle 'altercation/vim-colors-solarized'

" modify surrounding characters in pairs
Bundle 'tpope/vim-surround'

" git wrapper
Bundle 'tpope/vim-fugitive'

" browse buffers (vim.org/scripts), \be, \bs, \bv
Bundle 'bufexplorer.zip'

" Vim-LaTeX suite
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

" Use <Tab> to autocomplete in insert mode
Bundle 'ervandew/supertab'

" Ack is a grep replacement. Debian pkg: ack-grep. Run from Vim:
" usage: :Ack [options] {pattern} [{directory}]
Bundle 'mileszs/ack.vim'


filetype plugin indent on

" terminal colors
set t_Co=16

" Enable syntax highligting
syntax on

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
set background=dark " adjust colors for better contrast
"colorscheme desert
colorscheme solarized
call togglebg#map("<F3>")

" hilight column 80
set textwidth=80
set colorcolumn=+1

set autoindent
set autoread        " reload files when changed on disk
set backspace=2     " fix broken backspace in some setups
set backupcopy=yes  " see :help crontab
"set clipboard=unnamed " yank and paste with the system clipboard
set encoding=utf-8  " Necessary to show unicode glyphs
set expandtab       " convert tab char to spaces
set ignorecase      " case-insensitive search
set incsearch       " search as you type
set laststatus=2    " always show the statusline
set list            " enable rendering of invisible characters
set listchars=tab:▸\ ,eol:¬ " Use symbols for tab and end-of-line
set number          " set linenumbering ON as default
set pastetoggle=<F2> " toggle paste mode
set ruler           " Enable bottom ruler
set scrolloff=3     " show context above-below cursorline
set shiftwidth=4    " width for autoindents
"set showcmd
set smartcase       " case-sensitive search if any caps
set softtabstop=4   " makes the tab key indent by four spaces 
set tabstop=8       " a tab is 4 characters wide
set wildmenu        " show a navigable menu for tab completion
set wildmode=longest,list,full

" enable basic mouse behavior
set mouse=a
if exists('$TMUX')    " support resizing in tmux
  set ttymouse=xterm2
endif

" fix cursor in tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Dictionary word completion using Ctrl-x Ctrl-k
" File from wordlist- (debian) or word- (arch) package
set dictionary+=/usr/share/dict/words

" Vim Powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

" Define other file types
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda

" Invisible character colors
" chose ctermfg=10 if Tab and EOL characters should be brighter
" chose ctermfg=0 if Tab and EOL characters should be darker
highlight NonText ctermfg=10 guifg=DarkGray
highlight SpecialKey ctermfg=10 guifg=DarkGray


""" Keyboard shortcuts

" Shortcut to reload .vimrc
nmap <leader>r :source $MYVIMRC<CR>

" Shortcut to switch background color
nmap <leader>b :ToggleBG<CR>

" toggle spelling
nmap <leader>s :set spell!<CR>

" toggle line numbering
nmap <leader>n :set number!<CR>

" toggle relative line numbering
nmap <leader>m :set relativenumber!<CR>

" NERD Tree short cut
nmap <leader>d :NERDTreeToggle<CR>

" Toggle TAB and EOL symbols
nmap <leader>l :set list!<CR>

" Resize with <C-h>, <C-j>, <C-k> and <C-l>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
