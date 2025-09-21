-- Load safely in case plugin is temporarily missing
local ok, aerial = pcall(require, "aerial")
if not ok then return end



aerial.setup({
  backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
  nerd_font = "auto",
  icons = {
        Class         = "C", Interface     = "", Module        = "",
        Namespace     = "", Package       = "", Method        = "ƒ",
        Function      = "󰊕", Constructor   = "", Field         = "󰆨",
        Property      = "", Variable      = "", Constant      = "",
        String        = "", Number        = "#", Boolean       = "⊨",
        Array         = "", Object        = "⦿", Key           = "",
        Null          = "", Enum          = "", EnumMember    = "",
        Struct        = "", Event         = "", Operator      = "",
        TypeParameter = "", Collapsed     = "",
  },
  layout = { default_direction = "prefer_right", resize_to_content = true },
})


		-- -- Number        = "",
		-- -- Boolean       = "",
        -- -- Class         = "",
        -- -- Class         = "𝓒",
        -- -- Method        = "",
        -- -- Field         = "",
        -- -- File          = '󰈔', 
        -- -- EnumMember    = '',
        -- -- Macro         = ' ',

