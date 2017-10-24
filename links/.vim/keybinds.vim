""" Keyboard shortcuts

" Formatting options are prefixed by backslash
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>

" Save with ZX
nmap ZX :w<CR>

" use space instead of \ as leader
let mapleader="\<Space>"

" Shortcut to reload .vimrc
nmap <leader>R :source $MYVIMRC<CR>

" toggle distraction-free editing
nmap <leader>y :set nolist<CR>:Goyo<CR>
nmap <leader>Y :set nolist<CR>:Goyo!<CR>:source $MYVIMRC<CR>

" Save file
nmap <Leader>w :w<CR>
nmap <Leader>W :w !sudo tee > /dev/null %<CR>:e!<CR>

" Quit
nmap <Leader>q :q<CR>

" Close buffer
nmap <leader>Q :bd<CR>

" Save and quit
nmap <Leader>x :x<CR>

" Jump to previous buffer
nmap <leader><tab> :e#<CR>

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
nmap <leader>T :e ~/doc/todo.md<CR>
nmap <leader>B :e `kpsexpand '$TEXMFHOME'`/bibtex/bib/myfiles/BIB.bib<CR>

nmap <leader>r :read !scholarref.py 

" insert date and time
nmap <leader>D :read !date<CR>

" job execution
nmap <leader>m :Make 
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
endif

" launch terminal in current window
nmap <leader><CR> :terminal bash<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" equal split size
nmap <leader>= <C-w>=

" bindings to git cmd
"nmap <leader>g :Start git commit -a -v -S<CR>
"nmap <leader>G :Start git commit -a -v -S && git push<CR>

" bindings to fugitive
nmap <leader>ga :Gwrite<CR>
nmap <leader>gm :Gmove 
nmap <leader>gb :Gblame<CR>
nmap <leader>gw :Gbrowse<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit -v -S<CR>
nmap <leader>gp :Git push<CR>

" Use home row keys as Esc
inoremap jk <Esc>
inoremap lkj <Esc>:write<CR>

" Improve navigation on wrapped lines
"nnoremap j gj
"nnoremap k gk

map <leader>E <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <leader><leader> <Plug>(easymotion-bd-f)
nmap <leader><leader> <Plug>(easymotion-overwin-f)

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Update ctags
nmap <leader>c :Start ctags -R --python-kinds=-i --langmap=c++:.cu,c++:.cuh .<CR>

" file search
if executable("rg")
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)
    nmap <Leader>a :Rg<CR>
elseif executable("ag")
    nmap <Leader>a :Ag<CR>
end

" using fzf.vim
nmap , :Buffers<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>F :History<CR>
nmap <leader>f :Files<CR>
nmap <leader>l :Lines<CR>
nmap <leader>L :BLines<CR>
nmap <leader>t :Tags<CR>

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

