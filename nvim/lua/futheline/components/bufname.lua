local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == '' then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
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

  local bufname_icon = show_icon and icons.get_icon('file', 'default') or ''

  local theme_hl = theme.bufname or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = display_name,
    icon = { text = bufname_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
