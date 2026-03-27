local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients == 0 then
    return nil
  end

  local names = vim.tbl_map(function(client)
    return client.name
  end, clients)

  local content
  if opts and opts.separator then
    content = table.concat(names, opts.separator)
  else
    content = table.concat(names, ' ')
  end

  local max_servers = (opts and opts.max) or 3
  if #names > max_servers then
    content = table.concat(vim.list_slice(names, 1, max_servers), ' ') .. ' +' .. (#names - max_servers)
  end

  local lsp_icon = show_icon and icons.get_icon('lsp', 'attached') or ''

  local theme_hl = theme.lspservers or { fg = '#7aa2f7', bg = '#1f2335' }

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
