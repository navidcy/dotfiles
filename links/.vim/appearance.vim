" terminal colors
"set t_Co=16
"set t_Co=256

" hilight column 80
set colorcolumn=+1
highlight ColorColumn ctermbg=237

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
highlight Normal     cterm=NONE  ctermfg=NONE  ctermbg=NONE
highlight Search     cterm=NONE  ctermfg=black ctermbg=2
highlight MatchParen cterm=NONE  ctermfg=255   ctermbg=199
highlight SpecialKey ctermfg=250 ctermbg=NONE  cterm=NONE
highlight NonText    ctermfg=250 ctermbg=NONE

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

" minimal line indicator
let g:airline_section_y = '%{LineNoIndicator()}'
let g:airline_section_z = '%2c'  " column number
"let g:airline_section_z = '%{LineNoIndicator()} %2c'

" Invisible character colors
" chose ctermfg=10 if Tab and EOL characters should be brighter
" chose ctermfg=0 if Tab and EOL characters should be darker
highlight NonText ctermfg=10 guifg=DarkGray
highlight SpecialKey ctermfg=10 guifg=DarkGray
"highlight NonText ctermfg=0 guifg=DarkGray
"highlight SpecialKey ctermfg=0 guifg=DarkGray

" Control mpd by CtrlP
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir', 'tmux', 'mpc']

" Split divider appearance
"set fillchars=vert:│,fold:-
"hi! VertSplit ctermfg=15 ctermbg=NONE term=NONE
hi! VertSplit ctermfg=238 ctermbg=NONE term=NONE

" Indent guides color and character┆│¦⦙
"let g:indentLine_char = '┆'
" Vim
"let g:indentLine_color_term = 238
"GVim
"let g:indentLine_color_gui = '#3A3A3A'

