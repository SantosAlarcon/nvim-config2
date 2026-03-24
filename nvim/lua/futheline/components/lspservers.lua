local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	print(clients)

	if #clients == 0 then
		return nil
	end

	local names = vim.tbl_map(function(client)
		return client.name
	end, clients)

	local content
	if opts and opts.separator then
		content = table.concat(names, opts.separator)
	else
		content = table.concat(names, ' ')
	end

	local max_servers = (opts and opts.max) or 3
	if #names > max_servers then
		content = table.concat(vim.list_slice(names, 1, max_servers), ' ') .. ' +' .. (#names - max_servers)
	end

	local component = {
		content = content,
		hl = theme.lspservers or { fg = '#7aa2f7', bg = '#1f2335' },
		border = config.default_border,
	}

	return component
end

return M
