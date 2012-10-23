" Include pathogen plugin manager
"call pathogen#infect()

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

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

" Map F7 and F9 to switch between tabs
map <F7> :tabp<CR>
map <F9> :tabn<CR>
map <F8> :tabe 

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
colorscheme desert

set backspace=indent,eol,start
" note that the following rval is made by hitting ctrl-v and then backspace...
" " this remaps backspace to actualy BACKSPACE - not delete.
" set t_kb=ctrl-vBACKSPACE
fixdel

set cindent
set smartindent
set autoindent

set pastetoggle=<F2>

" Latex suite configuration
"let g:Tex_DefaultTargetFormat = 'pdf' 
"let g:Tex_ViewRule_pdf ="/Applications/Skim.app/Contents/MacOS/Skim"
"let g:Tex_ViewRule_pdf ="open -a Skim"

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Vim Powerline
"set nocompatible   " Disable vi-compatibility
"set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

:autocmd FileType mail :nmap <F6> :w<CR>:!aspell -e -c %<CR>:e<CR>

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda

