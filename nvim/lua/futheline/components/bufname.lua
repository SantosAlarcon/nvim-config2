local M = {}

function M.render(config, theme, opts)
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == '' then
    return nil
  end

  local max_length = (opts and opts.max_length) or 40

  local display_name
  if opts and opts.relative then
    display_name = vim.fn.fnamemodify(bufname, ':~:.')
  else
    display_name = vim.fn.fnamemodify(bufname, ':~:.')

    if opts and opts.root then
      local root = vim.fn.finddir('.git', bufname .. ';')
      if root ~= '' then
        local root_dir = vim.fn.fnamemodify(root, ':h')
        display_name = vim.fn.fnamemodify(bufname, ':~:' .. root_dir)
      end
    end
  end

  if #display_name > max_length then
    display_name = '...' .. display_name:sub(-max_length + 3)
  end

  local component = {
    content = display_name,
    hl = theme.bufname or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
