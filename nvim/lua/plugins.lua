vim.cmd('packadd packer.nvim')

return require('packer').startup(
	function ()
		use 'wbthomason/packer.nvim'

	--	Colors
		use 'dmun/nvcode-color-schemes.vim'
		use 'norcalli/nvim-colorizer.lua'

	--	Git
		use 'airblade/vim-gitgutter'
		use 'kdheepak/lazygit.nvim'

	--	IDE like
		use 'neoclide/coc.nvim' --, {'branch': 'release'}
		use 'nvim-treesitter/nvim-treesitter'
		use 'tpope/vim-surround'

	--	Appearance
		use 'kyazdani42/nvim-web-devicons'
		use { 'glepnir/galaxyline.nvim', branch = 'main' }
		use 'akinsho/nvim-bufferline.lua'

	--	Misc
		use 'folke/which-key.nvim'
		use 'kyazdani42/nvim-tree.lua'
		use 'mhinz/vim-startify'
		use 'airblade/vim-rooter'
		use 'iamcco/markdown-preview.nvim' --, { 'do': 'cd app && yarn install'  }
		use 'nvim-lua/popup.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'nvim-telescope/telescope.nvim'
	end
)
