" Include pathogen plugin manager
execute pathogen#infect()

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" Shortcut to reload .vimrc, leader is '\'
nmap <leader>r :source $MYVIMRC<CR>

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" Set linenumbering ON as default
set number

" Enable bottom ruler
"set ruler

" Enable syntax highligting
syntax on

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
colorscheme desert

" adjust colors for better contrast
set background=dark

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" note that the following rval is made by hitting ctrl-v and then backspace...
" " this remaps backspace to actualy BACKSPACE - not delete.
" set t_kb=ctrl-vBACKSPACE
fixdel

set cindent
set smartindent
set autoindent

" toggle paste mode
set pastetoggle=<F2> 

" NERD Tree short cut
map <F3> :NERDTreeToggle<CR>

" Spell check in mutt
:autocmd FileType mail :nmap <F6> :w<CR>:!aspell -e -c %<CR>:e<CR>

" Map F7 and F9 to switch between tabs, F8 for new tab
map <F7> :tabp<CR>
map <F9> :tabn<CR>
map <F8> :tabe 

" toggle spelling
noremap <silent><F10> :set spell!<CR>

" toggle line numbering
nnoremap <silent><F11> :set number!<CR>

" Latex suite configuration
"let g:Tex_DefaultTargetFormat = 'pdf' 
"let g:Tex_ViewRule_pdf ="/Applications/Skim.app/Contents/MacOS/Skim"
"let g:Tex_ViewRule_pdf ="open -a Skim"

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Vim Powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

" Define other file types
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda

" Google Python style guide
set tabstop=8      " a tab is 4 characters wide
set expandtab      " convert tab char to spaces
set softtabstop=4  " makes the tab key indent by four spaces 
set shiftwidth=4   " width for autoindents
filetype indent on " automatic indent

" Dictionary word completion using Ctrl-x Ctrl-k
" File from wordlist- (debian) or word- (arch) package
set dictionary+=/usr/share/dict/words

" hilight column 80
set textwidth=80
set colorcolumn=+1
hi ColorColumn guibg=#2e2e2e ctermbg=236

" Enable rendering of invisible characters
set list

" Shortcut to rapidly toggle `set list`, leader is '\'
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

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
