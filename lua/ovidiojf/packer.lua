---@diagnostic disable: undefined-global

return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim' -- Packer can manage itself

	use "folke/zen-mode.nvim"
	use 'terrortylor/nvim-comment'
	use 'preservim/nerdcommenter'
	use 'tpope/vim-surround'
	use 'dkarter/bullets.vim'
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
	-- use 'simrat39/symbols-outline.nvim'
	use 'lervag/vimtex'
	-- use 'jiangmiao/auto-pairs'
	use 'mattn/emmet-vim'
	-- use 'xiyaowong/transparent.nvim' -- sometimes is not necessary (rose-pine)




  -- use({
    -- 'stevearc/aerial.nvim',
    -- config = function()
      -- require('aerial').setup({})
      -- vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
    -- end,
  -- })


use({
  "stevearc/aerial.nvim",
  requires = {
	"nvim-tree/nvim-web-devicons",     -- icons (optional, but recommended)
    "nvim-treesitter/nvim-treesitter", -- symbols via TS (optional)
  },
  config = function()
    require("aerial").setup({
      -- Prefer Treesitter, then LSP (README’s default)
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

      -- Use Nerd Font icons automatically if devicons/lspkind is present
      nerd_font = "auto",

      -- Your custom icons (Nerd Font v3 “codicon”-style)
      icons = {
        Class         = "[C]",
        Interface     = "",
        Module        = "",
        Namespace     = "",
        Package       = "",
        Method        = "ƒ",
        Function      = "󰊕",
        Constructor   = "",
        Field         = "󰆨",
        Property      = "",
        Variable      = "",
        Constant      = "",
        String        = "",
        Number        = "#",
        Boolean       = "⊨",
        Array         = "",
        Object        = "⦿",
        Key           = "",
        Null          = "",
        Enum          = "",
        EnumMember    = "",
        Struct        = "",
        Event         = "",
        Operator      = "",
        TypeParameter = "",
        Collapsed     = "",
		-- Number        = "",
		-- Boolean       = "",
        -- Class         = "",
        -- Class         = "𝓒",
        -- Method        = "",
        -- Field         = "",
        -- File          = '󰈔', 
        -- EnumMember    = '',
        -- Macro         = ' ',
      },

      layout = { default_direction = "prefer_right", resize_to_content = true },
    })

  end,
})









-- use { 'mfussenegger/nvim-jdtls' }





	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})


	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}


	--- Themes ---
	use {
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end
	}


	-- use 'folke/tokyonight.nvim'
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
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
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
