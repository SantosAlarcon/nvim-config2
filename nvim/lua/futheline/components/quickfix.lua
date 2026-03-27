local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local winid = vim.api.nvim_get_current_win()
  local is_loclist = opts and opts.type == 'loclist'

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

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

  local qf_icon = show_icon and icons.get_icon('quickfix', is_loclist and 'loc' or 'list') or ''

  local theme_hl = theme.quickfix or { fg = '#e0af68', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = qf_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
