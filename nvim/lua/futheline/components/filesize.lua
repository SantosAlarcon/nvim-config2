local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return nil
  end

  local fsize = vim.fn.getfsize(path)
  if fsize == 0 then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
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

  local size_icon = show_icon and '📄' or ''

  local theme_hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = size_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
