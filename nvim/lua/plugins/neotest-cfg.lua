return {
	"nvim-neotest/neotest",
	dependencies = { "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim", "arthur944/neotest-bun" },
	event = "BufReadPost",
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-bun")
			}
		})
	end
}
