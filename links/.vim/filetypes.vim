" set file type for unrecognized extensions
augroup ArduinoFileTypes
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
augroup END

augroup CudaFileTypes
    autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda
augroup END

" enable spell and settings for text writing by default for certain file types
augroup ReadableFileTypes
    autocmd FileType tex,latex,md,markdown,mkd,rst,mail
                \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 0})
                \ | call litecorrect#init()
                \ | setl spell spl=en_us
                \ | setl fdo+=search
                \ | setl nocursorcolumn
                \ | setl list
                \ | setl formatoptions=alw2qt " automatically reflow paragraphs
augroup END

" customize what is concealed in LaTeX documents:
" a = conceal accents/ligatures
" d = conceal delimiters
" g = conceal Greek
" m = conceal math symbols
" s = conceal superscripts/subscripts
let g:tex_conceal="agm"
