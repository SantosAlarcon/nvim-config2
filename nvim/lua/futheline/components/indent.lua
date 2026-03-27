local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local expandtab = vim.bo.expandtab
  local shiftwidth = vim.bo.shiftwidth
  local tabstop = vim.bo.tabstop

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local icon_text = ''
  local content
  if expandtab then
    icon_text = show_icon and icons.get_icon('indent', 'space') or ''
    content = 'Spaces: ' .. shiftwidth
  else
    icon_text = show_icon and icons.get_icon('indent', 'tab') or ''
    content = 'Tabs: ' .. tabstop
  end

  local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = icon_text },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
