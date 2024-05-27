---@diagnostic disable: undefined-global

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
	},
	tabline = {
		a = { bg = 'none', fg = colors.red },
		b = { bg = 'none', fg = colors.red },
		c = { bg = 'none', fg = colors.red },
		x = { bg = 'none', fg = colors.red },
		y = { bg = 'none', fg = colors.red },
		z = { bg = 'none', fg = colors.red }
	},
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













Tabline_config = {
		lualine_a = {
			{  'tabs',
				component_separators = { left = '', right = '' },
				max_length = vim.o.columns,
				tabs_color = {
					active =   { bg = 'none', fg = 'none' },
					inactive = { bg = 'none', fg = colors.gray },
				},
				mode=2,
				symbols = { modified = '' },
				fmt = function(name, context)
					-- Show + if buffer is modified in tab
					local buflist = vim.fn.tabpagebuflist(context.tabnr)
					local winnr = vim.fn.tabpagewinnr(context.tabnr)
					local bufnr = buflist[winnr]
					local mod = vim.fn.getbufvar(bufnr, '&mod')

					return name .. (mod == 1 and ' ●' or ' ')
				end
			},
		},
	}


Statusline_options ={
	component_separators = { left = ' ⃓', right = ' ⃓' },
	icons_enabled = false,
	theme = ojf,
}

Statusline_config = {
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



function ConfigLuaLine(laststatus, showtabline)
	local config = {}

	if laststatus > 0 then
		config = Statusline_config
	else
		config = {sections={}, inactive_sections={}}
	end

	if showtabline > 0 then
		config.tabline = Tabline_config
	end

	config.options = Statusline_options

	return config
end



-- local myconf = ConfigLuaLine(0, 1)
-- require('lualine').setup(myconf)





return {
    ConfigLuaLine = ConfigLuaLine
}





-- require('lualine').setup(Lualine_options)
-- require('lualine').setup({tabline = Tabline_options})
-- require('lualine').hide()

