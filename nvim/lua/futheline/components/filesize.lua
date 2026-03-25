local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return nil
  end

  local fsize = vim.fn.getfsize(path)
  if fsize == 0 then
    return nil
  end

  local content
  if fsize < 0 then
    return nil
  elseif fsize < 1024 then
    content = fsize .. 'B'
  elseif fsize < 1024 * 1024 then
    content = string.format('%.1fKB', fsize / 1024)
  elseif fsize < 1024 * 1024 * 1024 then
    content = string.format('%.1fMB', fsize / (1024 * 1024))
  else
    content = string.format('%.1fGB', fsize / (1024 * 1024 * 1024))
  end

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = '📄',
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
