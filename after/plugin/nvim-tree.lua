require("nvim-tree").setup({
	sort_by = "case_sensitive",
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = false,

	respect_buf_cwd = true,

	actions = { open_file = { quit_on_open = true },
		change_dir = {
			restrict_above_cwd = false,
		},
	},

	view = {
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = false,
		icons = {
			symlink_arrow = " → ",
			show = {
				file = false,
				folder = false,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				git = {
					unstaged = "",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		}
	},
	filters = {
		dotfiles = true,
	},
})

-- vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])

--[[ vim.api.nvim_create_autocmd("BufEnter", {
   [   nested = true,
   [   callback = function()
   [     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
   [       vim.cmd "quit"
   [     end
   [   end
   [ }) ]]

-- https://github.com/nvim-tree/nvim-tree.lua/discussions/1115
