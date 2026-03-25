local M = {}

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

local icons = require('futheline.utils.icons')

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

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('git', 'branch'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme.gitcommit or { fg = '#c0caf5', bg = '#1f2335' }, opts and opts.hl) or { fg = '#f7768e', bg = '#1f2335' },
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
