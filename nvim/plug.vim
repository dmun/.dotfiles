call plug#begin('~/.config/nvim/autoload')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-startify'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'lilydjwg/colorizer'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
call plug#end()
