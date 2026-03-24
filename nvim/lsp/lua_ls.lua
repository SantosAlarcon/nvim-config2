vim.lsp.config['lua_ls'] = {
	cmd = {
		"lua-language-server", "--stdio", "--locale=es-es"
	},
	filetypes = { "lua" },
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath('config')
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		}, client.config.settings.Lua)
	end,
	settings = {
		Lua = {
			codeLens = {
				enable = true
			},
			hint = {
				enable = true,
				semicolon = "Disable"
			}
		},
	},
}
