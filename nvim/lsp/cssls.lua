vim.lsp.config["cssls"] = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss" },
	init_options = {
		provideFormatter = true
	},
	root_markers = { ".git" }
}
