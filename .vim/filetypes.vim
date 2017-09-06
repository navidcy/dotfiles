" set file type for unrecognized extensions
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.cuh setlocal ft=cuda

" enable spell and settings for text writing by default for certain file types
autocmd FileType tex,latex,md,markdown,mkd,rst,mail
            \   call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 3})
            \ | call litecorrect#init()
            \ | setl spell spl=en_us
            \ | setl fdo+=search
            \ | setl nocursorcolumn
            \ | setl list
            "\ | setl spell spl=en_us noru nonu nornu
            "\ | let b:dispatch = 'sh /usr/local/bin/preview %:p'
"
" customize what is concealed in LaTeX documents:
" a = conceal accents/ligatures
" d = conceal delimiters
" g = conceal Greek
" m = conceal math symbols
" s = conceal superscripts/subscripts
let g:tex_conceal="agm"




