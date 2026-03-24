vim.lsp.config["mdx_analyzer"] = {
	cmd = {
		"mdx-language-server", "--stdio"
	},
	filetypes = {
		"mdx"
	},
	root_markers = {
		"package.json"
	},
	init_options = {
		typescript = {
			tsdk = "/home/futuzor/.bun/install/global/node_modules/typescript/lib"
		}
	}
}
