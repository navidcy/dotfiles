""""" PLUGIN SOURCES """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/vim-plugs')   " Specify a directory for plugins

""""" Misc """"""
Plug 'tpope/vim-unimpaired'         " nav. errors with ]q, newlines with ]spc
Plug 'junegunn/vim-emoji'           " autocomplete :smiley: with C-x C-u
Plug 'chrisbra/unicode.vim'         " autocomplete unicode with C-x C-z
Plug 'tpope/vim-characterize'       " complete info of char under cursor with ga

""""" Appearance """"""
Plug 'drzel/vim-line-no-indicator'  " show current line with single character
Plug 'jacoborus/tender'             " color scheme
Plug 'luochen1990/rainbow'          " colorcode paranthesis pairs
Plug 'mhinz/vim-startify'           " startup screen
Plug 'embear/vim-foldsearch'        " hide/show lines matching a pattern
Plug 'junegunn/goyo.vim'            " distraction-free editing in prose mode
Plug 'junegunn/limelight.vim'       " highlight current paragraph in goyo
Plug 'Yggdroot/indentLine'          " show indentation level with vertical lines
Plug 'vim-scripts/AnsiEsc.vim'      " show ANSI colors with :AnsiEsc

"""""" File system """""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'             " fzf commands from within vim
Plug 'ludovicchabant/vim-gutentags' " automatic tag generation
Plug 'tpope/vim-eunuch'             " :SudoWrite, :Rename, :Move, etc

"""""" Syntax checking """"""
Plug 'w0rp/ale'                     " asynchronous syntax check
Plug 'lukhio/adVIMsor', { 'on': 'AdVIMsorEnable' } " checks with :AdVIMsor*

"""""" Buffer motion """"""
Plug 'christoomey/vim-tmux-navigator' " seamless tmux pane/vim window navigation
Plug 'junegunn/vim-slash'           " clear highlight when moving cursor
Plug 'justinmk/vim-sneak'           " move cursor s{char}{char}, use cl for sub

"""""" Text editing """"""
Plug 'tpope/vim-surround'           " modify surrounding symbols
Plug 'tpope/vim-repeat'             " repeat plugin bindings with .
Plug 'tpope/vim-commentary'         " comment line with gcc, motion with gc
Plug 'tpope/vim-abolish'            " :%Subvert/facilit{y,ies}/building{,s}/g
Plug 'junegunn/vim-easy-align'      " align in columns (select > return > space)
Plug 'reedes/vim-litecorrect'       " autocorrect common typos
Plug 'reedes/vim-pencil'            " used for line wrapping in mails
Plug 'szw/vim-dict'                 " query dict.org using :Dict
Plug 'junegunn/vim-online-thesaurus' " query with :OnlineThesaurusCurrentWord

"""""" Autocomplete """"""
Plug 'honza/vim-snippets'           " snippets are separate from ultisnips
Plug 'SirVer/ultisnips'             " complete boilerplate code

"""""" Version control """"""
Plug 'tpope/vim-fugitive'           " :Gread, :Gwrite, etc.
Plug 'tpope/vim-rhubarb'            " enables fugitive's :Gbrowse for Github
Plug 'airblade/vim-gitgutter'       " show line changes since last git commit

"""""" Processes """"""
Plug 'tpope/vim-dispatch'           " for asynchronous :Make


"""""" File types """"""

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" Julia
Plug 'JuliaLang/julia-vim'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
"Plug 'klen/python-mode'

" HTML/PHP/JS
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'pangloss/vim-javascript'

" Markdown
Plug 'godlygeek/tabular' " line up text (req for vim-markdown)
Plug 'plasticboy/vim-markdown'

" Mail
Plug 'vim-scripts/mutt-aliases', { 'for': 'mail' } " complete aliases w C-x C-u

" LaTeX
Plug 'lervag/vimtex'
Plug 'anders-dc/vim-scholarref'     " search bibtex refs from web

" Vimscript
Plug 'junegunn/vader.vim'           " testing framework

call plug#end()                     " Initialize plugin system


""""" PLUGIN SETTINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1  " toggle with :RainbowToggle

let g:foldsearch_disable_mappings = 1
let g:gitgutter_map_keys = 0

let g:go_version_warning = 0

let g:sneak#label = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"  " default write path

" vim-markdown configuration
" navigate headers with ]] and [[
" format a table with :TableFormat
" create a navigation table with :Toc, :Toch, :Tocv
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_conceal=0

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:goyo_width = 82
if !exists('*s:goyo_enter')
    function! s:goyo_enter() abort
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        set noshowmode
        set noshowcmd
        set nolist
        set scrolloff=999
        "Limelight
    endfunction
end

if !exists('*s:goyo_leave')
    function! s:goyo_leave() abort
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        Limelight!
        source $MYVIMRC
    endfunction
end

augroup GoyoEvents
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" run vim-emoji on entire document
command! -range EmojiReplace <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" disable default thesaurus bindings
let g:online_thesaurus_map_keys = 0

" select indentation character (:IndentLinesToggle) (¦┆│⎸▏)
"let g:indentLine_char = '┆'
let g:indentLine_char = '▏'
