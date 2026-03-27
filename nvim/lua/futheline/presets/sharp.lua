local M = {}

M.name = 'sharp'
M.border = 'sharp'
M.icons = false
M.padding = 'compact'
M.separator = ''

M.components = {
	left = {
		{ 'mode' },
		{ 'file' },
	},
	center = {},
	right = {
		{ 'diagnostics' },
		{ 'lsp' },
		{ 'position' },
	},
}

return M
