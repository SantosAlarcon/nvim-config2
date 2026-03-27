local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local recording = vim.fn.reg_recording()
  if recording == '' or recording == nil then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local register = vim.v.register or '"'
  if register == '' then register = '"' end

  local content = 'recording @' .. register
  local macro_icon = show_icon and icons.get_icon('macro', 'recording') or ''

  local theme_hl = theme.macro or { fg = '#f7768e', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = macro_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
