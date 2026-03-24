local M = {}

function M.render(config, theme, opts)
  local searchcount = vim.fn.searchcount({ recompute = 1 })
  if not searchcount or searchcount.total == 0 then
    if vim.v.hlsearch == 0 then
      return nil
    end
  end

  local current = searchcount.current or 0
  local total = searchcount.total or 0

  if total == 0 then
    return nil
  end

  local content = current .. '/' .. total

  local component = {
    content = content,
    hl = theme.search or { fg = '#e0af68', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
