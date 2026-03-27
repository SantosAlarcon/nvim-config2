local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local errors = state.diagnostics.errors
  local warnings = state.diagnostics.warnings
  local hints = state.diagnostics.hints
  local info = state.diagnostics.info

  if errors == 0 and warnings == 0 and hints == 0 and info == 0 then
    return nil
  end

  local diag_colors = theme.diagnostics or {
    error = { fg = '#f7768e' },
    warn = { fg = '#e0af68' },
    hint = { fg = '#7dcfff' },
    info = { fg = '#73daca' },
  }

  local parts = {}
  local part_idx = 1

  if errors > 0 then
    table.insert(parts, {
      text = icons.get_icon('diagnostics', 'error') .. ' ' .. errors,
      hl = opts and opts.error_hl or diag_colors.error,
      _part_idx = part_idx,
    })
    part_idx = part_idx + 1
  end
  if warnings > 0 then
    table.insert(parts, {
      text = icons.get_icon('diagnostics', 'warn') .. ' ' .. warnings,
      hl = opts and opts.warn_hl or diag_colors.warn,
      _part_idx = part_idx,
    })
    part_idx = part_idx + 1
  end
  if hints > 0 then
    table.insert(parts, {
      text = icons.get_icon('diagnostics', 'hint') .. ' ' .. hints,
      hl = opts and opts.hint_hl or diag_colors.hint,
      _part_idx = part_idx,
    })
    part_idx = part_idx + 1
  end
  if info > 0 then
    table.insert(parts, {
      text = icons.get_icon('diagnostics', 'info') .. ' ' .. info,
      hl = opts and opts.info_hl or diag_colors.info,
      _part_idx = part_idx,
    })
  end

  return {
    parts = parts,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
