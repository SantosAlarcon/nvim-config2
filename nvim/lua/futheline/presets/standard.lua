local M = {}

M.name = 'standard'
M.border = 'none'
M.icons = false
M.padding = 'compact'
M.separator = ' '

M.components = {
	left = {
		{ 'mode' },
	},
	center = {},
	right = {
		{ 'file' },
		{ 'diagnostics' },
		{ 'lsp' },
		{ 'position' },
	},
}

return M
