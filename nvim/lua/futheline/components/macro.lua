local M = {}

function M.render(config, theme, opts)
  local recording = vim.fn.reg_recording()
  if recording == '' or recording == nil then
    return nil
  end

  local register = vim.v.register or '"'
  if register == '' then register = '"' end

  local content = 'recording @' .. register

  local component = {
    content = content,
    hl = theme.macro or { fg = '#f7768e', bg = '#1f2335' },
    border = config.default_border,
  }

  return component
end

return M
