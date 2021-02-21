call plug#begin('~/.config/nvim/autoload')
    Plug 'morhetz/gruvbox'
    Plug 'franbach/miramare'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()
