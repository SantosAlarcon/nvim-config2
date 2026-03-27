local M = {}

local colors = require('futheline.utils.colors')

local main = '#2e3440'
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
  n = { fg = '#88c0d0', bg = M.bg.dark3 },
  no = { fg = '#88c0d0', bg = M.bg.dark3 },
  nov = { fg = '#88c0d0', bg = M.bg.dark3 },
  noV = { fg = '#88c0d0', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#88c0d0', bg = M.bg.dark3 },
  niI = { fg = '#88c0d0', bg = M.bg.dark3 },
  niR = { fg = '#88c0d0', bg = M.bg.dark3 },
  niV = { fg = '#88c0d0', bg = M.bg.dark3 },
  v = { fg = '#81a1c1', bg = M.bg.dark3 },
  V = { fg = '#81a1c1', bg = M.bg.dark3 },
  ['^V'] = { fg = '#81a1c1', bg = M.bg.dark3 },
  s = { fg = '#5e81ac', bg = M.bg.dark3 },
  S = { fg = '#5e81ac', bg = M.bg.dark3 },
  ['^S'] = { fg = '#5e81ac', bg = M.bg.dark3 },
  i = { fg = '#a3be8c', bg = M.bg.dark3 },
  ic = { fg = '#a3be8c', bg = M.bg.dark3 },
  ix = { fg = '#a3be8c', bg = M.bg.dark3 },
  R = { fg = '#bf616a', bg = M.bg.dark3 },
  Rc = { fg = '#bf616a', bg = M.bg.dark3 },
  Rv = { fg = '#bf616a', bg = M.bg.dark3 },
  Rx = { fg = '#bf616a', bg = M.bg.dark3 },
  c = { fg = '#d08770', bg = M.bg.dark3 },
  cv = { fg = '#d08770', bg = M.bg.dark3 },
  ce = { fg = '#d08770', bg = M.bg.dark3 },
  r = { fg = '#d08770', bg = M.bg.dark3 },
  rm = { fg = '#d08770', bg = M.bg.dark3 },
  ['r?'] = { fg = '#d08770', bg = M.bg.dark3 },
  ['!'] = { fg = '#8fbcbb', bg = M.bg.dark3 },
  t = { fg = '#8fbcbb', bg = M.bg.dark3 },
  normal = { fg = '#88c0d0', bg = M.bg.dark3 },
  insert = { fg = '#a3be8c', bg = M.bg.dark3 },
  visual = { fg = '#81a1c1', bg = M.bg.dark3 },
  select = { fg = '#5e81ac', bg = M.bg.dark3 },
  replace = { fg = '#bf616a', bg = M.bg.dark3 },
  command = { fg = '#d08770', bg = M.bg.dark3 },
  terminal = { fg = '#8fbcbb', bg = M.bg.dark3 },
  inactive = { fg = '#4c566a', bg = M.bg.dark3 },
}

M.git = { fg = '#8fbcbb', bg = M.bg.main }
M.gitblame = { fg = '#8fbcbb', bg = M.bg.main }
M.githunks = { fg = '#8fbcbb', bg = M.bg.main }
M.file = { fg = '#d8dee9', bg = M.bg.light1 }
M.lsp = { fg = '#81a1c1', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#bf616a' },
  warn = { fg = '#d08770' },
  hint = { fg = '#88c0d0' },
  info = { fg = '#8fbcbb' },
}
M.position = { fg = '#eceff4', bg = M.bg.main }

return M
