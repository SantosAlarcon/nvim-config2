local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  if not vim.bo.spell then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local lang = vim.bo.spelllang or 'en'
  local lang_short = lang:match('^%a+') or lang

  local spell_icon = show_icon and (icons.get_icon('spell', 'on') or 'spell') or ''
  local content = lang_short:upper()

  local theme_hl = theme.spell or { fg = '#e0af68', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = spell_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
