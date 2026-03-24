local M = {}

function M.render(config, theme, opts)
  local progress = vim.lsp.status

  if type(progress) == 'function' then
    local status_ok, status_result = pcall(progress)
    if not status_ok or not status_result or status_result == '' then
      return nil
    end

    local component = {
      content = status_result,
      hl = theme.lspprogress or { fg = '#7aa2f7', bg = '#1f2335' },
      border = config.default_border,
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
    hl = theme.lspprogress or { fg = '#7aa2f7', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
