filetype off

" terminal colors
"set t_Co=16
"set t_Co=256

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
NeoBundle 'vim-airline/vim-airline-themes'

" file system browser
NeoBundle 'scrooloose/nerdtree'

" syntax checking plugin
NeoBundle 'scrooloose/syntastic'

" fuzzy file, buffer, and tag finder
NeoBundle 'kien/ctrlp.vim'

" colorschemes
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'chriskempson/vim-tomorrow-theme'
"NeoBundle 'tomasr/molokai'
NeoBundle 'jacoborus/tender'

" modify surrounding characters in pairs
NeoBundle 'tpope/vim-surround'

" git wrapper. Reset changes with :Gread, stage changes with :Gwrite
NeoBundle 'tpope/vim-fugitive'

" Show which line changed since last git commit
NeoBundle 'airblade/vim-gitgutter'

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

" navigate between vim and tmux panes seamlessly
NeoBundle 'christoomey/vim-tmux-navigator'

" Take notes in rst
"NeoBundle 'Rykka/clickable.vim'
"NeoBundle 'Rykka/riv.vim'
"NeoBundle 'Rykka/InstantRst'

" add/remove bookmark: mm
" add/edit/remove annotation: mi
" next bookmark: mn
" previous bookmark: mn
" list of all bookmarks: ma
" clear all bookmarks in current buffer: mc
" clear all bookmarks in all buffers: mx
NeoBundle 'MattesGroeger/vim-bookmarks'

" QC, QX, QV to copy, cut and paste from system clipboard
NeoBundle 'NLKNguyen/copy-cut-paste.vim'

" Python mode
NeoBundle 'klen/python-mode'

NeoBundle 'fatih/vim-go'

" vimproc for asynchronous processes
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'wimdows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \   },
            \ }
" Unite for search, uses ag (Debian package silversearch-ag)
NeoBundle 'Shougo/unite.vim'

" insert unicode characters with latex code
"NeoBundle 'joom/latex-unicoder.vim'

" search for text in files
NeoBundle 'rking/ag.vim'

" Align things in columns (select, type Return then Space)
NeoBundle 'junegunn/vim-easy-align'

" open file manager (gof) or tmux pane (got) at current dir
NeoBundle 'justinmk/vim-gtfo'

" <C-y>,
" http://www.vim.org/scripts/script.php?script_id=2981
" http://emmet.io
NeoBundle 'mattn/emmet-vim'

" javascript plugins
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

" spacemacs keybinds
"NeoBundle 'jimmay5469/vim-spacemacs'

" Support mixed php and html
NeoBundle 'captbaritone/better-indent-support-for-php-with-html'

" Line up text (req for vim-markdown)
NeoBundle 'godlygeek/tabular'

" Markdown support
NeoBundle 'plasticboy/vim-markdown'

" Startup screen
NeoBundle 'mhinz/vim-startify'

" Show color table with :XtermColorTable
NeoBundle 'guns/xterm-color-table.vim'

" Auto-complete mutt aliases according to ~/.mutt/aliases
"NeoBundle 'guanqun/vim-mutt-aliases-plugin'
NeoBundle 'vim-scripts/mutt-aliases'

NeoBundle 'majutsushi/tagbar'

" Control mpd by CtrlP
NeoBundle 'lucidstack/ctrlp-mpc.vim'

" Show indentation levels with thin vertical lines
NeoBundle 'Yggdroot/indentLine'

" Show command documentation in a scratch buffer, usage ":G <query"
NeoBundle 'evidanary/grepg.vim'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup, this will prompt you to
" install them
NeoBundleCheck

" Enable syntax highligting
syntax on

" specify mutt aliases path, autocomplete aliases with @@ in insert mode
let g:mutt_aliases_file = '~/.mutt/aliases'

" Select non-default syntax colorscheme. Found in /usr/share/vim/vim72/colors/
"set background=dark " adjust colors for better contrast
"colorscheme desert
"colorscheme solarized
"colorscheme Tomorrow-Night-Eighties
"call togglebg#map("<F3>")
"let g:solarized_termtrans = 1

" If you have vim >=8.0 or Neovim >= 0.1.5
"if (has("termguicolors"))
    "set termguicolors
"endif
"" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme tender
let g:airline_theme = 'tender'

"let g:airline_theme = 'ubaryd'
"let g:airline_theme = 'solarized'
"let g:airline_theme = 'tomorrow'
"let g:airline_theme = 'wombat'
"let g:airline_theme = 'powerlineish'
"let g:airline_theme = 'bubblegum'
highlight Search     cterm=NONE  ctermfg=black ctermbg=2
highlight MatchParen cterm=NONE  ctermfg=255   ctermbg=199
highlight SpecialKey ctermfg=250 ctermbg=NONE  cterm=NONE
highlight NonText    ctermfg=250 ctermbg=NONE

" hilight column 80
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=237
"highlight ColorColumn ctermbg=15
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

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
"let mapleader=","
" use space instead of \ as leader
let mapleader="\<Space>"

" Shortcut to reload .vimrc
nmap <leader>r :source $MYVIMRC<CR>

" List errors in split
nmap <leader>E :Errors<CR>

" Shortcut to switch background color
"nmap <leader>W :ToggleBG<CR>

" Save file
nmap <Leader>w :w<CR>
"nmap <Leader>fs :w<CR>

" Quit
nmap <Leader>q :q<CR>

" Native (fast) buffer switching
nnoremap ,b :ls<CR>:buffer<Space>

" Close buffer
nmap <leader>Q :bd<CR>

" Save and quit
nmap <Leader>x :x<CR>

" Jump to previous buffer
nmap <leader><tab> <C-^>

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

nmap <leader>e :e 
nmap <leader>% :vsplit 
nmap <leader>" :split 

" shortcuts to commonly used files
nmap <leader>C :e $MYVIMRC<CR>
"nmap <leader>T :e ~/doc/todo.org<CR>
nmap <leader>T :e ~/doc/todo.md<CR>
nmap <leader>B :e ~/articles/own/BIBnew.bib<CR>
nmap <leader>A :e ~/articles/articles.rst<CR>

" insert date and time
nmap <leader>D :read !date<CR>

" job execution
nmap <leader>m :Make 
nmap <leader>E :VimProcRead 
nmap <leader>! :Start! 


" Switch split focus with leader+hjkl
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" toggle x mark in checklist fields
nmap <leader>X :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]': '[x]'/<CR>:noh<CR>

" neovim-specific mappings
if has('nvim')
    " escape from terminal mode
    tnoremap <leader>e <C-\><C-n>

    " navigate away from terminals
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " launch terminal in current window
    nmap <leader><CR> :terminal<CR>
endif

" Switch split focus with Alt+{h,j,k,l}
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" equal split size
nmap <leader>= <C-w>=

" Commit all changes
"nmap <leader>g :Gcommit<CR>
nmap <leader>g :Start git commit -a -v -S<CR>
nmap <leader>G :Start git commit -a -v -S && git push<CR>

" Toggle fold
"nmap <leader>f za
" Toggle all folds
nmap <leader>F zA
nmap <leader>Fa zR
nmap <leader>FA zM
" zc: close a fold
" zo: open a fold
" za: toggle a fold
" zM: close all folds
" zR: open all fol

" Switch split focus with <C-h>, <C-j>, <C-k> and <C-l>
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Use home row keys as Esc
inoremap jk <Esc>

" Improve navigation on wrapped lines
nnoremap j gj
nnoremap k gk

map <leader>E <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
"map  <leader>f <Plug>(easymotion-bd-f)
"nmap <leader>f <Plug>(easymotion-overwin-f)
map  <leader><leader> <Plug>(easymotion-bd-f)
nmap <leader><leader> <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char} (conflicts with spell)
"nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>W <Plug>(easymotion-bd-w)
nmap <leader>W <Plug>(easymotion-overwin-w)

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" show/hide tagbar
nmap <leader>t :TagbarToggle<CR>

" check current folder and all parent folders for tags files
set tags=tags;/

" Update ctags
nmap <leader>c :Start ctags -R --python-kinds=-i --langmap=c++:.cu,c++:.cuh .<CR>
" useful tags commands:
" :tag or :ta <function> Go to definition of the function
" :ts or :tselect Show the list of tags
" When the cursor is on a function call, press <Ctrl-[> to go to its definition.
" Press <Ctrl-t> to go back
" Use the Ctrl-P plugin to search the tags
nmap <leader>P :CtrlPTag<CR>
nmap <leader>p :CtrlPBuffer<CR>
nmap <leader>O :CtrlPMRUFiles<CR>
nmap <leader>o :CtrlP<CR>

" use git or silver searcher (ag) for CtrlP autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" Copy and paste to system clipboard with <Space>v and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>v "+p
nmap <Leader>V "+P
vmap <Leader>v "+p
vmap <Leader>V "+P


" Launch Ack
"nmap <leader>a :Ack 

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']

" adjust signcolumn appearance
let g:syntastic_error_symbol = 'e'
let g:syntastic_warning_symbol = 'w'
highlight clear SignColumn

" LaTeX unicode symbols
"let g:unicoder_cancel_normal = 1
"let g:unicoder_cancel_insert = 1
"let g:unicoder_cancel_visual = 1
"nnoremap <C-l> :call unicoder#start(0)<CR>
"inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
"vnoremap <C-l> :<C-u>call unicoder#selection()<CR>

" Search
let g:unite_source_history_yank_enable = 1
try
    let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <leader>a :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <leader>R <Plug>(unite_restart)

" search for text in many files
nmap <leader>A :Ag <c-r>=expand("<cword>")<cr><cr>
" search for text in project files
nnoremap <space>/ :Ag 

" align things into columns interactively
vnoremap <silent> <Enter> :EasyAlign<cr>

" Python mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>B'

" syntax highlighting
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Enable emmet in all modes
let g:user_emmet_mode='n'
let g:user_emmet_mode='inv'
let g:user_emmet_mode='a'


" vim-markdown configuration
" navigate headers with ]] and [[
" format a table with :TableFormat
" create a navigation table with :Toc, :Toch, :Tocv
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

nmap <leader>S :Startify<cr>
let g:startify_custom_header =
            \ map(split(system('fortune -s | cowthink'), '\n'), '"   ".v:val') 
            \ + ['','']
"let g:startify_custom_header =
            "\ map(split(system('figlet -f smslant neovim@flaptop'), '\n'), '"   ".v:val') 
            "\ + ['','']


"let g:startify_custom_header = [
            "\ '                                 ________  __ __        ',
            "\ '            __                  /\_____  \/\ \\ \       ',
            "\ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            "\ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            "\ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            "\ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            "\ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            "\ '',
            "\ '',
            "\ ]

" Split divider appearance
set fillchars=vert:│,fold:-
"hi! VertSplit ctermfg=15 ctermbg=NONE term=NONE
hi! VertSplit ctermfg=238 ctermbg=NONE term=NONE

" Control mpd by CtrlP
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir', 'tmux', 'mpc']
nnoremap <leader>M :CtrlPMpc<cr>

" use improved encryption method by default
"set cm=blowfish

" Indent guides color and character┆│¦⦙
let g:indentLine_char = '¦'
" Vim
let g:indentLine_color_term = 238
"GVim
let g:indentLine_color_gui = '#3A3A3A'

" toggle autoformatting of text
nnoremap <leader>f :exe 'set fo'.(&fo=~'a'?'-':'+').'=a'<CR>
