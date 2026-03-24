local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme)
  if not state.lsp.attached then
    return nil
  end

  local servers = state.lsp.servers
  if #servers == 0 then
    return nil
  end

  local show_server = config.lsp and config.lsp.show_server ~= false
  local content

  if show_server then
    content = icons.get_icon('lsp', 'attached') .. ' ' .. servers[1]
    if #servers > 1 then
      content = content .. ' +' .. (#servers - 1)
    end
  else
    content = icons.get_icon('lsp', 'attached')
  end

  local component = {
    content = content,
    hl = theme.lsp or { fg = '#7aa2f7', bg = '#1f2335' },
    border = nil,
  }

  return component
end

return M
