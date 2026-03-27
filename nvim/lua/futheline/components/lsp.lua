local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  if not state.lsp.attached then
    return nil
  end

  local servers = state.lsp.servers
  if #servers == 0 then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local content = servers[1] or ''
  if #servers > 1 then
    content = content .. ' +' .. (#servers - 1)
  end

  local lsp_icon = show_icon and icons.get_icon('lsp', 'attached') or ''

  local theme_hl = theme.lsp or { fg = '#7aa2f7', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = lsp_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
