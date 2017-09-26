""" Keyboard shortcuts

" Save with ZX
nmap ZX :w<CR>

" use , instead of \ as leader
"let mapleader=","
" use space instead of \ as leader
let mapleader="\<Space>"

" Shortcut to reload .vimrc
nmap <leader>R :source $MYVIMRC<CR>

" Shortcut to switch background color
"nmap <leader>W :ToggleBG<CR>

" Save file
nmap <Leader>w :w<CR>
nmap <Leader>W :w !sudo tee > /dev/null %<CR>:e!<CR>

" Quit
nmap <Leader>q :q<CR>

" Native (fast) buffer switching
nnoremap ,b :ls<CR>:buffer<Space>

" Close buffer
nmap <leader>Q :bd<CR>

" Save and quit
nmap <Leader>x :x<CR>

" Jump to previous buffer
nmap <leader><tab> <C-^>

" Explore buffers
"nmap <leader>b :BufExplorer<CR>

" toggle spelling
nmap <leader>s :set spell!<CR>

" toggle line numbering
nmap <leader>n :set number!<CR>

" toggle relative line numbering
nmap <leader>N :set relativenumber!<CR>

" NERD Tree short cut
nmap <leader>d :NERDTreeToggle<CR>

" Toggle TAB and EOL symbols
nmap <leader>l :set list!<CR>

nmap <leader>e :e 
nmap <leader>% :vsplit 
nmap <leader>" :split 

" shortcuts to commonly used files
nmap <leader>C :e $MYVIMRC<CR>
"nmap <leader>T :e ~/doc/todo.org<CR>
nmap <leader>T :e ~/doc/todo.md<CR>
nmap <leader>B :e ~/articles/own/BIBnew.bib<CR>
nmap <leader>A :e ~/articles/articles.rst<CR>

nmap <leader>r :read !scholarref.py 

" insert date and time
nmap <leader>D :read !date<CR>

" job execution
nmap <leader>m :Make 
nmap <leader>E :VimProcRead 
nmap <leader>! :Start! 


" Switch split focus with leader+hjkl
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" toggle x mark in checklist fields
nmap <leader>X :s/\[[x ]\]/\=submatch(0) == '[x]' ? '[ ]': '[x]'/<CR>:noh<CR>

" toggle view of completed items in todo (using vim-foldsearch)
nmap <leader>u :Fp ^- \[ \]<CR>
nmap <leader>U :Fe<CR>

" neovim-specific mappings
if has('nvim')
    " escape from terminal mode
    tnoremap <leader>e <C-\><C-n>

    " navigate away from terminals
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " launch terminal in current window
    nmap <leader><CR> :terminal<CR>
endif

" Switch split focus with Alt+{h,j,k,l}
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" equal split size
nmap <leader>= <C-w>=

" Commit all changes
"nmap <leader>g :Gcommit<CR>
nmap <leader>g :Start git commit -a -v -S<CR>
nmap <leader>G :Start git commit -a -v -S && git push<CR>

" Toggle fold
nmap <leader>f za
" Toggle all folds
nmap <leader>F zA
"nmap <leader>Fa zR
"nmap <leader>FA zM
" zc: close a fold
" zo: open a fold
" za: toggle a fold
" zM: close all folds
" zR: open all folds

" Switch split focus with <C-h>, <C-j>, <C-k> and <C-l>
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Use home row keys as Esc
inoremap jk <Esc>
inoremap lkj <Esc>:write<CR>

" Improve navigation on wrapped lines
"nnoremap j gj
"nnoremap k gk

map <leader>E <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
"map  <leader>f <Plug>(easymotion-bd-f)
"nmap <leader>f <Plug>(easymotion-overwin-f)
map  <leader><leader> <Plug>(easymotion-bd-f)
nmap <leader><leader> <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char} (conflicts with spell)
"nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
"map <leader>L <Plug>(easymotion-bd-jk)
"nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <leader>W <Plug>(easymotion-bd-w)
"nmap <leader>W <Plug>(easymotion-overwin-w)

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" show/hide tagbar
"nmap <leader>t :TagbarToggle<CR>

" Update ctags
nmap <leader>c :Start ctags -R --python-kinds=-i --langmap=c++:.cu,c++:.cuh .<CR>
" useful tags commands:
" :tag or :ta <function> Go to definition of the function
" :ts or :tselect Show the list of tags
" When the cursor is on a function call, press <Ctrl-[> to go to its definition.
" Press <Ctrl-t> to go back
" Use the Ctrl-P plugin to search the tags
"nmap <leader>P :CtrlPTag<CR>
"nmap <leader>b :CtrlPBuffer<CR>
"nmap <leader>O :CtrlPMRUFiles<CR>
"nmap <leader>o :CtrlP<CR>

" using fzf.vim
nmap <leader>b :Buffers<CR>
nmap <leader>O :History<CR>
nmap <leader>o :Files<CR>
nmap <leader>l :Lines<CR>
nmap <leader>L :BLines<CR>
nmap <leader>t :Tags<CR>

" use git or silver searcher (ag) for CtrlP autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" Copy and paste to system clipboard with <Space>v and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>v "+p
nmap <Leader>V "+P
vmap <Leader>v "+p
vmap <Leader>V "+P

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" align things into columns interactively
vnoremap <silent> <Enter> :EasyAlign<cr>

nmap <leader>S :Startify<cr>
let g:startify_custom_header =
            \ map(split(system('fortune -s | cowthink'), '\n'), '"   ".v:val') 
            \ + ['','']

nnoremap <leader>M :CtrlPMpc<cr>
