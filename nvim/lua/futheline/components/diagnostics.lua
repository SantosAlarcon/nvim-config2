local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme)
  local errors = state.diagnostics.errors
  local warnings = state.diagnostics.warnings
  local hints = state.diagnostics.hints
  local info = state.diagnostics.info

  if errors == 0 and warnings == 0 and hints == 0 and info == 0 then
    return nil
  end

  local parts = {}
  local hl = theme.diagnostic or { fg = '#f7768e', bg = '#1f2335' }

  if errors > 0 then
    table.insert(parts, icons.get_icon('diagnostics', 'error') .. ' ' .. errors)
  end
  if warnings > 0 then
    table.insert(parts, icons.get_icon('diagnostics', 'warn') .. ' ' .. warnings)
  end
  if hints > 0 then
    table.insert(parts, icons.get_icon('diagnostics', 'hint') .. ' ' .. hints)
  end
  if info > 0 then
    table.insert(parts, icons.get_icon('diagnostics', 'info') .. ' ' .. info)
  end

  local content = table.concat(parts, ' ')

  local component = {
    content = content,
    hl = hl,
    border = config.default_border,
  }

  return component
end

return M
