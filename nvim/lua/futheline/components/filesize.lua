local M = {}

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

  local component = {
    content = content,
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
