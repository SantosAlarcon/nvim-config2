vim.lsp.config["astro"] = {
	cmd = { "astro-ls", "--stdio" },
	filetypes = { "astro" },
	init_options = {
		typescript = {
			tsdk = "/home/futuzor/.bun/install/global/node_modules/typescript/lib"
		}
	}
}
