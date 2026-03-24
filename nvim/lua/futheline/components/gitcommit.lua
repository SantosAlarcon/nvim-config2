local M = {}

function M.render(config, theme, opts)
  local filetype = vim.bo.filetype
  if filetype ~= 'gitcommit' and filetype ~= 'gitrebase' then
    return nil
  end

  local content
  if filetype == 'gitcommit' then
    content = 'COMMIT'
  elseif filetype == 'gitrebase' then
    content = 'REBASE'
  else
    content = filetype:upper()
  end

  local component = {
    content = content,
    hl = theme.gitcommit or { fg = '#f7768e', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
