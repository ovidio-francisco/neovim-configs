---@diagnostic disable: undefined-global, unused-local
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n", "gd",              function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "<leader>h",       function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "<leader>vws",     function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>1",       function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "<leader>rf",      function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>fs",      function() vim.lsp.buf.format()     end, opts)
  -- vim.keymap.set("v", "<leader>fs",      function() vim.lsp.buf.format()     end, opts)
  -- vim.keymap.set("n", "]d",              function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "[d",              function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader><enter>", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>ca",      function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>R",       function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>",           function() vim.lsp.buf.signature_help() end, opts)


  vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

end)


lsp_zero.set_sign_icons({
	error = '✘',
	warn  = '▲',
	hint  = ' ',
	info  = ''
})


--      ✘ ▲   💩


vim.diagnostic.config({
     signs            = true,
     underline        = true,
     update_in_insert = false,
	 severity_sort    = true,

	 virtual_text = {
		 prefix = '',
		 suffix = '',
		 spacing = 15,
		 format = function(diagnostic)
			 local icon = ''
			 local message = diagnostic.message

			 if     diagnostic.severity == vim.diagnostic.severity.ERROR then
				 icon = '💩'
			 elseif diagnostic.severity == vim.diagnostic.severity.WARN then
				 icon = '▲'
			 elseif diagnostic.severity == vim.diagnostic.severity.HINT then
				 icon = ''
			 elseif diagnostic.severity == vim.diagnostic.severity.INFO then
				 icon = ''
			 end

			 return string.format('%s  %s', icon, message)
		 end
	 }
})


require('toggle_lsp_diagnostics').init(vim.diagnostic.config())


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
	  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	  ['<C-m>'] = cmp.mapping.confirm({ select = true }),
	  ['<C-c>'] = cmp.mapping.confirm({ select = true }),
	  ['<f10>'] = cmp.mapping.confirm({ select = true }),
	  ['<CR>']  = cmp.mapping.confirm({ select = true }),
	  ['<tab>'] = cmp.mapping.confirm({ select = true }),
	  ["<C-y>"] = nil,
	  ["<C-e>"] = nil,
	  ['<C-Space>'] = cmp.mapping.complete(),
  }),
})




