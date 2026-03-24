local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, _opts)
  if not vim.o.paste then
    return nil
  end

  local icon = icons.get_icon('paste', 'on') or 'PASTE'
  local content = icon .. ' ON'

  local component = {
    content = content,
    hl = theme.paste or { fg = '#f7768e', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
