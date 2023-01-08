local colors = {
	blue         = '#0083aa',
	gray         = '#4e4e4e',
	white        = '#ffffff',
	pink         = '#ec58a2',
	red          = '#ff0000',
	green        = '#58a258',
	yellow       = '#fe8019',
	darkgray     = '#3c3836',
	lightgray    = '#504945',
	inactivegray = '#7c6f64',
}

local ojf = {
	normal = {
		a = { bg = 'none', fg = colors.blue },
		b = { bg = 'none', fg = colors.gray },
		c = { bg = 'none', fg = colors.gray },
		x = { bg = 'none', fg = colors.gray },
		y = { bg = 'none', fg = colors.white },
		z = { bg = 'none', fg = colors.white }
	},
	insert = {
		a = { bg = 'none', fg = colors.green },
		b = { bg = 'none', fg = colors.gray },
		c = { bg = 'none', fg = colors.gray },
		x = { bg = 'none', fg = colors.gray },
		y = { bg = 'none', fg = colors.white },
		z = { bg = 'none', fg = colors.white }
	},
	visual = {
		a = { bg = 'none', fg = colors.pink },
		b = { bg = 'none', fg = colors.gray },
		c = { bg = 'none', fg = colors.gray },
		x = { bg = 'none', fg = colors.gray },
		y = { bg = 'none', fg = colors.white },
		z = { bg = 'none', fg = colors.white }
	},
	replace = {
		a = { bg = 'none', fg = colors.red },
		b = { bg = 'none', fg = colors.gray },
		c = { bg = 'none', fg = colors.gray },
		x = { bg = 'none', fg = colors.gray },
		y = { bg = 'none', fg = colors.white },
		z = { bg = 'none', fg = colors.white }
	},
	command = {
		a = { bg = 'none', fg = colors.blue },
		b = { bg = 'none', fg = colors.gray },
		c = { bg = 'none', fg = colors.gray },
		x = { bg = 'none', fg = colors.gray },
		y = { bg = 'none', fg = colors.white },
		z = { bg = 'none', fg = colors.white }
	}
}

local function getBufCount()

	local count = 0;

	for _ in pairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		count = count + 1
	end

	return count;
end

local function getVisiblePercent()

	local above = vim.fn.line('w0') - 1 -- first line visible -1
	local below = vim.fn.line('$') - vim.fn.line('w$'); -- last line - last line visible
	-- print ('above = '..above..'  below = '..below)

	if below == 0 then
		if above > 0 then
			return 'Bot'
		else
			return 'All'
		end
	else
		if above == 0 then
			return 'Top'
		else
			local per = above / (above + below) * 100
			return string.format("%2.0d%%%%", per)
		end
	end

	-- https://vi.stackexchange.com/questions/3894/get-percentage-through-file-of-displayed-window
end

local function getLangs()
	if vim.opt.spell:get() then
		return vim.api.nvim_get_option('spelllang')
	end

	return ''
end

require('lualine').setup {
	options = {
		component_separators = { left = ' ⃓', right = ' ⃓' },
		icons_enabled = false,
		theme = ojf,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { { 'filename', symbols = { modified = '+', readonly = 'RO' } } },
		lualine_x = { getBufCount, getLangs, 'encoding', 'fileformat', 'filetype' },
		lualine_y = { getVisiblePercent },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
}








-- https://www.reddit.com/r/neovim/comments/q5z38t/easiest_way_to_find_if_a_buffer_is_hidden/
-- https://www.reddit.com/r/neovim/comments/p6mqij/loading_vimscript_files_from_lua/
-- https://neovim.io/doc/user/api.html#api-buffer
-- https://www.reddit.com/r/neovim/comments/xtynan/show_me_your_statusline_big_plus_if_you_wrote_it/
-- require('lualine').setup()
-- local ojf = require 'lualine.themes.gruvbox'
