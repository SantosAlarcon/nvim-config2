vim.lsp.config["basedpyright"] = {
	capabilities = {
		basedpyright = {
			analysis = {
				diagnosticMode = "openFilesOnly",
			}
		}
	},
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" }
}
