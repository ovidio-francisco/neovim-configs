---@diagnostic disable: undefined-global

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'u',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', 's',     api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-s>', api.node.run.system,                   opts('Run System'))

end


require("nvim-tree").setup({
	on_attach = my_on_attach,
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

	--[[ view = {
	   [     signcolumn = "yes",
	   [     mappings = {
	   [         list = {
	   [             { key = "u", action = "dir_up" },
	   [             { key = "v", action = "vsplit" },
	   [         },
	   [     },
	   [ },   ]]
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
				modified = "+",
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
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		}, 
		icons = {
			hint = "",
			info = "",
			warning = "▲",
			error = "✘",
		},
	},
	  modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
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
