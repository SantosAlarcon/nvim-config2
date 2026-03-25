local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local searchcount = vim.fn.searchcount({ recompute = 1 })
  if not searchcount or searchcount.total == 0 then
    if vim.v.hlsearch == 0 then
      return nil
    end
  end

  local current = searchcount.current or 0
  local total = searchcount.total or 0

  if total == 0 then
    return nil
  end

  local content = current .. '/' .. total

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.search or { fg = '#e0af68', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('search', 'match'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
