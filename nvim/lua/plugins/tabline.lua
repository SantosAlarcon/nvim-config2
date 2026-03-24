return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				color_icons = true,
				mode = "buffers"
			}
		})
	end
}
