" Vim settings
let mapleader=" "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showtabline=2
set noshowmode
set laststatus=0
set nowrap
set cursorline
set mouse=a

" Color settings
syntax on
set termguicolors
colorscheme nvcode
set background=dark

" No highlight
nnoremap <silent><leader>hl :nohl<CR>

" Navigating buffers
nnoremap <silent><M-.> :bnext<CR>
nnoremap <silent><M-,> :bprev<CR>
nnoremap <silent><M-c> :bd<CR>

" Window management
nnoremap <silent><M-j> <C-w>w
nnoremap <silent><M-k> <C-w>W
nnoremap <silent><M-h> <C-w>h
nnoremap <silent><M-l> <C-w>l
noremap <silent><M-v> <C-w>v
noremap <silent><M-s> <C-w>s
noremap <silent><M-q> <C-w>q

" Resizing windows
nnoremap <silent><M-C-j> :resize +5<CR>
nnoremap <silent><M-C-k> :resize -5<CR>
nnoremap <silent><M-C-h> :vertical resize -10<CR>
nnoremap <silent><M-C-l> :vertical resize +10<CR>

" Moving windows
nnoremap <silent><M-J> <C-w>J
nnoremap <silent><M-H> <C-w>H
nnoremap <silent><M-K> <C-w>K
nnoremap <silent><M-L> <C-w>L
