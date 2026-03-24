local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, _opts)
  if not vim.bo.spell then
    return nil
  end

  local lang = vim.bo.spelllang or 'en'
  local lang_short = lang:match('^%a+') or lang

  local icon = icons.get_icon('spell', 'on') or 'spell'
  local content = icon .. ' ' .. lang_short:upper()

  local component = {
    content = content,
    hl = theme.spell or { fg = '#e0af68', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
