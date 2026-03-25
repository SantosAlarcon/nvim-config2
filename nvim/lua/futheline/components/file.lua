local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
	local result = {}
	if base then
		for k, v in pairs(base) do result[k] = v end
	end
	if override then
		for k, v in pairs(override) do result[k] = v end
	end
	return result
end

function M.render(config, theme, opts)
	local path = state.file.path
	local empty_name = opts.empty_name or '[No Name]'

	local icon = icons.get_icon('file', 'default')
	local filename, filetype_icon

	if path == '' then
		filename = empty_name
		filetype_icon = icon
	else
		filename = vim.fn.fnamemodify(path, ':t')
		local filetype = vim.bo.filetype
		if filetype ~= '' and filetype ~= 'help' then
			filetype_icon = icons.get_icon('filetype', filetype) or icon
		else
			filetype_icon = icon
		end
	end

	local content = filename

	if state.file.modified then
		content = content .. ' ' .. icons.get_icon('file', 'modified')
	end

	if state.file.readonly then
		content = content .. ' ' .. icons.get_icon('file', 'readonly')
	end

	local default_icon_hl = config.default_icon_hl
	local default_border = config.default_border
	local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

	local component = {
		content = content,
		icon = {
			text = filetype_icon,
			pos = 'left',
		},
		icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
		hl = merge_hl(theme_hl, opts and opts.hl),
		border_left = (opts and opts.border_left) or default_border,
		border_right = (opts and opts.border_right) or default_border,
	}

	return component
end

return M
