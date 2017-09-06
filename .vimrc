if has('vim_starting')
    set nocompatible    " Disable vi-compatibility
endif

" Load plugins
source ~/.vim/plugins.vim

filetype plugin indent on

" Enable syntax highligting
syntax on

source ~/.vim/appearance.vim

set textwidth=80
set autoindent
set autoread        " reload files when changed on disk
set backspace=2     " fix broken backspace in some setups
set backupcopy=yes  " see :help crontab
"set clipboard=unnamed " yank and paste with the system clipboard
set cursorline      " highlight current line
"set encoding=utf-8  " Necessary to show unicode glyphs
set expandtab       " convert tab char to spaces
set formatoptions=alw2qt " automatically reflow paragraphs to line width upon change
set lbr             " break lines between words
set hlsearch        " highlight search matches
set ignorecase      " case-insensitive search
set incsearch       " search as you type
set laststatus=2    " always show the statusline
set list            " enable rendering of invisible characters
set listchars=tab:▸\ ,eol:¬ " Use symbols for tab and end-of-line
set number          " set linenumbering ON as default
set relativenumber  " set relative linenumbering ON as default
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
if !has('nvim')
    if exists('$TMUX')    " support resizing in tmux
        set ttymouse=xterm2
    endif
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

source ~/.vim/keybinds.vim
source ~/.vim/filetypes.vim

" check current folder and all parent folders for tags files
set tags=tags;/

" specify mutt aliases path, autocomplete aliases with @@ in insert mode
let g:mutt_aliases_file = '~/.mutt/aliases'

" toggle autoformatting of text
"nnoremap <leader>f :exe 'set fo'.(&fo=~'a'?'-':'+').'=a'<CR>

