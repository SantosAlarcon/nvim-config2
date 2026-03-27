local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local branch = state.git.branch
  local added = state.git.added
  local removed = state.git.removed
  local changed = state.git.changed

  if branch == '' then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local content = branch

  if config.git and config.git.show_diff then
    local diff_parts = {}
    if added > 0 then
      local icon = show_icon and icons.get_icon('git', 'added') .. ' ' or ''
      table.insert(diff_parts, icon .. added)
    end
    if removed > 0 then
      local icon = show_icon and icons.get_icon('git', 'removed') .. ' ' or ''
      table.insert(diff_parts, icon .. removed)
    end
    if changed > 0 then
      local icon = show_icon and icons.get_icon('git', 'changed') .. ' ' or ''
      table.insert(diff_parts, icon .. changed)
    end
    if #diff_parts > 0 then
      content = content .. ' ' .. table.concat(diff_parts, ' ')
    end
  end

  local branch_icon = ''
  if show_icon then
    branch_icon = icons.get_icon('git', 'branch')
  end

  local theme_hl = theme.git or { fg = '#7dcfff', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = branch_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
