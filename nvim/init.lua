-- Configuración inicial
vim.g.autoformat = true
local opt = vim.opt

opt.number = true
opt.encoding = "UTF-8"
opt.conceallevel = 3
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.hlsearch = true
opt.swapfile = false
opt.backup = false
-- opt.langmenu = "es_ES"
opt.laststatus = 3
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.termguicolors = true
opt.cursorline = true
opt.syntax = "enable"
opt.guicursor = "n-v-i-c:blinkon100-blinkoff100,i-r:ver20"
opt.spelllang = "es"
opt.smoothscroll = true
opt.completeopt = "menuone,noselect,popup"
opt.shortmess:append "c"
opt.winborder = "rounded"

vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end

-- Configuración de colores
vim.cmd("highlight Keyword gui=bold")
vim.cmd("highlight Function gui=bold")
vim.cmd("highlight Comment gui=italic")
vim.cmd("highlight SpecialKey gui=bold")
vim.cmd("highlight NonText gui=bold")
vim.cmd("highlight EndOfBuffer gui=bold")
vim.cmd("highlight Whitespace gui=bold")
vim.cmd("highlight Normal guibg=NONE")

vim.diagnostic.config({
	virtual_lines = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = ' ',
			[vim.diagnostic.severity.WARN] = ' ',
			[vim.diagnostic.severity.INFO] = ' ',
			[vim.diagnostic.severity.HINT] = ' ',
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	}
})

-- Configuración externa
require("keys")
require("lsp-cfg")
require("lazy-cfg")
require("futheline-cfg")
