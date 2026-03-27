local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
	local path = state.file.path
	local empty_name = opts.empty_name or '[No Name]'

	local show_icon = opts.show_icon
	if show_icon == nil then
		show_icon = config.icons
	end

	local default_icon = icons.get_icon('file', 'default')
	local filename

	if path == '' then
		filename = empty_name
	else
		filename = vim.fn.fnamemodify(path, ':t')
	end

	local content = filename

	if state.file.modified then
		local icon = show_icon and (' ' .. icons.get_icon('file', 'modified')) or ''
		content = content .. icon
	end

	if state.file.readonly then
		local icon = show_icon and (' ' .. icons.get_icon('file', 'readonly')) or ''
		content = content .. icon
	end

	local filetype_icon = ''
	if show_icon then
		if path == '' then
			filetype_icon = default_icon
		else
			local filetype = vim.bo.filetype
			if filetype ~= '' and filetype ~= 'help' then
				filetype_icon = icons.get_icon('filetype', filetype) or default_icon
			else
				filetype_icon = default_icon
			end
		end
	end

	local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

	return {
		content = content,
		icon = { text = filetype_icon, pos = 'left' },
		icon_hl = opts and opts.icon_hl or config.default_icon_hl,
		hl = theme_hl,
		border_left = opts and opts.border_left or config.default_border,
		border_right = opts and opts.border_right or config.default_border,
	}
end

return M
