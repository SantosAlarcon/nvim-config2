local M = {}

function M.render(config, theme, opts)
  local expandtab = vim.bo.expandtab
  local shiftwidth = vim.bo.shiftwidth
  local tabstop = vim.bo.tabstop

  local content
  if expandtab then
    if shiftwidth == tabstop then
      content = 'Spaces: ' .. shiftwidth
    else
      content = 'Spaces: ' .. shiftwidth
    end
  else
    content = 'Tabs: ' .. tabstop
  end

  local component = {
    content = content,
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
