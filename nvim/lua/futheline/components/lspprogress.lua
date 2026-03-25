local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

function M.render(config, theme, opts)
  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.lspprogress or { fg = '#7aa2f7', bg = '#1f2335' }

  local progress = vim.lsp.status

  if type(progress) == 'function' then
    local status_ok, status_result = pcall(progress)
    if not status_ok or not status_result or status_result == '' then
      return nil
    end

    local component = {
      content = status_result,
      icon = {
        text = icons.get_icon('lsp', 'attached'),
      },
      icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
      hl = merge_hl(theme_hl, opts and opts.hl),
      border_left = (opts and opts.border_left) or default_border,
      border_right = (opts and opts.border_right) or default_border,
    }

    return component
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

  local component = {
    content = content,
    icon = {
      text = icons.get_icon('lsp', 'attached'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
