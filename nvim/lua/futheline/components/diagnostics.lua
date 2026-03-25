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
  local errors = state.diagnostics.errors
  local warnings = state.diagnostics.warnings
  local hints = state.diagnostics.hints
  local info = state.diagnostics.info

  if errors == 0 and warnings == 0 and hints == 0 and info == 0 then
    return nil
  end

  local parts = {}

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
  local default_border = config.default_border
  local theme_hl = theme.diagnostic or { fg = '#f7768e', bg = '#1f2335' }

  local component = {
    content = content,
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
