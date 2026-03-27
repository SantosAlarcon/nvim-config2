local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local encoding = vim.bo.fileencoding
  if encoding == '' then
    encoding = vim.o.encoding
  end

  if opts and opts.hide_utf8 and encoding:lower() == 'utf-8' then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local content = encoding:upper()
  local icon = ''
  if show_icon then
    icon = icons.get_icon('encoding', 'utf8')
  end

  local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
