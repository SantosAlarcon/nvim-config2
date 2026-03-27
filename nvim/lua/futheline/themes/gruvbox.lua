local M = {}

local colors = require('futheline.utils.colors')

local main = '#282828'
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
  n = { fg = '#b8bb26', bg = M.bg.dark3 },
  no = { fg = '#b8bb26', bg = M.bg.dark3 },
  nov = { fg = '#b8bb26', bg = M.bg.dark3 },
  noV = { fg = '#b8bb26', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#b8bb26', bg = M.bg.dark3 },
  niI = { fg = '#b8bb26', bg = M.bg.dark3 },
  niR = { fg = '#b8bb26', bg = M.bg.dark3 },
  niV = { fg = '#b8bb26', bg = M.bg.dark3 },
  v = { fg = '#83a598', bg = M.bg.dark3 },
  V = { fg = '#83a598', bg = M.bg.dark3 },
  ['^V'] = { fg = '#83a598', bg = M.bg.dark3 },
  s = { fg = '#d3869b', bg = M.bg.dark3 },
  S = { fg = '#d3869b', bg = M.bg.dark3 },
  ['^S'] = { fg = '#d3869b', bg = M.bg.dark3 },
  i = { fg = '#fabd2f', bg = M.bg.dark3 },
  ic = { fg = '#fabd2f', bg = M.bg.dark3 },
  ix = { fg = '#fabd2f', bg = M.bg.dark3 },
  R = { fg = '#fb4934', bg = M.bg.dark3 },
  Rc = { fg = '#fb4934', bg = M.bg.dark3 },
  Rv = { fg = '#fb4934', bg = M.bg.dark3 },
  Rx = { fg = '#fb4934', bg = M.bg.dark3 },
  c = { fg = '#fe8019', bg = M.bg.dark3 },
  cv = { fg = '#fe8019', bg = M.bg.dark3 },
  ce = { fg = '#fe8019', bg = M.bg.dark3 },
  r = { fg = '#fe8019', bg = M.bg.dark3 },
  rm = { fg = '#fe8019', bg = M.bg.dark3 },
  ['r?'] = { fg = '#fe8019', bg = M.bg.dark3 },
  ['!'] = { fg = '#8ec07c', bg = M.bg.dark3 },
  t = { fg = '#8ec07c', bg = M.bg.dark3 },
  normal = { fg = '#b8bb26', bg = M.bg.dark3 },
  insert = { fg = '#fabd2f', bg = M.bg.dark3 },
  visual = { fg = '#83a598', bg = M.bg.dark3 },
  select = { fg = '#d3869b', bg = M.bg.dark3 },
  replace = { fg = '#fb4934', bg = M.bg.dark3 },
  command = { fg = '#fe8019', bg = M.bg.dark3 },
  terminal = { fg = '#8ec07c', bg = M.bg.dark3 },
  inactive = { fg = '#928374', bg = M.bg.dark3 },
}

M.git = { fg = '#8ec07c', bg = M.bg.main }
M.gitblame = { fg = '#8ec07c', bg = M.bg.main }
M.githunks = { fg = '#8ec07c', bg = M.bg.main }
M.file = { fg = '#ebdbb2', bg = M.bg.light1 }
M.lsp = { fg = '#d3869b', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#fb4934' },
  warn = { fg = '#fabd2f' },
  hint = { fg = '#83a598' },
  info = { fg = '#b8bb26' },
}
M.position = { fg = '#d5c4a1', bg = M.bg.main }

return M
