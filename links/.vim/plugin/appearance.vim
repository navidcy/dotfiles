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
    highlight! VertSplit ctermfg=238 ctermbg=NONE term=NONE
endfunction

augroup ColorSchemeCmds
    autocmd ColorScheme * call ColorSchemeTweaks()
augroup end

colorscheme tender

augroup AleAppearance
    let g:ale_sign_error = '✖'
    let g:ale_sign_warning = '⚠'

    highlight ALEErrorSign ctermbg=0 ctermfg=203
    highlight ALEWarningSign ctermbg=0 ctermfg=173
augroup end

" statusline helper functions
function! StatuslineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:all_non_errors == 0 ? '' : printf(' %d ⚠  ', all_non_errors)
endfunction
"
function! StatuslineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:all_errors == 0 ? '' : printf(' %d ✖ ', all_errors)
endfunction

function! StatuslineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? ' ✓ ' : ''
endfunction

augroup StatuslineConfig

    " define 3 custom highlight groups for statusline coloring
    highlight User1 ctermfg=252 guifg=#d0d0d0 ctermbg=240 guibg=#585858
    highlight User2 ctermfg=247 guifg=#969696 ctermbg=240 guibg=#585858
    highlight User3 ctermbg=244 guibg=#808080 ctermfg=238 guifg=#444444
    highlight User4 ctermfg=252 guifg=#d0d0d0 ctermbg=238 guibg=#444444
    highlight User5 ctermfg=252 guifg=#d0d0d0 ctermbg=238 guibg=#444444
    highlight User6 ctermfg=238 guifg=#444444 ctermbg=203 guibg=#e5786d
    highlight User7 ctermfg=238 guifg=#444444 ctermbg=173 guibg=#e5786d

    " empty statusline and populate later
    set statusline=

    " left
    set statusline+=%1*           " set User1 color
    set statusline+=\ %t\         " tail of filename
    set statusline+=%4*           " set User4 color
    set statusline+=\ %h%w%m%r\   " flags for help file, preview, modified, R/O
    set statusline+=%#LineNr#     " set default background

    " center spacing
    set statusline+=%=            " add separation between left and right items

    " right
    set statusline+=%4*           " set background color
    set statusline+=%7*%{StatuslineLinterWarnings()}%4*   " ALE warnings
    set statusline+=%6*%{StatuslineLinterErrors()}%4*     " ALE errors
    set statusline+=%{StatuslineLinterOK()}               " ALE ok
    set statusline+=%2*           " set User2 color
    set statusline+=\ %{LineNoIndicator()}\  " show file position with single char
    set statusline+=%3*           " set User3 color
    set statusline+=\ %2l:%-2c\   " line and column view

augroup END
