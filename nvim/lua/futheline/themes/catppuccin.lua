local M = {}

local colors = require('futheline.utils.colors')

local main = '#1e1e2e'
local shades = colors.generate_shades(main, 10)

M.shades = {
  shades[1],
  shades[2],
  shades[3],
  shades[4],
  shades[5],
  shades[6],
  shades[7],
  shades[8],
  shades[9],
  shades[10],
}

M.bg = {
  main = shades[5],
  dark1 = shades[1],
  dark2 = shades[2],
  dark3 = shades[3],
  dark4 = shades[4],
  light1 = shades[6],
  light2 = shades[7],
  light3 = shades[8],
  light4 = shades[9],
  lightest = shades[10],
}

M.mode = {
  n = { fg = '#a6e3a1', bg = M.bg.dark3 },
  no = { fg = '#a6e3a1', bg = M.bg.dark3 },
  nov = { fg = '#a6e3a1', bg = M.bg.dark3 },
  noV = { fg = '#a6e3a1', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#a6e3a1', bg = M.bg.dark3 },
  niI = { fg = '#a6e3a1', bg = M.bg.dark3 },
  niR = { fg = '#a6e3a1', bg = M.bg.dark3 },
  niV = { fg = '#a6e3a1', bg = M.bg.dark3 },
  v = { fg = '#f5c2e7', bg = M.bg.dark3 },
  V = { fg = '#f5c2e7', bg = M.bg.dark3 },
  ['^V'] = { fg = '#f5c2e7', bg = M.bg.dark3 },
  s = { fg = '#cba6f7', bg = M.bg.dark3 },
  S = { fg = '#cba6f7', bg = M.bg.dark3 },
  ['^S'] = { fg = '#cba6f7', bg = M.bg.dark3 },
  i = { fg = '#89b4fa', bg = M.bg.dark3 },
  ic = { fg = '#89b4fa', bg = M.bg.dark3 },
  ix = { fg = '#89b4fa', bg = M.bg.dark3 },
  R = { fg = '#f38ba8', bg = M.bg.dark3 },
  Rc = { fg = '#f38ba8', bg = M.bg.dark3 },
  Rv = { fg = '#f38ba8', bg = M.bg.dark3 },
  Rx = { fg = '#f38ba8', bg = M.bg.dark3 },
  c = { fg = '#fab387', bg = M.bg.dark3 },
  cv = { fg = '#fab387', bg = M.bg.dark3 },
  ce = { fg = '#fab387', bg = M.bg.dark3 },
  r = { fg = '#fab387', bg = M.bg.dark3 },
  rm = { fg = '#fab387', bg = M.bg.dark3 },
  ['r?'] = { fg = '#fab387', bg = M.bg.dark3 },
  ['!'] = { fg = '#89dceb', bg = M.bg.dark3 },
  t = { fg = '#89dceb', bg = M.bg.dark3 },
  normal = { fg = '#a6e3a1', bg = M.bg.dark3 },
  insert = { fg = '#89b4fa', bg = M.bg.dark3 },
  visual = { fg = '#f5c2e7', bg = M.bg.dark3 },
  select = { fg = '#cba6f7', bg = M.bg.dark3 },
  replace = { fg = '#f38ba8', bg = M.bg.dark3 },
  command = { fg = '#fab387', bg = M.bg.dark3 },
  terminal = { fg = '#89dceb', bg = M.bg.dark3 },
  inactive = { fg = '#6c7086', bg = M.bg.dark3 },
}

M.git = { fg = '#89b4fa', bg = M.bg.main }
M.gitblame = { fg = '#89b4fa', bg = M.bg.main }
M.githunks = { fg = '#89b4fa', bg = M.bg.main }
M.file = { fg = '#cdd6f4', bg = M.bg.light1 }
M.lsp = { fg = '#cba6f7', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#f38ba8' },
  warn = { fg = '#fab387' },
  hint = { fg = '#89dceb' },
  info = { fg = '#a6e3a1' },
}
M.position = { fg = '#bac2de', bg = M.bg.main }

return M
