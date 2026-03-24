return {
	"nvim-mini/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.surround").setup()
		require("mini.icons").setup()
		-- MiniIcons.tweak_lsp_kind()
		-- MiniIcons.mock_nvim_web_devicons()
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				up = '<A-Up>',
				down = '<A-Down>',
				left = '<A-Left>',
				right = '<A-Right>',

				-- Move current line in Normal mode
				line_up = '<A-Up>',
				line_down = '<A-Down>',
				line_left = '<A-Left>',
				line_right = '<A-Right>',
			},

			-- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
	end
}
