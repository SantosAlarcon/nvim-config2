local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme)
	local line = state.position.line
	local column = state.position.column
	local percentage = state.position.percentage

	local line_icon = icons.get_icon('position', 'line')
	local content = line_icon .. ' ' .. line .. '   ' .. column .. '  ' .. percentage .. '%%'

	local component = {
		content = content,
		hl = theme.position or { fg = '#a9b1d6', bg = '#1f2335' },
		border = nil,
	}

	return component
end

return M
