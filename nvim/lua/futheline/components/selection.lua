local M = {}

function M.render(config, theme, opts)
  local mode = vim.api.nvim_get_mode().mode

  if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' and mode ~= 'vs' and mode ~= 's' and mode ~= 'S' and mode ~= '\19' then
    if vim.fn.visualmode() == '' then
      return nil
    end
  end

  local vmode = vim.fn.visualmode()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local line_start = start_pos[2]
  local line_end = end_pos[2]
  local lines = math.abs(line_end - line_start) + 1

  local content
  if vmode == 'v' then
    local chars = math.abs(end_pos[3] - start_pos[3]) + 1
    content = lines .. 'L ' .. chars .. 'C'
  elseif vmode == 'V' then
    content = lines .. 'L'
  else
    content = lines .. 'L'
  end

  local component = {
    content = content,
    hl = theme.selection or { fg = '#bb9af7', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
