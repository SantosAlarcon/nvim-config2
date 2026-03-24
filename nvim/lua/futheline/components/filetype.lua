local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local filetype = vim.bo.filetype
  if filetype == '' or filetype == 'help' then
    return nil
  end

  local icon = icons.get_icon('file', 'default')

  local display_ft = filetype
  if opts and opts.short then
    display_ft = filetype:match('^%a+') or filetype
  end

  local content = icon .. ' ' .. display_ft

  local component = {
    content = content,
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
