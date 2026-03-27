local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local gitsigns = package.loaded.gitsigns
  if not gitsigns then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local hunks = gitsigns.get_hunks()
  if not hunks or #hunks == 0 then
    return nil
  end

  local removed = 0
  local added = 0

  for _, hunk in ipairs(hunks) do
    removed = removed + hunk.removed
    added = added + hunk.added
  end

  local parts = {}
  if removed > 0 then
    local icon = show_icon and icons.get_icon('git', 'removed') .. ' ' or ''
    table.insert(parts, icon .. removed)
  end
  if added > 0 then
    local icon = show_icon and icons.get_icon('git', 'added') .. ' ' or ''
    table.insert(parts, icon .. added)
  end

  if #parts == 0 then
    return nil
  end

  local content = table.concat(parts, ' ')

  local theme_hl = theme.githunks or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = '' },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
