return {
	"folke/tokyonight.nvim",
	config = function()
		require("tokyonight").setup({
			style = "night",
			styles = {
				keywords = {
					bold = true
				},
				functions = {
					bold = true
				},
			}
		})
		vim.cmd("colorscheme tokyonight")
	end
}
