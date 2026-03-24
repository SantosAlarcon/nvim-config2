local M = {}

function M.render(config, theme, opts)
  local winid = vim.api.nvim_get_current_win()
  local is_loclist = opts and opts.type == 'loclist'

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

  local component = {
    content = content,
    hl = theme.quickfix or { fg = '#e0af68', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
