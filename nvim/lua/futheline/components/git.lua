local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme)
  local branch = state.git.branch
  local added = state.git.added
  local removed = state.git.removed
  local changed = state.git.changed

  if branch == '' then
    return nil
  end

  local content = icons.get_icon('git', 'branch') .. ' ' .. branch

  if config.git and config.git.show_diff then
    local diff_parts = {}
    if added > 0 then
      table.insert(diff_parts, icons.get_icon('git', 'added') .. ' ' .. added)
    end
    if removed > 0 then
      table.insert(diff_parts, icons.get_icon('git', 'removed') .. ' ' .. removed)
    end
    if changed > 0 then
      table.insert(diff_parts, icons.get_icon('git', 'changed') .. ' ' .. changed)
    end
    if #diff_parts > 0 then
      content = content .. ' ' .. table.concat(diff_parts, ' ')
    end
  end

  local component = {
    content = content,
    hl = theme.git or { fg = '#7dcfff', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
