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
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'

" successor to vim-powerline
"Bundle 'Lokaltog/powerline'

" file system browser
Bundle 'scrooloose/nerdtree'

" syntax checking plugin
Bundle 'scrooloose/syntastic'

" fuzzy file, buffer, and tag finder
Bundle 'kien/ctrlp.vim'

" solarized colorscheme
"Bundle 'altercation/vim-colors-solarized'

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

" Calendar
Bundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

filetype plugin indent on

" terminal colors
"set t_Co=16
set t_Co=256

" Enable syntax highligting
syntax on

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
set background=dark " adjust colors for better contrast
colorscheme desert
"colorscheme solarized
"call togglebg#map("<F3>")
let g:airline_theme = 'ubaryd'

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

" vim-airline
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Powerline symbols, fancy needs a patched/edited font
let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'

" Dictionary word completion using Ctrl-x Ctrl-k
" File from wordlist- (debian) or word- (arch) package
set dictionary+=/usr/share/dict/words

" Define other file types
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda

" Invisible character colors
" chose ctermfg=10 if Tab and EOL characters should be brighter
" chose ctermfg=0 if Tab and EOL characters should be darker
"highlight NonText ctermfg=10 guifg=DarkGray
"highlight SpecialKey ctermfg=10 guifg=DarkGray
highlight NonText ctermfg=0 guifg=DarkGray
highlight SpecialKey ctermfg=0 guifg=DarkGray

" Colors
hi Comment      ctermfg=12
hi Constant     ctermfg=15 
hi Identifier   ctermfg=4
hi Statement    ctermfg=2
hi PreProc      ctermfg=6
hi Type         ctermfg=1
hi Special      ctermfg=3
hi Underlined   ctermfg=7
hi Ignore       ctermfg=9
hi Error        ctermfg=11
hi Todo         ctermfg=1
hi Normal ctermfg=none ctermbg=none
hi NonText ctermfg=0 ctermbg=none
hi Directory	ctermfg=12

hi VertSplit	ctermfg=black
hi StatusLine	ctermfg=green
hi StatusLineNC	ctermfg=0 

hi Folded ctermbg=0 ctermfg=8

hi Pmenu ctermfg=10 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=14
hi LineNr ctermfg=0 ctermbg=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=none ctermbg=0 
hi CursorColumn ctermfg=none ctermbg=0

" Syntax checker colors
hi SignColumn ctermbg=none
hi SyntasticErrorSign ctermfg=1 ctermbg=none
hi SyntasticWarningSign ctermfg=3 ctermbg=none
hi SyntasticStyleErrorSign ctermfg=1 ctermbg=none
hi SyntasticStyleWarningSign ctermfg=3 ctermbg=none
hi SyntasticErrorLine ctermfg=none ctermbg=none
hi SyntasticWarningLine ctermfg=none ctermbg=none
hi SyntasticStyleErrorLine ctermfg=none ctermbg=none
hi SyntasticStyleWarningLine ctermfg=none ctermbg=none
hi SpellBad ctermfg=0 ctermbg=3
hi SpellCap ctermfg=0 ctermbg=1

hi ColorColumn ctermbg=0


""" Keyboard shortcuts

" Save with ZX
nmap ZX :w<CR>

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

" Use home row keys as Esc
inoremap jk <Esc>

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
