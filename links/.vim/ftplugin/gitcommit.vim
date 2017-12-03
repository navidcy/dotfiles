augroup gitcommit_typography
    setlocal spell spl=en_us
    setlocal completefunc=emoji#complete

    " instead modify previous commit with <leader>cc
    nnoremap <buffer> <silent> <leader>cc :<C-U>Gcommit --amend --date="$(date)"<CR>
augroup END
