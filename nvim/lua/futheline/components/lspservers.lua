local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
	local clients = vim.lsp.get_clients({ bufnr = 0 })

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

	local default_icon_hl = config.default_icon_hl
	local default_border = config.default_border
	local theme_hl = theme.lspservers or { fg = '#7aa2f7', bg = '#1f2335' }

	local component = {
		content = content,
		icon = {
			text = icons.get_icon('lsp', 'attached'),
		},
		icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
		hl = merge_hl(theme_hl, opts and opts.hl),
		border_left = (opts and opts.border_left) or default_border,
		border_right = (opts and opts.border_right) or default_border,
	}

	return component
end

return M
