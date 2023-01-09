vim.g.mapleader = " "

vim.keymap.set('n', '<tab>', '<c-w>w')
vim.keymap.set('n', '<s-tab>', '<c-w>W')
vim.keymap.set('i', '<s-tab>', '<esc><c-w>W')

vim.keymap.set("n", " ", "<nop>")
vim.keymap.set("n", "<leader>dl", vim.cmd.Ex)

vim.keymap.set("i", "<F1>", "<esc>")
vim.keymap.set("i", "<F2>", "<esc>:w<cr>")

vim.keymap.set("n", "<F1>", ":q<cr>")
vim.keymap.set("n", "<F2>", ":w<cr>")

vim.keymap.set('n', '<leader><tab>', vim.cmd.bnext)
vim.keymap.set('n', '<leader><s-tab>', vim.cmd.bprev)

vim.keymap.set('n', 'g.', 'ylP')
vim.keymap.set('n', 'K', 'kJ')

vim.keymap.set('i', '<c-l>', '<esc>')
vim.keymap.set('n', '<c-l>', ':copy.<cr>')

vim.keymap.set('n', '<c-j>', ':move.+1<cr>==')
vim.keymap.set('n', '<c-k>', ':move.-2<cr>==')
vim.keymap.set('v', '<c-j>', ":move'>+1<cr>gv=gv")
vim.keymap.set('v', '<c-k>', ":move'<-2<cr>gv=gv")


-- Black hole registers
vim.keymap.set('n', '<leader>s', '"_s')
vim.keymap.set('v', '<leader>s', '"_s')
vim.keymap.set('n', '<leader>x', '"_x')
vim.keymap.set('v', '<leader>x', '"_x')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>dd', '"_dd')
vim.keymap.set('n', '<leader>D', '"_D')
vim.keymap.set('n', '<leader>C', '"_C')
vim.keymap.set('n', '<leader>S', '"_S')
vim.keymap.set('n', '<leader>b', '"_')
vim.keymap.set('v', '<leader>b', '"_')

vim.keymap.set('v', '<leader>p', '"_dP')


-- Scroll screen and move the cursor in the opposite direction
vim.keymap.set('n', '<c-q>',   '<c-y>gk')
vim.keymap.set('n', '<c-s>',   '<c-e>gj')

vim.keymap.set('n', '<leader>lw', function ()
	vim.opt.wrap = not vim.opt.wrap:get()
end)


-- Disable/Enable highlight in search
vim.keymap.set('n', '<f8>', ':set hlsearch!<cr>', {silent=true})


-- Break undo sequence, start new change. See i_CTRL-G_u
vim.keymap.set('i', '<space>', '<space><c-g>u')
vim.keymap.set('i', '<cr>', '<cr><c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ',', ',<c-g>u')

-- Indent/Unindent and reselect
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')




-- Change a misspelling word to the first vim suggestion
vim.keymap.set('n', '<leader>=', '1z=')



local bgcolor = nil
vim.keymap.set('n', '<f5>', function ()
	if bgcolor == nil then
		bgcolor = 'black'
	else
		bgcolor = nil
	end
	vim.api.nvim_set_hl(0, "Normal", { bg = bgcolor })
end)



vim.keymap.set('n', '<f6>', function ()
	ToggleShowBreaks('  → ')
	ToggleShowBlanks()
end)















vim.keymap.set('n', '<f4>', function() -- ZenMode Distraction Free Writing
	require("zen-mode").toggle({
		window = {
			width = .5 -- width will be x% of the editor width
		}
	})
end)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.git_files)
vim.keymap.set('n', '<leader>gr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end) -- Needs sudo pacman -S ripgrep


vim.keymap.set("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<F21>', ':set spell!<cr>')

vim.keymap.set('n', 'm', 'i<cr><esc>')
vim.keymap.set('n', '<leader>m', 'o<esc>')
vim.keymap.set('n', '<leader>M', 'O<esc>')

vim.keymap.set('n', '<bs>', 'g;')

-- Comments
vim.keymap.set('n', '<leader>;',  [[:call nerdcommenter#Comment(0,"toggle")<cr>]])
vim.keymap.set('v', '<leader>;',  [[:call nerdcommenter#Comment(0,"sexy")<cr>]])
vim.keymap.set('n', '<leader>cs', [[:call nerdcommenter#Comment(0,"sexy")<cr>]])
vim.keymap.set('n', '<leader>A',  [[:call nerdcommenter#Comment(0,"append")<cr>]])
vim.keymap.set('n', '<leader>I',  [[:call nerdcommenter#Comment(0,"insert")<cr>i]])


vim.keymap.set('n', '<leader><F2>', function()
vim.cmd.write()
	vim.cmd.source()
	print("source")
end)


-- Toogle Status Bar
vim.keymap.set('n', '<F12>', function()
	local ll = vim.api.nvim_get_option('laststatus')

	if ll >= 2 then
		vim.opt.laststatus = 0
		vim.opt.showmode = true
	else
		vim.opt.laststatus = 2
		vim.opt.showmode = false
	end

	print('laststatus ' .. ll)
end)


-- Change Status Bar
vim.keymap.set('n', '<F24>', function()
	local ll = vim.api.nvim_get_option('laststatus')

	if ll == 3 then ll = 0 else ll = ll + 1 end

	vim.opt.laststatus = ll

	print('laststatus ' .. ll)

	if ll >= 2 then
		vim.opt.showmode = false
	else
		vim.opt.showmode = true
	end
end)






