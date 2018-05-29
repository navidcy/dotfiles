augroup markdown_typography
    call pencil#init({'wrap': 'soft', 'textwidth': 80, 'conceallevel': 0})
    call litecorrect#init()
    setlocal spell spl=en_us
    setlocal fdo+=search
    setlocal list
    setlocal formatoptions=alw2qt " automatically reflow paragraphs
    setlocal completefunc=emoji#complete
    AdVIMsorEnable " detect weasel words, use of passive voice, word duplicates
    DittoOn
augroup END
