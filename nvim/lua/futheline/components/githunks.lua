local M = {}

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local gitsigns = package.loaded.gitsigns
  if not gitsigns then
    return nil
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
    table.insert(parts, icons.get_icon('git', 'removed') .. ' ' .. removed)
  end
  if added > 0 then
    table.insert(parts, icons.get_icon('git', 'added') .. ' ' .. added)
  end

  if #parts == 0 then
    return nil
  end

  local content = table.concat(parts, ' ')

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('git', 'branch'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme.githunks or { fg = '#c0caf5', bg = '#1f2335' }, opts and opts.hl) or { fg = '#7dcfff', bg = '#1f2335' },
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
