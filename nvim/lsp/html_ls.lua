vim.lsp.config["html_ls"] = {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		provideFormatter = true
	},
	root_markers = { ".git" }
}
