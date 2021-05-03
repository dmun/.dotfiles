call plug#begin('~/.config/nvim/autoload')
    " Colors
    Plug 'dmun/nvcode-color-schemes.vim'
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}

    " Misc
    Plug 'mhinz/vim-startify'
    Plug 'folke/which-key.nvim'

    " UML
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'aklt/plantuml-syntax'
call plug#end()
