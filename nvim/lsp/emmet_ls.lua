vim.lsp.config["emmet_ls"] = {
	cmd = { "emmet-ls", "--stdio" },
	filetypes = { "html", "css" },
	init_options = {
		provideFormatter = true
	},
	root_markers = { ".git" }
}
