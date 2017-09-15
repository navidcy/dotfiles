""""" PLUGIN SOURCES """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" install plugins with :PlugInstall
" Make sure you use single quotes

"""""" Appearance """"""
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drzel/vim-line-no-indicator'
Plug 'jacoborus/tender'   " color scheme
Plug 'luochen1990/rainbow'  " colorcode paranthesis pairs
Plug 'mhinz/vim-startify'  " startup screen
Plug 'guns/xterm-color-table.vim' " show color table with :XtermColorTable
Plug 'Yggdroot/indentLine' " show indent levels with thin vertical lines
Plug 'embear/vim-foldsearch' " hide/show lines matching a patter


"""""" File system """""""
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'lucidstack/ctrlp-mpc.vim' " Control mpd by CtrlP
Plug 'justinmk/vim-gtfo' " open file manager (gof)/tmux pane (got) @ current dir
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"""""" Syntax checking """"""
Plug 'w0rp/ale'  " asynchronous syntax check


"""""" Buffer motion """"""
Plug 'Lokaltog/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" add/remove bookmark: mm
" add/edit/remove annotation: mi
" next bookmark: mn
" previous bookmark: mn
" list of all bookmarks: ma
" clear all bookmarks in current buffer: mc
" clear all bookmarks in all buffers: mx
Plug 'MattesGroeger/vim-bookmarks'


"""""" Text editing """"""
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'  " increment dates and times with C-a and C-x
Plug 'junegunn/vim-easy-align'  " align in columns (select > return > space)
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'

" cycle through yank history with <leader>p and <leader>P after pasting,
" see history with :Yanks
Plug 'maxbrunsfeld/vim-yankstack'


"""""" Autocomplete """"""
Plug 'davidhalter/jedi-vim'  " (C-space)
Plug 'ervandew/supertab'     " complete with TAB in insert mode


"""""" Version control """"""
"Plug 'tpope/vim-fugitive'   " :Gread, :Gwrite
Plug 'airblade/vim-gitgutter'  " show line changes since last git commit


"""""" Processes """"""
Plug 'tpope/vim-dispatch'  " for :Make


"""""" File types """"""
" General
Plug 'msanders/snipmate.vim'  " boilerplate code
Plug 'majutsushi/tagbar'  " ctags overview :TagBarToggle

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" Julia
Plug 'JuliaLang/julia-vim'

" Python
Plug 'klen/python-mode'

" HTML/PHP
Plug 'captbaritone/better-indent-support-for-php-with-html'

" Markdown
Plug 'godlygeek/tabular' " line up text (req for vim-markdown)
Plug 'plasticboy/vim-markdown'

" Mail
Plug 'vim-scripts/mutt-aliases' " auto-complete aliases from ~/.mutt/aliases


""""" Unmanaged plugin (manually installed and updated) """"""
"Plug '~/my-prototype-plugin'


" Initialize plugin system
call plug#end()


""""" PLUGIN SETTINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1  " toggle with :RainbowToggle

" vim-markdown configuration
" navigate headers with ]] and [[
" format a table with :TableFormat
" create a navigation table with :Toc, :Toch, :Tocv
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
