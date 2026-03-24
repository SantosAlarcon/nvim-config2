return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	config = function()
		-- require("nvim-treesitter").install({
		-- 	"lua", "css", "html", "javascript", "typescript", "markdown", "markdown_inline", "astro",
		-- })
		require("nvim-treesitter").get_installed()
		require("nvim-treesitter").update()
	end
}
