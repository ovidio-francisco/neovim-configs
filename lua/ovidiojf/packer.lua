return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim' -- Packer can manage itself

	use "folke/zen-mode.nvim"
	use 'terrortylor/nvim-comment'
	use 'preservim/nerdcommenter'
	use 'tpope/vim-surround'
	use 'dkarter/bullets.vim'
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
	use 'simrat39/symbols-outline.nvim'
	use 'lervag/vimtex'
	use 'jiangmiao/auto-pairs'
	use 'mattn/emmet-vim'


	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				disable_background = true,
				disable_float_background = true,
			})
		end
	})

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}


	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})


	-- https://github.com/ray-x/navigator.lua   -- Promissor 
	-- Source code analysis and navigate tool



end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
