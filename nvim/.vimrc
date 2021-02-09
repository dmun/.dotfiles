" Vim settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showtabline=2
set noshowmode
set nowrap

" Color settings
syntax on
colorscheme onedark
set background=dark

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" CTRL-P to show files with fzf
nnoremap <C-p> :GFiles<CR>

" Navigating buffers with TAB and SHIFT-TAB
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

" Resizing windows
nnoremap <C-w><C-j> :resize +2<CR>
nnoremap <C-w><C-k> :resize -2<CR>
nnoremap <C-w><C-h> :vertical resize -2<CR>
nnoremap <C-w><C-l> :vertical resize +2<CR>

" Show the correct cursor for Vim modes (Windows Terminal)
" let &t_SR.="\e[4 q"
" let &t_EI.="\e[1 q"
