augroup gitcommit_typography
    setlocal spell spl=en_us
    setlocal completefunc=emoji#complete

    " modify previous commit via git --amend
    nnoremap <buffer> <silent> cd :<C-U>Gcommit --amend --date="$(date)"<CR>
augroup END
