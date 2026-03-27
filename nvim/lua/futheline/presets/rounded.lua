local M = {}

M.name = 'rounded'
M.border = 'round'
M.icons = true
M.padding = 'medium'
M.separator = ' '

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
