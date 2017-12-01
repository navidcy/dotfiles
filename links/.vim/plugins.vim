""""" PLUGIN SOURCES """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/vim-plugs')   " Specify a directory for plugins

"""""" Misc """"""
Plug 'tpope/vim-unimpaired'         " nav. errors with ]q, newlines with ]spc
Plug 'johngrib/vim-game-code-break' " :VimGameCodeBreak
Plug 'junegunn/vim-emoji'           " autocomplete :smiley: with C-x C-u

"""""" Appearance """"""
Plug 'itchyny/lightline.vim'        " lighter status line
Plug 'drzel/vim-line-no-indicator'  " emphasize current line with bg color
Plug 'jacoborus/tender'             " color scheme
Plug 'luochen1990/rainbow'          " colorcode paranthesis pairs
Plug 'mhinz/vim-startify'           " startup screen
Plug 'guns/xterm-color-table.vim'   " show color table with :XtermColorTable
Plug 'embear/vim-foldsearch'        " hide/show lines matching a pattern
Plug 'junegunn/goyo.vim'            " distraction-free editing in prose mode
Plug 'junegunn/limelight.vim'       " highlight current paragraph in goyo

"""""" File system """""""
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'justinmk/vim-gtfo'            " open finder (gof)/tmux pane (got) at pwd
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'             " fzf commands from within vim
Plug 'ludovicchabant/vim-gutentags' " automatic tag generation

"""""" Syntax checking """"""
Plug 'w0rp/ale'                     " asynchronous syntax check

"""""" Buffer motion """"""
Plug 'easymotion/vim-easymotion'    " jump to char with <spc><spc>char
Plug 'christoomey/vim-tmux-navigator' " seamless tmux pane/vim window navigation
Plug 'junegunn/vim-slash'           " clear highlight when moving cursor

"""""" Text editing """"""
Plug 'tpope/vim-surround'           " modify surrounding symbols
Plug 'tpope/vim-speeddating'        " increment dates and times with C-a and C-x
Plug 'tpope/vim-repeat'             " repeat plugin bindings with .
Plug 'junegunn/vim-easy-align'      " align in columns (select > return > space)
Plug 'reedes/vim-litecorrect'       " autocorrect common typos
Plug 'reedes/vim-pencil'            " used for line wrapping in mails
Plug 'szw/vim-dict'                 " query dict.org using :Dict

" cycle through yank history with <leader>p and <leader>P after pasting,
" see history with :Yanks
Plug 'maxbrunsfeld/vim-yankstack'

"""""" Autocomplete """"""
Plug 'ervandew/supertab'            " complete with TAB in insert mode

"""""" Version control """"""
Plug 'tpope/vim-fugitive'           " :Gread, :Gwrite, etc.
Plug 'tpope/vim-rhubarb'            " enables fugitive's :Gbrowse for Github
Plug 'airblade/vim-gitgutter'       " show line changes since last git commit

"""""" Processes """"""
Plug 'tpope/vim-dispatch'           " for asynchronous :Make

"""""" File types """"""
" General
Plug 'msanders/snipmate.vim'        " boilerplate code

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" Julia
Plug 'JuliaLang/julia-vim'

" Python
Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode'

" HTML/PHP/JS
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'pangloss/vim-javascript'

" Markdown
Plug 'godlygeek/tabular' " line up text (req for vim-markdown)
Plug 'plasticboy/vim-markdown'

" Mail
"Plug 'vim-scripts/mutt-aliases'     " auto complete from ~/.mutt/aliases

" LaTeX
Plug 'lervag/vimtex'
Plug 'anders-dc/vim-scholarref'     " search bibtex refs from web

" Vimscript
Plug 'junegunn/vader.vim'           " testing framework

call plug#end()                     " Initialize plugin system


""""" PLUGIN SETTINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1  " toggle with :RainbowToggle

let g:foldsearch_disable_mappings = 1

" vim-markdown configuration
" navigate headers with ]] and [[
" format a table with :TableFormat
" create a navigation table with :Toc, :Toch, :Tocv
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_conceal=0

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
if !exists('*s:goyo_enter')
    function! s:goyo_enter() abort
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        set noshowmode
        set noshowcmd
        set nolist
        set scrolloff=999
        Limelight
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

" Lightline (theme set in appearance.vim)
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

" Use bar instead of percentage
let g:lightline.component = { 'percent': '%{LineNoIndicator()}' }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

augroup ALEcmds
    autocmd User ALELint call s:MaybeUpdateLightline()
augroup END

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline() abort
  if exists('#lightline')
    call lightline#update()
  end
endfunction
