vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
}
