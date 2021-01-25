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
" inoremap ; <esc>A;<esc>
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
" remap keys
nnoremap ; :<esc>g_
nnoremap <C-s> :w<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-a> <esc>gg<S-v>G
" python 
let python_highlight_all = 1
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

