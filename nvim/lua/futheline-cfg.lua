vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/lua')

require('futheline').setup({
	theme = 'github_dark',

	mode = {
		icon_style = 'neovim',
		mode_style = 'icon_long',
	},

	file = {
		empty_name = "[Sin nombre]"
	},

	default_icon_hl = {
		fg = '#7aa2f7',
		bg = '#1a1b26',
	},

	default_border = 'round',

	components = {
		left = {
			{ 'mode', border = 'round' },
			{ 'file', border = 'round' },
		},

		center = {
			{ 'git', border = 'round' },
		},

		right = {
			{ 'lsp',         show_server = true },
			{ 'diagnostics', border = 'slant' },
			{ 'position',    border = "round" },
		}
	},

	position = {
		mode_style = "icon"
	}
})
