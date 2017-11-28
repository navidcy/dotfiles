" terminal colors
"set t_Co=16
"set t_Co=256

set colorcolumn=+1

function! ColorSchemeTweaks() abort

    highlight ColorColumn ctermbg=237

    highlight Normal     cterm=NONE  ctermfg=NONE  ctermbg=NONE
    highlight Search     cterm=NONE  ctermfg=black ctermbg=2
    highlight MatchParen cterm=NONE  ctermfg=255   ctermbg=199
    highlight SpecialKey ctermfg=250 ctermbg=NONE  cterm=NONE
    highlight NonText    ctermfg=250 ctermbg=NONE
"
    "" Invisible character colors
    highlight NonText ctermfg=10 guifg=DarkGray
    highlight SpecialKey ctermfg=10 guifg=DarkGray
    "
    "" Split divider appearance
    hi! VertSplit ctermfg=238 ctermbg=NONE term=NONE
endfunction

augroup ColorSchemeCmds
    autocmd ColorScheme * call ColorSchemeTweaks()
augroup end

colorscheme tender
