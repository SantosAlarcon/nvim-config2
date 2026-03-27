local M = {}

local colors = require('futheline.utils.colors')

local main = '#191724'
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
  n = { fg = '#9ccfd8', bg = M.bg.dark3 },
  no = { fg = '#9ccfd8', bg = M.bg.dark3 },
  nov = { fg = '#9ccfd8', bg = M.bg.dark3 },
  noV = { fg = '#9ccfd8', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#9ccfd8', bg = M.bg.dark3 },
  niI = { fg = '#9ccfd8', bg = M.bg.dark3 },
  niR = { fg = '#9ccfd8', bg = M.bg.dark3 },
  niV = { fg = '#9ccfd8', bg = M.bg.dark3 },
  v = { fg = '#f6c177', bg = M.bg.dark3 },
  V = { fg = '#f6c177', bg = M.bg.dark3 },
  ['^V'] = { fg = '#f6c177', bg = M.bg.dark3 },
  s = { fg = '#c4a7e7', bg = M.bg.dark3 },
  S = { fg = '#c4a7e7', bg = M.bg.dark3 },
  ['^S'] = { fg = '#c4a7e7', bg = M.bg.dark3 },
  i = { fg = '#eb6f92', bg = M.bg.dark3 },
  ic = { fg = '#eb6f92', bg = M.bg.dark3 },
  ix = { fg = '#eb6f92', bg = M.bg.dark3 },
  R = { fg = '#31748f', bg = M.bg.dark3 },
  Rc = { fg = '#31748f', bg = M.bg.dark3 },
  Rv = { fg = '#31748f', bg = M.bg.dark3 },
  Rx = { fg = '#31748f', bg = M.bg.dark3 },
  c = { fg = '#c4a7e7', bg = M.bg.dark3 },
  cv = { fg = '#c4a7e7', bg = M.bg.dark3 },
  ce = { fg = '#c4a7e7', bg = M.bg.dark3 },
  r = { fg = '#c4a7e7', bg = M.bg.dark3 },
  rm = { fg = '#c4a7e7', bg = M.bg.dark3 },
  ['r?'] = { fg = '#c4a7e7', bg = M.bg.dark3 },
  ['!'] = { fg = '#9ccfd8', bg = M.bg.dark3 },
  t = { fg = '#9ccfd8', bg = M.bg.dark3 },
  normal = { fg = '#9ccfd8', bg = M.bg.dark3 },
  insert = { fg = '#eb6f92', bg = M.bg.dark3 },
  visual = { fg = '#f6c177', bg = M.bg.dark3 },
  select = { fg = '#c4a7e7', bg = M.bg.dark3 },
  replace = { fg = '#31748f', bg = M.bg.dark3 },
  command = { fg = '#c4a7e7', bg = M.bg.dark3 },
  terminal = { fg = '#9ccfd8', bg = M.bg.dark3 },
  inactive = { fg = '#6e6a86', bg = M.bg.dark3 },
}

M.git = { fg = '#9ccfd8', bg = M.bg.main }
M.gitblame = { fg = '#9ccfd8', bg = M.bg.main }
M.githunks = { fg = '#9ccfd8', bg = M.bg.main }
M.file = { fg = '#e0def4', bg = M.bg.light1 }
M.lsp = { fg = '#c4a7e7', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#eb6f92' },
  warn = { fg = '#f6c177' },
  hint = { fg = '#9ccfd8' },
  info = { fg = '#31748f' },
}
M.position = { fg = '#908caa', bg = M.bg.main }

return M
