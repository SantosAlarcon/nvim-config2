local M = {}

local icons = require('futheline.utils.icons')

local function merge_hl(base, override)
  local result = {}
  if base then for k, v in pairs(base) do result[k] = v end end
  if override then for k, v in pairs(override) do result[k] = v end end
  return result
end

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

  local default_icon_hl = config.default_icon_hl
  local default_border = config.default_border
  local theme_hl = theme.bufname or { fg = '#c0caf5', bg = '#1f2335' }

  local component = {
    content = display_name,
    icon = {
      text = icons.get_icon('file', 'default'),
    },
    icon_hl = merge_hl(default_icon_hl, opts and opts.icon_hl),
    hl = merge_hl(theme_hl, opts and opts.hl),
    border_left = (opts and opts.border_left) or default_border,
    border_right = (opts and opts.border_right) or default_border,
  }

  return component
end

return M
