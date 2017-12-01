augroup arduino_identify
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
augroup END
