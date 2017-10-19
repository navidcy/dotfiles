" terminal colors "set t_Co=16
"set t_Co=256

" hilight column 80
set colorcolumn=+1
highlight ColorColumn ctermbg=237

"" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme tender

highlight Normal     cterm=NONE  ctermfg=NONE  ctermbg=NONE
highlight Search     cterm=NONE  ctermfg=black ctermbg=2
highlight MatchParen cterm=NONE  ctermfg=255   ctermbg=199
highlight SpecialKey ctermfg=250 ctermbg=NONE  cterm=NONE
highlight NonText    ctermfg=250 ctermbg=NONE

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

