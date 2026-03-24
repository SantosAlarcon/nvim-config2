local M = {}

function M.render(config, theme, opts)
  local format = vim.bo.fileformat

  local icon
  if format == 'unix' then
    icon = 'LF'
  elseif format == 'dos' then
    icon = 'CRLF'
  elseif format == 'mac' then
    icon = 'CR'
  else
    icon = format:upper()
  end

  local component = {
    content = icon,
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
