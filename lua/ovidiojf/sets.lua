---@diagnostic disable: undefined-global
vim.opt.guicursor = "n-v-ve-c-sm-o:block,i-ci:ver25,r-cr:hor20,i:blinkwait70-blinkoff40-blinkon25"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.linebreak = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.showmatch = true
vim.opt.matchtime = 2

vim.opt.updatetime = 50

vim.opt.spell = false
vim.opt.spelllang = 'pt,en' -- test: amox lovx amor love 

vim.opt.clipboard = 'unnamedplus'

vim.opt.confirm = true

vim.opt.splitbelow = true

vim.opt.timeout = true
vim.opt.timeoutlen = 5000

vim.opt.updatetime = 2000

vim.opt.virtualedit = 'block'

vim.opt.autoread = false

vim.cmd('autocmd CursorHold * echo ""')

vim.opt.showmode = false

vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.user_emmet_leader_key='<c-c>'


