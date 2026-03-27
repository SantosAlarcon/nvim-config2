local M = {}

local colors = require('futheline.utils.colors')

local main = '#1f2335'
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
  n = { fg = '#9ece6a', bg = M.bg.dark3 },
  no = { fg = '#9ece6a', bg = M.bg.dark3 },
  nov = { fg = '#9ece6a', bg = M.bg.dark3 },
  noV = { fg = '#9ece6a', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#9ece6a', bg = M.bg.dark3 },
  niI = { fg = '#9ece6a', bg = M.bg.dark3 },
  niR = { fg = '#9ece6a', bg = M.bg.dark3 },
  niV = { fg = '#9ece6a', bg = M.bg.dark3 },
  v = { fg = '#bb9af7', bg = M.bg.dark3 },
  V = { fg = '#bb9af7', bg = M.bg.dark3 },
  ['^V'] = { fg = '#bb9af7', bg = M.bg.dark3 },
  s = { fg = '#ff9e64', bg = M.bg.dark3 },
  S = { fg = '#ff9e64', bg = M.bg.dark3 },
  ['^S'] = { fg = '#ff9e64', bg = M.bg.dark3 },
  i = { fg = '#7aa2f7', bg = M.bg.dark3 },
  ic = { fg = '#7aa2f7', bg = M.bg.dark3 },
  ix = { fg = '#7aa2f7', bg = M.bg.dark3 },
  R = { fg = '#f7768e', bg = M.bg.dark3 },
  Rc = { fg = '#f7768e', bg = M.bg.dark3 },
  Rv = { fg = '#f7768e', bg = M.bg.dark3 },
  Rx = { fg = '#f7768e', bg = M.bg.dark3 },
  c = { fg = '#e0af68', bg = M.bg.dark3 },
  cv = { fg = '#e0af68', bg = M.bg.dark3 },
  ce = { fg = '#e0af68', bg = M.bg.dark3 },
  r = { fg = '#e0af68', bg = M.bg.dark3 },
  rm = { fg = '#e0af68', bg = M.bg.dark3 },
  ['r?'] = { fg = '#e0af68', bg = M.bg.dark3 },
  ['!'] = { fg = '#7dcfff', bg = M.bg.dark3 },
  t = { fg = '#7dcfff', bg = M.bg.dark3 },
  normal = { fg = '#9ece6a', bg = M.bg.dark3 },
  insert = { fg = '#7aa2f7', bg = M.bg.dark3 },
  visual = { fg = '#bb9af7', bg = M.bg.dark3 },
  select = { fg = '#ff9e64', bg = M.bg.dark3 },
  replace = { fg = '#f7768e', bg = M.bg.dark3 },
  command = { fg = '#e0af68', bg = M.bg.dark3 },
  terminal = { fg = '#7dcfff', bg = M.bg.dark3 },
  inactive = { fg = '#565f89', bg = M.bg.dark3 },
}

M.git = {
  fg = '#7dcfff',
  bg = M.bg.main,
}

M.gitblame = {
  fg = '#7dcfff',
  bg = M.bg.main,
}

M.githunks = {
  fg = '#7dcfff',
  bg = M.bg.main,
}

M.file = {
  fg = '#c0caf5',
  bg = M.bg.light1,
}

M.lsp = {
  fg = '#7aa2f7',
  bg = M.bg.main,
}

M.diagnostics = {
  error = { fg = '#f7768e' },
  warn = { fg = '#e0af68' },
  hint = { fg = '#7dcfff' },
  info = { fg = '#73daca' },
}

M.position = {
  fg = '#a9b1d6',
  bg = M.bg.main,
}

return M
