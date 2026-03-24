local M = {}

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

  local component = {
    content = content,
    hl = theme.githunks or { fg = '#7dcfff', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
