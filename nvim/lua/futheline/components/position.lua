local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local line = state.position.line
  local column = state.position.column
  local percentage = state.position.percentage

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local line_icon = show_icon and icons.get_icon('position', 'line') or ''
  local mode = opts.mode
  local content = ""

  if mode == "text" then
    content = "Lin. " .. line .. ", Col. " .. column
  elseif mode == "compact" then
    content = line .. ":" .. column
  elseif mode == "percentage" then
    content = percentage
  else
    content = line .. '   ' .. column .. '  ' .. percentage .. '%%'
  end

  local theme_hl = theme.position or { fg = '#a9b1d6', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = line_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
