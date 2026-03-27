local M = {}

local colors = require('futheline.utils.colors')

local main = '#282a36'
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
  n = { fg = '#50fa7b', bg = M.bg.dark3 },
  no = { fg = '#50fa7b', bg = M.bg.dark3 },
  nov = { fg = '#50fa7b', bg = M.bg.dark3 },
  noV = { fg = '#50fa7b', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#50fa7b', bg = M.bg.dark3 },
  niI = { fg = '#50fa7b', bg = M.bg.dark3 },
  niR = { fg = '#50fa7b', bg = M.bg.dark3 },
  niV = { fg = '#50fa7b', bg = M.bg.dark3 },
  v = { fg = '#bd93f9', bg = M.bg.dark3 },
  V = { fg = '#bd93f9', bg = M.bg.dark3 },
  ['^V'] = { fg = '#bd93f9', bg = M.bg.dark3 },
  s = { fg = '#ff79c6', bg = M.bg.dark3 },
  S = { fg = '#ff79c6', bg = M.bg.dark3 },
  ['^S'] = { fg = '#ff79c6', bg = M.bg.dark3 },
  i = { fg = '#ff79c6', bg = M.bg.dark3 },
  ic = { fg = '#ff79c6', bg = M.bg.dark3 },
  ix = { fg = '#ff79c6', bg = M.bg.dark3 },
  R = { fg = '#ff5555', bg = M.bg.dark3 },
  Rc = { fg = '#ff5555', bg = M.bg.dark3 },
  Rv = { fg = '#ff5555', bg = M.bg.dark3 },
  Rx = { fg = '#ff5555', bg = M.bg.dark3 },
  c = { fg = '#ffb86c', bg = M.bg.dark3 },
  cv = { fg = '#ffb86c', bg = M.bg.dark3 },
  ce = { fg = '#ffb86c', bg = M.bg.dark3 },
  r = { fg = '#ffb86c', bg = M.bg.dark3 },
  rm = { fg = '#ffb86c', bg = M.bg.dark3 },
  ['r?'] = { fg = '#ffb86c', bg = M.bg.dark3 },
  ['!'] = { fg = '#8be9fd', bg = M.bg.dark3 },
  t = { fg = '#8be9fd', bg = M.bg.dark3 },
  normal = { fg = '#50fa7b', bg = M.bg.dark3 },
  insert = { fg = '#ff79c6', bg = M.bg.dark3 },
  visual = { fg = '#bd93f9', bg = M.bg.dark3 },
  select = { fg = '#ff79c6', bg = M.bg.dark3 },
  replace = { fg = '#ff5555', bg = M.bg.dark3 },
  command = { fg = '#ffb86c', bg = M.bg.dark3 },
  terminal = { fg = '#8be9fd', bg = M.bg.dark3 },
  inactive = { fg = '#6272a4', bg = M.bg.dark3 },
}

M.git = { fg = '#8be9fd', bg = M.bg.main }
M.gitblame = { fg = '#8be9fd', bg = M.bg.main }
M.githunks = { fg = '#8be9fd', bg = M.bg.main }
M.file = { fg = '#f8f8f2', bg = M.bg.light1 }
M.lsp = { fg = '#bd93f9', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#ff5555' },
  warn = { fg = '#f1fa8c' },
  hint = { fg = '#8be9fd' },
  info = { fg = '#50fa7b' },
}
M.position = { fg = '#d8dee9', bg = M.bg.main }

return M
