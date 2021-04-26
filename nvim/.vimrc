" Vim settings
let mapleader=" "
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a
set number
set relativenumber
set nowrap
set cursorline
set showtabline=2

set guifont=monospace,Symbols\ Nerd\ Font:h19

" Color settings
syntax on
set termguicolors
colorscheme nvcode
set background=dark

" Navigating buffers
nnoremap <silent><M-n> :bnext<CR>
nnoremap <silent><M-p> :bprev<CR>
nnoremap <silent><M-w> :bd<CR>

" Split/close window
noremap <silent><M-v> <C-w>v
noremap <silent><M-s> <C-w>s
noremap <silent><M-q> <C-w>q

" Navigating windows
nnoremap <silent><M-j> <C-w>w
nnoremap <silent><M-k> <C-w>W
nnoremap <silent><M-h> <C-w>h
nnoremap <silent><M-l> <C-w>l

" Moving windows
nnoremap <silent><M-r> <C-w>r
nnoremap <silent><M-J> <C-w>J
nnoremap <silent><M-H> <C-w>H
nnoremap <silent><M-K> <C-w>K
nnoremap <silent><M-L> <C-w>L

" Resizing windows
nnoremap <silent><M-Down> :resize +5<CR>
nnoremap <silent><M-Up> :resize -5<CR>
nnoremap <silent><M-Left> :vertical resize -10<CR>
nnoremap <silent><M-Right> :vertical resize +10<CR>
