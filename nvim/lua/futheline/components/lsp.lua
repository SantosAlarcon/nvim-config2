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
  if not state.lsp.attached then
    return nil
  end

  local servers = state.lsp.servers
  if #servers == 0 then
    return nil
  end

  local lsp_icon = icons.get_icon('lsp', 'attached')
  local content = servers[1] or ''
  if #servers > 1 then
    content = content .. ' +' .. (#servers - 1)
  end

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.lsp or { fg = '#7aa2f7', bg = '#1f2335' }

  local component = {
    content = content,
    icon = {
      text = lsp_icon,
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
