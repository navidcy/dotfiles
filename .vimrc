" Include pathogen plugin manager
filetype on
filetype off
set t_Co=16 " for solarized theme
execute pathogen#infect()
filetype plugin indent on

" Disable vi-compatibility
set nocompatible

" Enable syntax highligting
syntax on

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
set background=dark " adjust colors for better contrast
"colorscheme desert
colorscheme solarized

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
set showcmd
set smartcase       " case0sensitive search if any caps
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


""" Keyboard shortcuts

" Resize with <C-h>, <C-j>, <C-k> and <C-l>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut to reload .vimrc
nmap <leader>r :source $MYVIMRC<CR>

" toggle spelling
nmap <leader>s :set spell!<CR>

" toggle line numbering
nmap <leader>n :set number!<CR>

" NERD Tree short cut
nmap <leader>d :NERDTreeToggle<CR>

" Toggle TAB and EOL symbols
nmap <leader>l :set list!<CR>

""" Latex-Suite
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
""" Latex-Suite end

" Spell check in mutt
:autocmd FileType mail :nmap <F6> :w<CR>:!aspell -e -c %<CR>:e<CR>

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

"Invisible character colors
highlight NonText ctermfg=8 guifg=DarkGray
highlight SpecialKey ctermfg=8 guifg=DarkGray

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
