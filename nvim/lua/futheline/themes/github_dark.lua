local M = {}

local colors = require('futheline.utils.colors')

local main = '#0d1117'
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
  n = { fg = '#3fb950', bg = M.bg.dark3 },
  no = { fg = '#3fb950', bg = M.bg.dark3 },
  nov = { fg = '#3fb950', bg = M.bg.dark3 },
  noV = { fg = '#3fb950', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#3fb950', bg = M.bg.dark3 },
  niI = { fg = '#3fb950', bg = M.bg.dark3 },
  niR = { fg = '#3fb950', bg = M.bg.dark3 },
  niV = { fg = '#3fb950', bg = M.bg.dark3 },
  v = { fg = '#a371f7', bg = M.bg.dark3 },
  V = { fg = '#a371f7', bg = M.bg.dark3 },
  ['^V'] = { fg = '#a371f7', bg = M.bg.dark3 },
  s = { fg = '#a371f7', bg = M.bg.dark3 },
  S = { fg = '#a371f7', bg = M.bg.dark3 },
  ['^S'] = { fg = '#a371f7', bg = M.bg.dark3 },
  i = { fg = '#58a6ff', bg = M.bg.dark3 },
  ic = { fg = '#58a6ff', bg = M.bg.dark3 },
  ix = { fg = '#58a6ff', bg = M.bg.dark3 },
  R = { fg = '#f85149', bg = M.bg.dark3 },
  Rc = { fg = '#f85149', bg = M.bg.dark3 },
  Rv = { fg = '#f85149', bg = M.bg.dark3 },
  Rx = { fg = '#f85149', bg = M.bg.dark3 },
  c = { fg = '#d29922', bg = M.bg.dark3 },
  cv = { fg = '#d29922', bg = M.bg.dark3 },
  ce = { fg = '#d29922', bg = M.bg.dark3 },
  r = { fg = '#d29922', bg = M.bg.dark3 },
  rm = { fg = '#d29922', bg = M.bg.dark3 },
  ['r?'] = { fg = '#d29922', bg = M.bg.dark3 },
  ['!'] = { fg = '#58a6ff', bg = M.bg.dark3 },
  t = { fg = '#58a6ff', bg = M.bg.dark3 },
  normal = { fg = '#3fb950', bg = M.bg.dark3 },
  insert = { fg = '#58a6ff', bg = M.bg.dark3 },
  visual = { fg = '#a371f7', bg = M.bg.dark3 },
  select = { fg = '#a371f7', bg = M.bg.dark3 },
  replace = { fg = '#f85149', bg = M.bg.dark3 },
  command = { fg = '#d29922', bg = M.bg.dark3 },
  terminal = { fg = '#58a6ff', bg = M.bg.dark3 },
  inactive = { fg = '#8b949e', bg = M.bg.dark3 },
}

M.git = { fg = '#58a6ff', bg = M.bg.main }
M.gitblame = { fg = '#8b949e', bg = M.bg.main }
M.githunks = { fg = '#3fb950', bg = M.bg.main }
M.file = { fg = '#e6edf3', bg = M.bg.light1 }
M.lsp = { fg = '#a371f7', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#f85149' },
  warn = { fg = '#d29922' },
  hint = { fg = '#54aeff' },
  info = { fg = '#3fb950' },
}
M.position = { fg = '#8b949e', bg = M.bg.main }

return M
