local M = {}

M.name = 'soft'
M.border = 'round'
M.icons = true
M.padding = 'spacious'
M.separator = '│'

M.components = {
	left = {
		{ 'mode' },
		{ 'git' },
		{ 'file' },
		{ 'indent' },
	},
	center = {},
	right = {
		{ 'diagnostics' },
		{ 'lsp' },
		{ 'position' },
	},
}

return M
