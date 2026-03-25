local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local mode = vim.api.nvim_get_mode().mode

  if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' and mode ~= 'vs' and mode ~= 's' and mode ~= 'S' and mode ~= '\19' then
    if vim.fn.visualmode() == '' then
      return nil
    end
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

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.selection or { fg = '#bb9af7', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('selection', 'count'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
