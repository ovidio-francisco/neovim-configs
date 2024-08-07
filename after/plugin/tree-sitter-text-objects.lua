---@diagnostic disable: undefined-global

require'nvim-treesitter.configs'.setup {
  textobjects = {

    select = {
      enable = true,

	  lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
	  include_surrounding_whitespace = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },

      selection_modes = {
		['@function.outer'] = 'V',
		-- ['@parameter.outer'] = 'v', -- charwise
        -- ['@class.outer'] = '<c-v>', -- blockwise
      },
    },

    swap = {
      enable = true,
      swap_previous = {
        ["<leader>,"] = "@parameter.inner",
      },
      swap_next = {
        ["<leader>."] = "@parameter.inner",
      },
    },


    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist

      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },

      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },

      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },

      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },

      goto_next = {
        ["]d"] = "@conditional.outer",
      },

      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },

  },
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)


-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })


