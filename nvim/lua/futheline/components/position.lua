local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
	local line = state.position.line
	local column = state.position.column
	local percentage = state.position.percentage

	local line_icon = icons.get_icon('position', 'line')
	local content = line .. '   ' .. column .. '  ' .. percentage .. '%%'

	local default_icon_hl = config.default_icon_hl
	local default_border = config.default_border
	local theme_hl = theme.position or { fg = '#a9b1d6', bg = '#1f2335' }

	local component = {
		content = content,
		icon = {
			text = line_icon,
		},
		icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
		hl = merge_hl(theme_hl, opts and opts.hl),
		border_left = (opts and opts.border_left) or default_border,
		border_right = (opts and opts.border_right) or default_border,
	}

	return component
end

return M
