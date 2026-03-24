local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

function M.render(config, theme)
  local path = state.file.path
  local empty_name = config.file and config.file.empty_name or '[No Name]'

  local icon = icons.get_icon('file', 'default')
  local filename, filetype_icon

  if path == '' then
    filename = empty_name
    filetype_icon = icon
  else
    filename = vim.fn.fnamemodify(path, ':t')
    local filetype = vim.bo.filetype
    if filetype ~= '' and filetype ~= 'help' then
      filetype_icon = icons.get_icon('filetype', filetype) or icon
    else
      filetype_icon = icon
    end
  end

  local content = filename

  if state.file.modified then
    content = content .. ' ' .. icons.get_icon('file', 'modified')
  end

  if state.file.readonly then
    content = content .. ' ' .. icons.get_icon('file', 'readonly')
  end

  local component = {
    content = content,
    icon = {
      text = filetype_icon,
      pos = 'left',
      hl = { fg = '#7aa2f7', bg = '#1f2335' },
    },
    hl = theme.file or { fg = '#c0caf5', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
