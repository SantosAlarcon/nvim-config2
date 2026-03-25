local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local winid = vim.api.nvim_get_current_win()
  local is_loclist = opts and opts.type == 'loclist'

  local count
  if is_loclist then
    count = #vim.fn.getloclist(winid)
  else
    count = #vim.fn.getqflist()
  end

  if count == 0 then
    return nil
  end

  local content
  if is_loclist then
    content = 'loc ' .. count
  else
    content = 'qf ' .. count
  end

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.quickfix or { fg = '#e0af68', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('quickfix', is_loclist and 'loc' or 'list'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
