local M = {}

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

local function get_treesitter_context(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

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

  if current_func then
    return current_func
  end

  return nil
end

function M.render(config, theme, opts)
  if not vim.treesitter.highlight.active[0] then
    return nil
  end

  local context = get_treesitter_context()
  if not context then
    return nil
  end

  local max_length = (opts and opts.max_length) or 30
  local display = context

  if #display > max_length then
    display = display:sub(1, max_length - 3) .. '...'
  end

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border

  local component = {
    content = display,
    icon = {
      text = '🌳',
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme.treesitter or { fg = '#c0caf5', bg = '#1f2335' }, opts and opts.hl) or { fg = '#bb9af7', bg = '#1f2335' },
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
