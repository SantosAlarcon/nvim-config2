local M = {}

local colors = require('futheline.utils.colors')

local main = '#141b1e'
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
  n = { fg = '#8ccf7e', bg = M.bg.dark3 },
  no = { fg = '#8ccf7e', bg = M.bg.dark3 },
  nov = { fg = '#8ccf7e', bg = M.bg.dark3 },
  noV = { fg = '#8ccf7e', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#8ccf7e', bg = M.bg.dark3 },
  niI = { fg = '#8ccf7e', bg = M.bg.dark3 },
  niR = { fg = '#8ccf7e', bg = M.bg.dark3 },
  niV = { fg = '#8ccf7e', bg = M.bg.dark3 },
  v = { fg = '#c47fd5', bg = M.bg.dark3 },
  V = { fg = '#c47fd5', bg = M.bg.dark3 },
  ['^V'] = { fg = '#c47fd5', bg = M.bg.dark3 },
  s = { fg = '#c47fd5', bg = M.bg.dark3 },
  S = { fg = '#c47fd5', bg = M.bg.dark3 },
  ['^S'] = { fg = '#c47fd5', bg = M.bg.dark3 },
  i = { fg = '#67b0e8', bg = M.bg.dark3 },
  ic = { fg = '#67b0e8', bg = M.bg.dark3 },
  ix = { fg = '#67b0e8', bg = M.bg.dark3 },
  R = { fg = '#e57474', bg = M.bg.dark3 },
  Rc = { fg = '#e57474', bg = M.bg.dark3 },
  Rv = { fg = '#e57474', bg = M.bg.dark3 },
  Rx = { fg = '#e57474', bg = M.bg.dark3 },
  c = { fg = '#e5c76b', bg = M.bg.dark3 },
  cv = { fg = '#e5c76b', bg = M.bg.dark3 },
  ce = { fg = '#e5c76b', bg = M.bg.dark3 },
  r = { fg = '#e5c76b', bg = M.bg.dark3 },
  rm = { fg = '#e5c76b', bg = M.bg.dark3 },
  ['r?'] = { fg = '#e5c76b', bg = M.bg.dark3 },
  ['!'] = { fg = '#6cbfbf', bg = M.bg.dark3 },
  t = { fg = '#6cbfbf', bg = M.bg.dark3 },
  normal = { fg = '#8ccf7e', bg = M.bg.dark3 },
  insert = { fg = '#67b0e8', bg = M.bg.dark3 },
  visual = { fg = '#c47fd5', bg = M.bg.dark3 },
  select = { fg = '#c47fd5', bg = M.bg.dark3 },
  replace = { fg = '#e57474', bg = M.bg.dark3 },
  command = { fg = '#e5c76b', bg = M.bg.dark3 },
  terminal = { fg = '#6cbfbf', bg = M.bg.dark3 },
  inactive = { fg = '#b3b9b8', bg = M.bg.dark3 },
}

M.git = { fg = '#6cbfbf', bg = M.bg.main }
M.gitblame = { fg = '#6cbfbf', bg = M.bg.main }
M.githunks = { fg = '#6cbfbf', bg = M.bg.main }
M.file = { fg = '#dadada', bg = M.bg.light1 }
M.lsp = { fg = '#c47fd5', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#e57474' },
  warn = { fg = '#e5a84b' },
  hint = { fg = '#5fb3b3' },
  info = { fg = '#89d082' },
}
M.position = { fg = '#b3b9b8', bg = M.bg.main }

return M
