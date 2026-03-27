local M = {}

local colors = require('futheline.utils.colors')

local main = '#232831'
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
  n = { fg = '#a3be8c', bg = M.bg.dark3 },
  no = { fg = '#a3be8c', bg = M.bg.dark3 },
  nov = { fg = '#a3be8c', bg = M.bg.dark3 },
  noV = { fg = '#a3be8c', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#a3be8c', bg = M.bg.dark3 },
  niI = { fg = '#a3be8c', bg = M.bg.dark3 },
  niR = { fg = '#a3be8c', bg = M.bg.dark3 },
  niV = { fg = '#a3be8c', bg = M.bg.dark3 },
  v = { fg = '#81a1c1', bg = M.bg.dark3 },
  V = { fg = '#81a1c1', bg = M.bg.dark3 },
  ['^V'] = { fg = '#81a1c1', bg = M.bg.dark3 },
  s = { fg = '#b48ead', bg = M.bg.dark3 },
  S = { fg = '#b48ead', bg = M.bg.dark3 },
  ['^S'] = { fg = '#b48ead', bg = M.bg.dark3 },
  i = { fg = '#f6c177', bg = M.bg.dark3 },
  ic = { fg = '#f6c177', bg = M.bg.dark3 },
  ix = { fg = '#f6c177', bg = M.bg.dark3 },
  R = { fg = '#bf616a', bg = M.bg.dark3 },
  Rc = { fg = '#bf616a', bg = M.bg.dark3 },
  Rv = { fg = '#bf616a', bg = M.bg.dark3 },
  Rx = { fg = '#bf616a', bg = M.bg.dark3 },
  c = { fg = '#c9826b', bg = M.bg.dark3 },
  cv = { fg = '#c9826b', bg = M.bg.dark3 },
  ce = { fg = '#c9826b', bg = M.bg.dark3 },
  r = { fg = '#c9826b', bg = M.bg.dark3 },
  rm = { fg = '#c9826b', bg = M.bg.dark3 },
  ['r?'] = { fg = '#c9826b', bg = M.bg.dark3 },
  ['!'] = { fg = '#88c0d0', bg = M.bg.dark3 },
  t = { fg = '#88c0d0', bg = M.bg.dark3 },
  normal = { fg = '#a3be8c', bg = M.bg.dark3 },
  insert = { fg = '#f6c177', bg = M.bg.dark3 },
  visual = { fg = '#81a1c1', bg = M.bg.dark3 },
  select = { fg = '#b48ead', bg = M.bg.dark3 },
  replace = { fg = '#bf616a', bg = M.bg.dark3 },
  command = { fg = '#c9826b', bg = M.bg.dark3 },
  terminal = { fg = '#88c0d0', bg = M.bg.dark3 },
  inactive = { fg = '#60728a', bg = M.bg.dark3 },
}

M.git = { fg = '#88c0d0', bg = M.bg.main }
M.gitblame = { fg = '#88c0d0', bg = M.bg.main }
M.githunks = { fg = '#88c0d0', bg = M.bg.main }
M.file = { fg = '#c7cdd9', bg = M.bg.light1 }
M.lsp = { fg = '#b48ead', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#bf616a' },
  warn = { fg = '#e0af68' },
  hint = { fg = '#7dcfff' },
  info = { fg = '#9ece6a' },
}
M.position = { fg = '#abb1bb', bg = M.bg.main }

return M
