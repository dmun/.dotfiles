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

" CTRL-P to show files with fzf
" nnoremap <C-p> :GFiles<CR>
nnoremap <silent><leader>p :GFiles<CR>

" Navigating buffers with TAB and SHIFT-TAB
" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprev<CR>
nnoremap <TAB> :BufferNext<CR>
nnoremap <S-TAB> :BufferPrevious<CR>

" Window management
nnoremap <M-j> <C-w>w
nnoremap <M-k> <C-w>W
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
nnoremap <M-q> <C-w>q

" Resizing windows
nnoremap <C-w><C-j> :resize +5<CR>
nnoremap <C-w><C-k> :resize -5<CR>
nnoremap <C-w><C-h> :vertical resize -5<CR>
nnoremap <C-w><C-l> :vertical resize +5<CR>
