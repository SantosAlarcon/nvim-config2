return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		require("ultimate-autopair").setup({
			config_internal_pairs = {
				{ '{', '}', insta_newline = true },
				-- { '[', ']', insta_newline = true },
				-- { '(', ')', insta_newline = true },
			}
		})
	end
}
