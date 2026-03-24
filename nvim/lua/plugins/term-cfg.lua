return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup()

		vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {
			desc = "Abrir nuevo terminal",
			silent = true
		})
	end
}
