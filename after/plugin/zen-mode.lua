require("zen-mode").setup {
	window = {
		--backdrop = 0.55, -- shade the backdrop of the zen window. set to 1 to keep the same as normal
		options = {
			-- signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
		},
	},
	plugins = {
		gitsigns = { enabled = false }, -- disables git signs
	}
}
