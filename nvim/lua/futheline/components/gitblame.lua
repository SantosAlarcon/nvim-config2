local M = {}

local icons = require('futheline.utils.icons')

function M.render(config, theme, opts)
  local gitsigns = package.loaded.gitsigns
  if not gitsigns then
    return nil
  end

  local show_icon = opts.show_icon
  if show_icon == nil then
    show_icon = config.icons
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

  local blame_icon = show_icon and icons.get_icon('git', 'branch') or ''

  local theme_hl = theme.gitblame or { fg = '#c0caf5', bg = '#1f2335' }

  return {
    content = content,
    icon = { text = blame_icon },
    icon_hl = opts and opts.icon_hl or config.default_icon_hl,
    hl = theme_hl,
    border_left = opts and opts.border_left or config.default_border,
    border_right = opts and opts.border_right or config.default_border,
  }
end

return M
