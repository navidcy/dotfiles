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

    NoMatchParen " disable paranthesis matching for faster performance

    " use latexmk as make program for continuous compilation
    "setlocal makeprg=latexmk\ -pdf\ %
    setlocal makeprg=latexmk\ -lualatex\ %

    " or run in tmux pane: 
    nnoremap <leader>p :!tmux new-window -a -n "latexmk" "latexmk -pdf -pvc %" \; select-window -l<cr><cr>

    " disable continuous and slow chktex linting
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0

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
