call plug#begin('~/.config/nvim/autoload')
    " Colors
    Plug 'dmun/nvcode-color-schemes.vim'
    Plug 'norcalli/nvim-colorizer.lua'

    " Git
    Plug 'airblade/vim-gitgutter'

    " IDE like
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'tpope/vim-surround'

    " Appearance
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
    Plug 'romgrk/barbar.nvim'

    " Plug 'nvim-lua/popup.nvim'
    " Plug 'nvim-lua/plenary.nvim'

    " Misc
    Plug 'mhinz/vim-startify'
    Plug 'folke/which-key.nvim'
    Plug 'airblade/vim-rooter'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'nvim-telescope/telescope.nvim'

    " UML
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'aklt/plantuml-syntax'
call plug#end()
