vim.lsp.config["biome"] = {
	cmd = { "biome", "lsp-proxy" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
}
