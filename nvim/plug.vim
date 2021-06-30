call plug#begin('~/.config/nvim/autoload')
    " Colors
    Plug 'dmun/nvcode-color-schemes.vim'
    Plug 'norcalli/nvim-colorizer.lua'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'kdheepak/lazygit.nvim'

    " IDE like
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'tpope/vim-surround'

    " Appearance
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
    Plug 'akinsho/nvim-bufferline.lua'

    " Misc
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mhinz/vim-startify'
    Plug 'airblade/vim-rooter'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " UML
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'aklt/plantuml-syntax'
call plug#end()
