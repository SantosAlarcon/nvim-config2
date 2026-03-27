local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local searchcount = vim.fn.searchcount({ recompute = 1 })
  if not searchcount or searchcount.total == 0 then
    if vim.v.hlsearch == 0 then
      return nil
    end
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local current = searchcount.current or 0
  local total = searchcount.total or 0

  if total == 0 then
    return nil
  end

  local content = current .. '/' .. total
  local search_icon = show_icon and icons.get_icon('search', 'match') or ''

  local theme_hl = theme.search or { fg = '#e0af68', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = search_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
