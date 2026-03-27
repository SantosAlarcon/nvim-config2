local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local mode = vim.api.nvim_get_mode().mode

  if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' and mode ~= 'vs' and mode ~= 's' and mode ~= 'S' and mode ~= '\19' then
    if vim.fn.visualmode() == '' then
      return nil
    end
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local vmode = vim.fn.visualmode()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local line_start = start_pos[2]
  local line_end = end_pos[2]
  local lines = math.abs(line_end - line_start) + 1

  local content
  if vmode == 'v' then
    local chars = math.abs(end_pos[3] - start_pos[3]) + 1
    content = lines .. 'L ' .. chars .. 'C'
  elseif vmode == 'V' then
    content = lines .. 'L'
  else
    content = lines .. 'L'
  end

  local sel_icon = show_icon and icons.get_icon('selection', 'count') or ''

  local theme_hl = theme.selection or { fg = '#bb9af7', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = sel_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
