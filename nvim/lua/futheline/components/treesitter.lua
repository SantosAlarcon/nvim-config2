local M = {}

function M.render(config, theme, opts)
  if not vim.treesitter.highlight.active[0] then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
  end

  local bufnr = vim.api.nvim_get_current_buf()

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  if not ok or not parser then
    return nil
  end

  local query_str = vim.treesitter.query.get(
    parser:lang(),
    'locals'
  )

  if not query_str then
    query_str = vim.treesitter.query.get(
      parser:lang(),
      'injections'
    )
  end

  if not query_str then
    return nil
  end

  local tree = parser:parse()
  if not tree or #tree == 0 then
    return nil
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1] - 1

  local query = vim.treesitter.query.parse(
    parser:lang(),
    query_str
  )

  local current_scope = nil
  local current_func = nil

  for id, node in query:iter_captures(tree[1], bufnr, 0, -1) do
    local capture_name = query.captures[id]
    local start_row, _, end_row, _ = node:range()

    if start_row <= row and row <= end_row then
      if capture_name == 'scope' or capture_name == 'function' then
        current_scope = node
      end
      if capture_name == 'function.name' or capture_name == 'method.name' then
        local name_start, name_end = node:range()
        current_func = vim.treesitter.get_node_text(node, bufnr)
      end
    end
  end

  local context
  if current_func then
    context = current_func
  else
    return nil
  end

  local max_length = (opts and opts.max_length) or 30
  local display = context

  if #display > max_length then
    display = display:sub(1, max_length - 3) .. '...'
  end

  local ts_icon = show_icon and '🌳' or ''

  local theme_hl = theme.treesitter or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = display,
    icon = { text = ts_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
