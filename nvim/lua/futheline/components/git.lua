local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local branch = state.git.branch
  local added = state.git.added
  local removed = state.git.removed
  local changed = state.git.changed

  if branch == '' then
    return nil
  end

  local branch_icon = icons.get_icon('git', 'branch')
  local content = branch

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

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.git or { fg = '#7dcfff', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = branch_icon,
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
