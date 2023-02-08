local lsp = require("lsp-zero")

-- lsp.preset("recommended")

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	call_servers = 'local',
	sign_icons = {
		error = '✘',
		warn  = '▲',
		hint  = ' ',
		info  = ''
	}
})


-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = { globals = { 'vim' } }
		}
	}
})


local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-m>'] = cmp.mapping.confirm({ select = true }),
	-- ['<tab>'] = cmp.mapping.confirm({ select = true }),
	["<C-y>"] = cmp.config.disable,
	["<C-e>"] = cmp.config.disable,
	["<C-Space>"] = cmp.mapping.complete(),
})


lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})



lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>1", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>fs", vim.lsp.buf.format)
	vim.keymap.set("v", "<leader>fs", vim.lsp.buf.format)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader><enter>", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})






-- lsp.ensure_installed({
-- 	'sumneko_lua',
-- 	'rust_analyzer',
-- })

-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--
--
--
--
-- lsp.set_preferences({
--   set_lsp_keymaps = false,
--   sign_icons = {
--     error = '✘',
--     warn  = '▲',
--     hint  = ' ⚑',
--     info  = ''
--   }
-- })
