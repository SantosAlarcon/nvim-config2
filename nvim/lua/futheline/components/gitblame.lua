local M = {}

function M.render(config, theme, opts)
  local gitsigns = package.loaded.gitsigns
  if not gitsigns then
    return nil
  end

  local blame = gitsigns.blame_line({ full = opts and opts.full })
  if not blame or blame == '' then
    return nil
  end

  local content = blame
  if not (opts and opts.full) then
    local author = blame:match('^[^%s]+') or ''
    if author ~= '' then
      content = author
    end
  end

  if opts and opts.max_length then
    content = content:sub(1, opts.max_length)
    if #blame > opts.max_length then
      content = content .. '...'
    end
  end

  local component = {
    content = content,
    hl = theme.gitblame or { fg = '#7dcfff', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
