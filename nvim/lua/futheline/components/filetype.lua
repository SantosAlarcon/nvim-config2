local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local filetype = vim.bo.filetype
  if filetype == '' or filetype == 'help' then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local display_ft = filetype
  if opts and opts.short then
    display_ft = filetype:match('^%a+') or filetype
  end

  local default_icon = icons.get_icon('file', 'default')
  local filetype_icon = ''
  if show_icon then
    filetype_icon = icons.get_icon('filetype', filetype) or default_icon
  end

  local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = display_ft,
    icon = { text = filetype_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
