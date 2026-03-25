vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/lua')

require('futheline').setup({
	theme = 'github_dark',
	components = {
		left = {
			{
				'mode',
				icon_style = "neovim",
				mode_style = "long",
				hl = {
					bg = "mode",
					fg = "#ffffff"
				},
				border_right = {
					style = "round",
					hl = {
						fg = "mode"
					}
				}
			},
			{
				'file',
				empty_name = "[Sin nombre]",
				hl = {
					fg = "#ffffff",
				},
				border_left = {
					style = 'round',
					hl = {
						fg = "#aaaaff",
					}
				},
				border_right = {
					style = 'round',
					hl = {
						fg = "#6666ff",
					}
				},
				icon_hl = {
					fg = '#000000',
					bg = '#aaaaff'
				}
			},
		},
		center = {
			{ 'git', border = 'round' },
		},
		right = {
			{ 'diagnostics' },
			{
				'lsp',
				border_left = {
					style = "round",
					hl = {
						fg = "#aaaaff"
					}
				},
				border_right = {
					style = "round",
					hl = {
						fg = "#6666ff"
					}
				},
				icon_hl = {
					fg = '#000000',
					bg = '#aaaaff'
				},
				hl = {
					bg = "#6666ff",
					fg = "#ffffff"
				},
			},
			{
				hl = {
					bg = "#6666ff",
					fg = "#ffffff"
				},
				'position',
				border_left = {
					style = "round",
					fg = "#aaaaff"
				},
				border_right = {
					style = "round",
					fg = "#ff0000",
					bg = "#ff000"
				},
				icon_hl = {
					fg = '#000000',
					bg = '#aaaaff'
				}
			},
		}
	},
})
