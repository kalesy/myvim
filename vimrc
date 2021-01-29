" gvim launch setting
if has('gui_running')
    winpos 0 0
    set lines=60 columns=96
endif

syntax on
" nerdTree
let NERDTreeIgnore=['\.pyc$', '\~$']
map <S-t> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=35
colorscheme desert
let mapleader=" "
" about encoding
set encoding=utf-8
set splitbelow
set splitright
set nobackup
set gfn=Consolas:h12
set guioptions-=m
set guioptions-=T
set encoding=utf-8
" 不显示行尾符号$和制表符^I
set backspace=indent,eol,start
set nolist
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
language message zh_CN.utf-8
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set nocompatible
" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
set number
set relativenumber
set wrap
set showcmd
" about searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" tab settings
set tabstop=4
set sts=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
" fold
set foldmethod=indent
set foldlevel=99
" automatics
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap < <><esc>i
inoremap { {}<esc>i
inoremap <C-h> <esc>ha
inoremap <C-j> <esc>ja
inoremap <C-k> <esc>ka
inoremap <C-l> <esc>la
inoremap <C-s> <esc>:w<CR>
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
" remap keys
nnoremap ; :<esc>g_
nnoremap <C-s> :w<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> 5<C-e>
nnoremap <C-k> 5<C-y>
nnoremap <C-a> <esc>gg<S-v>G
nnoremap <C-b> :ls<CR>:
nnoremap <leader>q :q<CR>

" python 
let python_highlight_all = 1
nnoremap <silent> <leader>b :call SaveAndExecutePython()<CR>
inoremap <silent> <leader>b :<C-u>call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

" syntastic 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"YCM
nnoremap <leader>y :YcmCompleter<space>
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'skywind3000/asyncrun.vim'
Plug 'preservim/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tmhedberg/SimpylFold'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

