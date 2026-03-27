local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local filetype = vim.bo.filetype
  if filetype ~= 'gitcommit' and filetype ~= 'gitrebase' then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local content
  if filetype == 'gitcommit' then
    content = 'COMMIT'
  elseif filetype == 'gitrebase' then
    content = 'REBASE'
  else
    content = filetype:upper()
  end

  local commit_icon = show_icon and icons.get_icon('git', 'branch') or ''

  local theme_hl = theme.gitcommit or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = commit_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
