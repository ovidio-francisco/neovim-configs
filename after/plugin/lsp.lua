---@diagnostic disable: undefined-global, unused-local

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
end)


--      ✘ ▲   💩         !

lsp_zero.set_sign_icons({
	error = '💩',
	warn  = '▲',
	hint  = ' ',
	info  = ''
})


--            ✘ ▲  💩

vim.diagnostic.config({
	 signs            = true,
	 underline        = true,
	 update_in_insert = true,
	 severity_sort    = true,

	 virtual_text = {
		 prefix = '',
		 suffix = '',
		 spacing = 15,
		 format = function(diagnostic)
			 local icon = ''
			 local message = diagnostic.message

			 if     diagnostic.severity == vim.diagnostic.severity.ERROR then icon = '✘'
			 elseif diagnostic.severity == vim.diagnostic.severity.WARN  then icon = '▲'
			 elseif diagnostic.severity == vim.diagnostic.severity.HINT  then icon = ''
			 elseif diagnostic.severity == vim.diagnostic.severity.INFO  then icon = ''
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
	  ['<CR>']  = cmp.mapping.confirm({ select = true }),
	  ["<C-y>"] = nil,
	  ["<C-e>"] = nil,
	  ['<C-Space>'] = cmp.mapping.complete(),
  }),
})



-- local jdtls = require('jdtls')

-- local root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'pom.xml'})
-- local home = os.getenv('HOME')

-- local config = {
  -- cmd = { 'jdtls' },
  -- root_dir = root_dir,
-- }

-- jdtls.start_or_attach(config)

