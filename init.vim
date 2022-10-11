let g:python_host_skip_check=1
let g:python_host_prog='d:\python27\python.exe'

let g:python3_host_skip_check=1
let g:python3_host_prog='d:\python368\python3.exe'

" Pakcer

" git clone https://github.com/wbthomason/packer.nvim \"$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
" this plugins.lua file is in ~/.config/nvim/lua/plugins.lua
lua require('plugins')


" setting before plugins load
" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimpector_base_dir='C:\Users\TJT006\AppData\Local\nvim\plugged\vimspector'

" Plugins load
call plug#begin('C:\Users\TJT006\AppData\Local\nvim\plugged')

Plug 'thinca/vim-quickrun'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'ycm-core/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'

call plug#end()

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = '/'
let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = '|'

" ctrlp
let g:ctrlp_map = '<leader><space>'

" MRU ( most recently used)
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Window_Height = 15
nnoremap <c-m> :MRU<CR>

" Theme
if has('termguicolors')
    set termguicolors
endif
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
colorscheme sonokai



" NerdTree settings
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize=40

let mapleader=';'

" Encoding
set encoding=utf-8

" Line settings
set wrap
set number
set cursorline
set display+=lastline
set noswapfile

" Searching settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab settings
set tabstop=4
set sts=4
set noexpandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set foldmethod=indent
set foldlevel=101

" Key bind changes
map <C-s> :w <CR>
map t :NERDTreeToggle<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-k> 10k
nnoremap <C-j> 10j
nnoremap <leader>k <C-f>
nnoremap <leader>j <C-b>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-h> 0
nnoremap <C-l> $
nnoremap <C-a> <esc>gg<S-v>G
nnoremap <C-;> <esc>g_<S-a>;<esc>

" Leader key binding
nnoremap <leader>b :ls<CR>:b 
nnoremap <leader>s :w<CR>:source $MYVIMRC<CR>
nnoremap <leader>w :set wrap<CR>
nnoremap <leader>m :e $MYVIMRC<CR>
nnoremap <leader>t gt
nnoremap <leader>p "+gp

" Quick close function doc window
inoremap <A-w> <esc><C-w>k :q<CR>a
nnoremap <A-w> <C-w>k :q<CR>

inoremap <leader>w <esc><C-w>k :q<CR>a
nnoremap <leader>w <C-w>k :q<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k
tnoremap <leader>l <C-\><C-N><C-w>l
inoremap <leader>h <C-\><C-N><C-w>h
inoremap <leader>j <C-\><C-N><C-w>j
inoremap <leader>k <C-\><C-N><C-w>k
inoremap <leader>l <C-\><C-N><C-w>l
nnoremap <leader>t <C-w>v:terminal<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
