filetype off

" terminal colors
"set t_Co=16
set t_Co=256

if has('vim_starting')
    set nocompatible    " Disable vi-compatibility
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

""" NeoBundle plugins 
" By default fom github.
" Install and update with :NeoBundleInstall(!), see :h NeoBundle

" let NeoBundle manage Vundle. Required!
NeoBundle 'Shougo/neobundle.vim'

" more functional statusline
"NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'Lokaltog/powerline'
NeoBundle 'bling/vim-airline'

" file system browser
NeoBundle 'scrooloose/nerdtree'

" syntax checking plugin
NeoBundle 'scrooloose/syntastic'

" fuzzy file, buffer, and tag finder
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'

" colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'

" modify surrounding characters in pairs
NeoBundle 'tpope/vim-surround'

" git wrapper
NeoBundle 'tpope/vim-fugitive'

" dispatch.vim for :Make
NeoBundle 'tpope/vim-dispatch'

" browse buffers (vim.org/scripts), \be, \bs, \bv
NeoBundle 'bufexplorer.zip'

" Vim-LaTeX suite
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'

" Use <Tab> to autocomplete in insert mode
NeoBundle 'ervandew/supertab'

" Ack is a grep replacement. Debian pkg: ack-grep. Run from Vim:
" usage: :Ack [options] {pattern} [{directory}]
NeoBundle 'mileszs/ack.vim'

" Rainbow parantheses
NeoBundle 'kien/rainbow_parentheses.vim'

" Calendar
"NeoBundle 'itchyny/calendar.vim'
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

" ctags list (:TlistOpen)
NeoBundle 'taglist.vim'

" vim-OrgMode
NeoBundle 'jceb/vim-orgmode'

" increment dates and times with Ctrl-a and Ctrl-x
NeoBundle 'tpope/vim-speeddating'

" support for Julia
NeoBundle 'JuliaLang/julia-vim'

" SnipMate for boilerplate code
NeoBundle 'msanders/snipmate.vim'

" vim motion on speed
NeoBundle 'Lokaltog/vim-easymotion'

" Take notes in rst
NeoBundle 'Rykka/clickable.vim'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'Rykka/InstantRst'

" add/remove bookmark: mm
" add/edit/remove annotation: mi
" next bookmark: mn
" previous bookmark: mn
" list of all bookmarks: ma
" clear all bookmarks in current buffer: mc
" clear all bookmarks in all buffers: mx
NeoBundle 'MattesGroeger/vim-bookmarks'

" vimproc for asynchronous processes
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'wimdows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \   },
            \ }

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup, this will prompt you to
" install them
NeoBundleCheck

" Enable syntax highligting
syntax on

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
set background=dark " adjust colors for better contrast
"colorscheme desert
colorscheme solarized
"colorscheme Tomorrow-Night-Eighties
call togglebg#map("<F3>")
"let g:airline_theme = 'ubaryd'
let g:airline_theme = 'solarized'
"let g:airline_theme = 'tomorrow'
highlight Search     cterm=NONE  ctermfg=black ctermbg=2
highlight MatchParen cterm=NONE  ctermfg=255   ctermbg=199
highlight SpecialKey ctermfg=250 ctermbg=NONE  cterm=NONE
highlight NonText    ctermfg=250 ctermbg=NONE

" hilight column 80
set textwidth=80
set colorcolumn=+1

set autoindent
set autoread        " reload files when changed on disk
set backspace=2     " fix broken backspace in some setups
set backupcopy=yes  " see :help crontab
"set clipboard=unnamed " yank and paste with the system clipboard
set cursorline      " highlight current line
set encoding=utf-8  " Necessary to show unicode glyphs
set expandtab       " convert tab char to spaces
set ignorecase      " case-insensitive search
set incsearch       " search as you type
set laststatus=2    " always show the statusline
set list            " enable rendering of invisible characters
set listchars=tab:▸\ ,eol:¬ " Use symbols for tab and end-of-line
set number          " set linenumbering ON as default
"set relativenumber  " set relative linenumbering ON as default
set pastetoggle=<F2> " toggle paste mode
set ruler           " Enable bottom ruler
set scrolloff=3     " show context above-below cursorline
set shiftwidth=4    " width for autoindents
"set showcmd
set smartcase       " case-sensitive search if any caps
set softtabstop=4   " makes the tab key indent by four spaces 
set splitright      " new vertical splits on the right side
set tabstop=4       " a tab is 4 characters wide
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

" vim-airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Powerline symbols, fancy needs a patched/edited font
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'

" use airline decorations for tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

" Rainbow parantheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
highlight NonText ctermfg=10 guifg=DarkGray
highlight SpecialKey ctermfg=10 guifg=DarkGray
"highlight NonText ctermfg=0 guifg=DarkGray
"highlight SpecialKey ctermfg=0 guifg=DarkGray


""" Keyboard shortcuts

" Save with ZX
nmap ZX :w<CR>

" use , instead of \ as leader
let mapleader=","
" use space instead of \ as leader
let mapleader="\<Space>"

" Shortcut to reload .vimrc
nmap <leader>r :source $MYVIMRC<CR>

" Shortcut to switch background color
"nmap <leader>w :ToggleBG<CR>

" Save file
nmap <Leader>w :w<CR>

" Quit
nmap <Leader>q :q<CR>

" Save and quit
nmap <Leader>x :x<CR>

" Explore buffers
nmap <leader>b :BufExplorer<CR>

" toggle spelling
nmap <leader>s :set spell!<CR>

" toggle line numbering
nmap <leader>n :set number!<CR>

" toggle relative line numbering
nmap <leader>N :set relativenumber!<CR>

" NERD Tree short cut
nmap <leader>d :NERDTreeToggle<CR>

" Toggle TAB and EOL symbols
nmap <leader>l :set list!<CR>

nmap <leader>% :vsplit 
nmap <leader>" :split 

" shortcuts to commonly used files
nmap <leader>C :e $MYVIMRC<CR>
nmap <leader>T :e ~/doc/todo.org<CR>
nmap <leader>B :e ~/articles/own/BIBnew.bib<CR>

" vimproc
nmap <leader>e :VimProcBang 
nmap <leader>E :VimProcRead 
nmap <leader>c :VimProcBang make -k

nmap <leader>g :Gcommit<CR>

" Switch split focus with leader+hjkl
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" Toggle fold
nmap <leader>f za
" Toggle all folds
nmap <leader>F zA
" zc: close a fold
" zo: open a fold
" za: toggle a fold
" zM: close all folds
" zR: open all folds

" Switch split focus with <C-h>, <C-j>, <C-k> and <C-l>
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

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

" check current folder and all parent folders for tags files
set tags=tags;/

" Update ctags
nmap <leader>t :!ctags -R --python-kinds=-i --langmap=c++:.cu,c++:.cuh .<CR>
" useful tags commands:
" :tag or :ta <function> Go to definition of the function
" :ts or :tselect Show the list of tags
" When the cursor is on a function call, press <Ctrl-[> to go to its definition.
" Press <Ctrl-t> to go back
" Use the Ctrl-P plugin to search the tags
nmap <leader>P :CtrlPTag<CR>
nmap <leader>p :CtrlPBuffer<CR>
nmap <leader>o :CtrlPMRUFiles<CR>

" Launch Ack
nmap <leader>a :Ack 

" reStructuredText bindings
augroup filetypedetect_rst
    au!
    " Headings
    " Use <C-e>s1 to <C-e>s4 in insert mode
    " Use <C-e>hs to view document sections
    " Use <C-e>cc to insert table of contents
    "au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc>
    "au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>
    "au FileType rst nnoremap <leader>h2 ^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkk
    "au FileType rst inoremap <leader>h2 <esc>^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkki
    "au FileType rst nnoremap <leader>h3 ^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkk
    "au FileType rst inoremap <leader>h3 <esc>^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkki
    "au FileType rst nnoremap <leader>h4 ^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkk
    "au FileType rst inoremap <leader>h4 <esc>^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkki
    "au FileType rst nnoremap <leader>h5 ^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkk
    "au FileType rst inoremap <leader>h5 <esc>^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkki

    " On list lines, press <C-e>ee to toggle state

    """Make Link (ml)
    " Use <C-e>ck to make a link
    " Highlight a word or phrase and it creates a link and opens a split so
    " you can edit the url separately. Once you are done editing the link,
    " simply close that split.
    au FileType rst vnoremap <leader>ml yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb

    """Make footnote (ml)
    au FileType rst iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
    " Enable spelling by default
    au FileType rst set spell

    "Create image
    au FileType rst iabbrev iii .. image:: TODO.png<cr> :scale: 100<cr>:align: center<cr><esc>kkkeel

    "Create figure
    "au FileType rst iabbrev iif .. figure:: TODO.png<cr> :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

    "Create note
    au FileType rst iabbrev nnn .. note::

    "Start or end bold text inline
    "au FileType rst inoremap <leader>bb **

    "Start or end italicized text inline
    "au FileType rst inoremap <leader>ii *

    "Start or end preformatted text inline
    "au FileType rst inoremap <leader>pf ``

    " Fold settings
    "au FileType rst set foldmethod=marker
    "
    " Admonitions
    au FileType rst iabbrev adw .. warning::
    au FileType rst iabbrev adn .. note::

augroup END

" adjust signcolumn appearance
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
highlight clear SignColumn
