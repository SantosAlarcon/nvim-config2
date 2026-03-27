local M = {}

M.name = 'vscode'
M.border = 'none'
M.icons = true
M.padding = 'compact'
M.separator = ''

M.components = {
	left = {
		{
			'mode',
			icon_style = "none"
		},
		{ 'git' },
		{ 'file' },
		{ 'diagnostics' },
	},
	center = {},
	right = {
		{ 'lsp' },
		{ 'indent' },
		{ 'encoding', icon_style = "none" },
		{ 'format',   icon_style = "none" },
		{ 'position', mode = "text",      icon_style = "none" },
		{ 'filetype' },
	},
}

return M
