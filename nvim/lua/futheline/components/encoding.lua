local M = {}

function M.render(config, theme, opts)
  local encoding = vim.bo.fileencoding
  if encoding == '' then
    encoding = vim.o.encoding
  end

  if opts and opts.hide_utf8 and encoding:lower() == 'utf-8' then
    return nil
  end

  local content = encoding:upper()

  local component = {
    content = content,
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
