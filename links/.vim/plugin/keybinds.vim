""" Keyboard shortcuts

" Save with ZX
nnoremap ZX :w<CR>

" use space instead of \ as leader
let mapleader="\<Space>"

" Shortcut to reload .vimrc and ~/.vim/plugin/*.vim
nnoremap <leader>R :source $MYVIMRC<CR>:runtime! plugin/*.vim<CR>:echo "Configuration reloaded"<CR>

" toggle distraction-free editing
nnoremap <leader>y :set nolist<CR>:Goyo<CR>
nnoremap <leader>Y :set nolist<CR>:Goyo!<CR>:source $MYVIMRC<CR>
"nmap <leader>Y :set nolist<CR>:Goyo!<CR>:source $MYVIMRC<CR>

" Save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w !sudo tee > /dev/null %<CR>:e!<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Close buffer
nnoremap <leader>Q :bd<CR>

" Save and quit
nnoremap <Leader>x :x<CR>

" Jump to previous buffer
nnoremap <leader><tab> :e#<CR>

" toggle spelling
nnoremap <leader>s :set spell!<CR>

" toggle line numbering
nnoremap <leader>N :set number!<CR>

" toggle relative line numbering
nnoremap <leader>n :set relativenumber!<CR>

" toggle cursorline/column
"nnoremap <leader>c :set cursorline!<CR>:set cursorcolumn!<CR>

" netrw
nnoremap <leader>d :Lex<CR>
nnoremap <leader>h :Hex<CR>

" Toggle TAB and EOL symbols
"nnoremap <leader>l :set list!<CR>

nnoremap <leader>e :e 
nnoremap <leader>% :vsplit 
nnoremap <leader>" :split 

" shortcuts to commonly used files
nnoremap <leader>CC :e $MYVIMRC<CR>
nnoremap <leader>CO :e ~/.vim/plugin/
nnoremap <leader>CK :e ~/.vim/plugin/keybinds.vim<CR>
nnoremap <leader>CA :e ~/.vim/plugin/appearance.vim<CR>
nnoremap <leader>CP :e ~/.vim/plugins.vim<CR>
nnoremap <leader>T :e ~/doc/todo.md<CR>
nnoremap <leader>B :e `kpsexpand '$TEXMFHOME'`/bibtex/bib/myfiles/BIB.bib<CR>

nnoremap <leader>r :ScholarRef 

" insert date and time
nnoremap <leader>D :read !date<CR>

" job execution
nnoremap <leader>m :Make<CR>
nnoremap <leader>M :Make!<CR>
nnoremap <leader>! :Start! 
nnoremap <leader>c :Copen<CR>

" toggle x mark in checklist fields
nnoremap <leader>X :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]': '[x]'/<CR>:noh<CR>

" toggle view of completed items in todo (using vim-foldsearch)
nnoremap <leader>u :Fp ^- \[ \]<CR>
nnoremap <leader>U :Fe<CR>

if exists(':tnoremap')
    " escape from terminal mode
    tnoremap <Esc> <C-\><C-n>

    " send escape to terminal
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>

    " navigate away from terminals
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
end

" launch terminal in current window
"nnoremap <leader><CR> :terminal bash<CR>
nnoremap <leader><CR> :terminal<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" equal split size
nnoremap <leader>= <C-w>=

" bindings to git cmd
"nmap <leader>g :Start git commit -a -v -S<CR>
"nmap <leader>G :Start git commit -a -v -S && git push<CR>

" bindings to fugitive
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gm :Gmove 
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gw :Gbrowse<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -S<CR>
nnoremap <leader>gp :Gpush<CR>

" Use home row keys as Esc
inoremap jk <Esc>
inoremap lkj <Esc>:write<CR>

" Improve navigation on wrapped lines
"nnoremap j gj
"nnoremap k gk

" Disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Update ctags
"nnoremap <leader>c :Start ctags -R --python-kinds=-i --langmap=c++:.cu,c++:.cuh .<CR>

" file search
if executable("rg")
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)
    nnoremap <Leader>a :Rg<CR>
elseif executable("ag")
    nnoremap <Leader>a :Ag<CR>
end

" using fzf.vim
nnoremap , :Buffers<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>F :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>L :BLines<CR>
nnoremap <leader>t :Tags<CR>

" Copy and paste to system clipboard with <Space>v and <Space>y
xnoremap <Leader>y "+y
xnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>v "+p
xnoremap <Leader>V "+P

" align things into columns interactively
xnoremap <silent> <Enter> :EasyAlign<cr>

nnoremap <leader>S :Startify<cr>
let g:startify_custom_header =
            \ map(split(system('fortune -s | cowthink'), '\n'), '"   ".v:val') 
            \ + ['','']

" lookup word under cursor, dismiss results with q
nnoremap <leader>J :OnlineThesaurusCurrentWord<CR>

" ALE navigation
nnoremap <silent> [W :ALEFirst<cr>
nnoremap <silent> [w :ALEPreviousWrap<cr>
nnoremap <silent> ]w :ALENextWrap<cr>
nnoremap <silent> ]W :ALELast<cr>

" Add completion bindings (cycle with C-n, C-p), see :h ins-completion
" <C-x><C-l>: while line
" <C-x><C-n>: keywords in current file
" <C-x><C-i>: keywords in current and included files
" <C-x><C-k>: keywords in dictionary (:set dictionary)
" <C-x><C-t>: keywords in thesaurus (not functional)
" <C-x><C-]>: tags
" <C-x><C-f>: file names
" <C-x><C-d>: definitions or macros
" <C-x><C-v>: vim command-line
" <C-x><C-v>: omni completion
" <C-x>s:     spelling suggestions
" Other:
" <C-x><C-u>: emoji
" <C-x><C-z>: unicode
