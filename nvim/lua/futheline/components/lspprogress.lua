local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local theme_hl = theme.lspprogress or { fg = '#7aa2f7', bg = '#1f2335' }

  local progress = vim.lsp.status

  if type(progress) == 'function' then
    local status_ok, status_result = pcall(progress)
    if not status_ok or not status_result or status_result == '' then
      return nil
    end

    local lsp_icon = show_icon and icons.get_icon('lsp', 'attached') or ''

    return {
      content = status_result,
      icon = { text = lsp_icon },
      icon_hl = opts and opts.icon_hl or config.default_icon_hl,
      hl = theme_hl,
      border_left = opts and opts.border_left or config.default_border,
      border_right = opts and opts.border_right or config.default_border,
    }
  end

  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local messages = {}

  for _, client in ipairs(clients) do
    if client.messages and client.messages.progress then
      for _, msg in ipairs(client.messages.progress) do
        if msg.title then
          table.insert(messages, msg.title)
        end
      end
    end
  end

  if #messages == 0 then
    return nil
  end

  local content = messages[1]
  if #messages > 1 then
    content = content .. ' +' .. (#messages - 1)
  end

  local max_length = (opts and opts.max_length) or 40
  if #content > max_length then
    content = content:sub(1, max_length - 3) .. '...'
  end

  local lsp_icon = show_icon and icons.get_icon('lsp', 'attached') or ''

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
