return {
	"Saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "2.*",
	build = "cargo build --release",
	event = "BufReadPre",
	opts = {
		completion = {
			menu = {
				max_height = 30,
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label",     "label_description", gap = 5 },
						{ "kind_icon", "kind" }
					},
				}

			},
			documentation = { auto_show = true, auto_show_delay_ms = 50 },
		},
		signature = { enabled = true },
		sources = { default = { "lsp", "path", "snippets" } },
		keymap = {
			["<CR>"] = { "select_and_accept", "fallback" }
		}
	}
}
