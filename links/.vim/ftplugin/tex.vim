augroup latex_options

    let g:vimtex_quickfix_latexlog = {
                \ 'overfull' : 0,
                \ 'underfull' : 0}

    " customize what is concealed in LaTeX documents:
    " a = conceal accents/ligatures
    " d = conceal delimiters
    " g = conceal Greek
    " m = conceal math symbols
    " s = conceal superscripts/subscripts
    let g:tex_conceal="agm"

augroup END

augroup latex_typography
    call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 0})
    call litecorrect#init()
    setlocal spell spl=en_us
    setlocal fdo+=search
    setlocal list
    setlocal formatoptions=alw2qt " automatically reflow paragraphs
    IndentLinesDisable
    AdVIMsorEnable " detect weasel words, use of passive voice, word duplicates
augroup END
