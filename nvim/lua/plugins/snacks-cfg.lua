return {
	"folke/snacks.nvim",
	priority = 1000,
	---@type snacks.Config
	opts = {
		picker = {
			grep = {
				exclude = { "node_modules", ".astro", ".next", "bun.lock", "pnpm.lock", "npm.lock", ".astro", ".next" }
			}
		}
	},
	config = function()
		require("snacks").setup({
			explorer = { replace_netrw = true },
			notifier = { enabled = true },
			input = { enabled = true },
			statuscolumn = { enabled = true },
			scroll = { enabled = true },

			vim.keymap.set("n", "<Tab>", ":lua Snacks.explorer.open()<CR>",
				{ silent = true, desc = "Explorador de archivos" }),
			vim.keymap.set("n", "<leader>lg", ":lua Snacks.picker.grep()<CR>",
				{ silent = true, desc = "Live Grep" })

		})
	end
}
