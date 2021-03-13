" Vim settings
let mapleader=" "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showtabline=2
set noshowmode
set nowrap
set cursorline

" Color settings
syntax on
set termguicolors
colorscheme nvcode
set background=dark

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Navigating buffers
nnoremap <M-.> :bnext<CR>
nnoremap <M-,> :bprev<CR>
nnoremap <M-c> :bd<CR>

" Window management
nnoremap <M-j> <C-w>w
nnoremap <M-k> <C-w>W
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l

nnoremap <M-v> <C-w>v
nnoremap <M-s> <C-w>s
nnoremap <M-q> <C-w>q

" Resizing windows
nnoremap <M-C-j> :resize +5<CR>
nnoremap <M-C-k> :resize -5<CR>
nnoremap <M-C-h> :vertical resize -5<CR>
nnoremap <M-C-l> :vertical resize +5<CR>
