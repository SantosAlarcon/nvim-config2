local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  if not vim.o.paste then
    return nil
  end

  local paste_icon = icons.get_icon('paste', 'on') or 'PASTE'
  local content = 'ON'

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.paste or { fg = '#f7768e', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = paste_icon,
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
