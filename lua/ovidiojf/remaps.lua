---@diagnostic disable: undefined-global

vim.keymap.set('n', '<f9>', ':silent ToggleDiag<cr>')

vim.keymap.set("n", "gd",              function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>h",       function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws",     function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>rf",      function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>fs",      function() vim.lsp.buf.format()     end, opts)
vim.keymap.set("v", "<leader>fs",      function() vim.lsp.buf.format()     end, opts)
vim.keymap.set("n", "<leader><enter>", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>ca",      function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<S-F2>",          function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>",           function() vim.lsp.buf.signature_help() end, opts)
vim.keymap.set("n", "]d",              function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "[d",              function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>1",       function() vim.diagnostic.open_float() end, opts)



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff',  builtin.find_files)
vim.keymap.set('n', '<leader>fb',  builtin.buffers)
vim.keymap.set('n', '<leader>fd',  builtin.diagnostics)
vim.keymap.set('n', '<leader>frf', builtin.lsp_references)
vim.keymap.set('n', '<leader>fws', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>gf',  builtin.git_files)
vim.keymap.set('n', '<leader>gc',  builtin.git_commits)
vim.keymap.set('n', '<leader>gs',  builtin.git_status)
vim.keymap.set('n', '<leader>fc',  builtin.colorscheme)
vim.keymap.set('n', '<leader>fk',  builtin.keymaps)
vim.keymap.set('n', '<leader>fhl', builtin.highlights)
vim.keymap.set('n', '<leader>fg',  function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end) -- Needs sudo pacman -S ripgrep


local bgcolor = nil
vim.keymap.set('n', '<f5>', function()
	if bgcolor == nil then
		bgcolor = 'black'
	else
		bgcolor = nil
	end
	vim.api.nvim_set_hl(0, 'Normal', { bg = bgcolor })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = bgcolor })
end)

vim.keymap.set('n', '<f4>', function() -- ZenMode Distraction Free Writing
	require("zen-mode").toggle({
		window = {
			width = .5 -- width will be x% of the editor width
		}
	})
end)



vim.keymap.set('n', '<f3>', ':NvimTreeToggle<cr>', { silent = true })
vim.keymap.set('n', '<s-f3>', ':AerialToggle<cr>', { silent = true })



-- Toogle Status Bar
vim.keymap.set('n', '<F12>', function()
	local ll = vim.api.nvim_get_option('laststatus')

	if ll == 0 then
		ll = 2
		print("Status bar: always")
	elseif ll == 1 then
		ll = 0
		print("Status bar: never")
	elseif ll == 2 then
		ll = 1
		print("Status bar: if splitted")
	end

	if ll > 0 then
		local lualine_conf = require('ovidiojf.lualine_config')
		local conf = lualine_conf.ConfigLuaLine(1, 0)
		require('lualine').setup(conf)
	end

	vim.opt.laststatus = ll
end)



-- Toogle Tab Bar
vim.keymap.set('n', '<F11>', function()

	local stl = vim.api.nvim_get_option('showtabline')

	if stl == 0 then
		stl = 2
		print("Tabline: always")
	elseif stl == 1 then
		stl = 0
		print("Tabline: never")
	elseif stl == 2 then
		stl = 1
		print("Tabline: if more than 1 tab pages")
	end

	if stl > 0 then
		local lualine_conf = require('ovidiojf.lualine_config')
		local conf = lualine_conf.ConfigLuaLine(0, 1)
		require('lualine').setup(conf)
	end

	require('lualine').hide({
		place = {'tabline'}, -- The segment this change applies to.
		unhide = stl > 0,  -- whether to re-enable lualine again/
	})

	  vim.opt.showtabline = stl
end)


-- Toogle Win Bar
-- vim.keymap.set('n', '<F10>', function()

-- end)




















	-- local lualine_conf = require('ovidiojf.lualine_config')
	-- local myconf = lualine_conf.ConfigLuaLine(0, ShowTabLine)
	-- require('lualine').setup(myconf)



-- ll = vim.api.nvim_get_option('laststatus')
-- stl = vim.api.nvim_get_option('showtabline')

-- vim.keymap.set('n', '<leader><tab>', vim.cmd.bnext)
-- vim.keymap.set('n', '<leader><s-tab>', vim.cmd.bprev)
-- vim.keymap.set('n', '<leader>b', ':b ')

-- vim.keymap.set('n', 'g.', 'ylP')
-- vim.keymap.set('n', 'K', 'kJ')

-- vim.keymap.set('i', '<c-l>', '<esc>')
-- vim.keymap.set('n', '<c-l>', ':copy.<cr>')
-- vim.keymap.set('n', 'gl', ':copy.<cr>')

-- vim.keymap.set('n', '<c-j>', ':move.+1<cr>==')
-- vim.keymap.set('n', '<c-k>', ':move.-2<cr>==')
-- vim.keymap.set('v', '<c-j>', [[:move'>+1<cr>gv=gv]])
-- vim.keymap.set('v', '<c-k>', [[:move'<-2<cr>gv=gv]])


-- -- Black hole registers
-- vim.keymap.set('n', '<leader>s', '"_s')
-- vim.keymap.set('v', '<leader>s', '"_s')
-- vim.keymap.set('n', '<leader>x', '"_x')
-- vim.keymap.set('v', '<leader>x', '"_x')
-- vim.keymap.set('v', '<leader>d', '"_d')
-- vim.keymap.set('n', '<leader>dd', '"_dd')
-- vim.keymap.set('n', '<leader>D', '"_D')
-- vim.keymap.set('n', '<leader>C', '"_C')
-- vim.keymap.set('n', '<leader>S', '"_S')
-- vim.keymap.set('n', '<leader>B', '"_')
-- vim.keymap.set('v', '<leader>B', '"_')

-- vim.keymap.set('v', '<leader>p', '"_dP')


-- -- Scroll screen and move the cursor in the opposite direction
-- vim.keymap.set('n', '<c-q>', '<c-y>gk')
-- vim.keymap.set('n', '<c-s>', '<c-e>gj')


-- -- Break undo sequence, start new change. See i_CTRL-G_u
-- vim.keymap.set('i', '<space>', '<space><c-g>u')
-- -- vim.keymap.set('i', '<cr>', '<cr><c-g>u')
-- vim.keymap.set('i', '.', '.<c-g>u')
-- vim.keymap.set('i', ',', ',<c-g>u')


-- -- Indent/Unindent and reselect
-- vim.keymap.set('v', '<', '<gv')
-- vim.keymap.set('v', '>', '>gv')


-- vim.keymap.set('n', '<f7><f7>', ':set cursorline!<CR>')

-- -- Disable/Enable highlight in search
-- vim.keymap.set('n', '<f8>', ':set hlsearch!<cr>', { silent = true })


-- vim.keymap.set('n', '<leader>lw', function()
	-- vim.opt.wrap = not vim.opt.wrap:get()
-- end)


-- -- Change a misspelling word to the first vim suggestion
-- vim.keymap.set('n', '<leader>=', '1z=')


-- vim.keymap.set("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set('n', '<F21>', ':set spell!<cr>')

-- vim.keymap.set('n', 'm', 'i<cr><esc>')
-- vim.keymap.set('n', '<leader>m', 'o<esc>')
-- vim.keymap.set('n', '<leader>M', 'O<esc>')

-- vim.keymap.set('n', '<bs>', 'g;')

-- -- Comments
-- vim.keymap.set('n', '<leader>;', [[:call nerdcommenter#Comment(0,"toggle")<cr>]])
-- vim.keymap.set('v', '<leader>;', [[:call nerdcommenter#Comment(0,"sexy")<cr>]])
-- vim.keymap.set('n', '<leader>cs', [[:call nerdcommenter#Comment(0,"sexy")<cr>]])
-- vim.keymap.set('n', '<leader>A', [[:call nerdcommenter#Comment(0,"append")<cr>]])
-- vim.keymap.set('n', '<leader>I', [[:call nerdcommenter#Comment(0,"insert")<cr>i]])



-- -- Select a function
-- vim.keymap.set('v', 'af', 'Va{V')

-- -- Clear current line
-- vim.keymap.set('n', '<c-c><c-c>', '0D')


-- vim.keymap.set('n', '<F15>', ':SymbolsOutline<cr>')


-- vim.keymap.set('n', '<F1>', function()
	-- -- [     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then

	-- if #vim.api.nvim_list_wins() == 2 and require('nvim-tree.view').is_visible() then
		-- vim.cmd('NvimTreeClose')
	-- else
		-- vim.cmd('q')
	-- end
-- end)


-- vim.keymap.set('n', '<f7><f8>', function()
	-- if vim.opt.relativenumber:get() then
		-- vim.keymap.set('n', 'j', 'gj')
		-- vim.keymap.set('n', 'k', 'gk')
		-- vim.opt.relativenumber = false
	-- else
		-- vim.keymap.set('n', 'j', 'j')
		-- vim.keymap.set('n', 'k', 'k')
		-- vim.cmd('normal 0')
		-- vim.opt.relativenumber = true
	-- end
-- end)



-- vim.keymap.set('n', '<f6>', function()
	-- ToggleShowBreaks('  → ')
	-- ToggleShowBlanks()
-- end)


-- vim.keymap.set('n', '<leader><F2>', function()
	-- vim.cmd.write()
	-- vim.cmd.source()
	-- print("source")
-- end)


-- -- Toogle Status Bar
-- vim.keymap.set('n', '<F12>', function()
	-- local ll = vim.api.nvim_get_option('laststatus')

	-- if ll >= 2 then
		-- vim.opt.laststatus = 0
		-- vim.opt.showmode = true
	-- else
		-- vim.opt.laststatus = 2
		-- vim.opt.showmode = false
	-- end

	-- print('laststatus ' .. ll)
-- end)


-- -- Change Status Bar
-- vim.keymap.set('n', '<F24>', function()
	-- local ll = vim.api.nvim_get_option('laststatus')

	-- if ll == 3 then ll = 0 else ll = ll + 1 end

	-- vim.opt.laststatus = ll

	-- print('laststatus ' .. ll)

	-- if ll >= 2 then
		-- vim.opt.showmode = false
	-- else
		-- vim.opt.showmode = true
	-- end
-- end)
