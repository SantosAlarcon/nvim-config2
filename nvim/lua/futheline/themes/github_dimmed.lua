local M = {}

local colors = require('futheline.utils.colors')

local main = '#1c2128'
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
  n = { fg = '#6e40c9', bg = M.bg.dark3 },
  no = { fg = '#6e40c9', bg = M.bg.dark3 },
  nov = { fg = '#6e40c9', bg = M.bg.dark3 },
  noV = { fg = '#6e40c9', bg = M.bg.dark3 },
  ['no\22'] = { fg = '#6e40c9', bg = M.bg.dark3 },
  niI = { fg = '#6e40c9', bg = M.bg.dark3 },
  niR = { fg = '#6e40c9', bg = M.bg.dark3 },
  niV = { fg = '#6e40c9', bg = M.bg.dark3 },
  v = { fg = '#a371f7', bg = M.bg.dark3 },
  V = { fg = '#a371f7', bg = M.bg.dark3 },
  ['^V'] = { fg = '#a371f7', bg = M.bg.dark3 },
  s = { fg = '#a371f7', bg = M.bg.dark3 },
  S = { fg = '#a371f7', bg = M.bg.dark3 },
  ['^S'] = { fg = '#a371f7', bg = M.bg.dark3 },
  i = { fg = '#79c0ff', bg = M.bg.dark3 },
  ic = { fg = '#79c0ff', bg = M.bg.dark3 },
  ix = { fg = '#79c0ff', bg = M.bg.dark3 },
  R = { fg = '#ff7b72', bg = M.bg.dark3 },
  Rc = { fg = '#ff7b72', bg = M.bg.dark3 },
  Rv = { fg = '#ff7b72', bg = M.bg.dark3 },
  Rx = { fg = '#ff7b72', bg = M.bg.dark3 },
  c = { fg = '#e3b341', bg = M.bg.dark3 },
  cv = { fg = '#e3b341', bg = M.bg.dark3 },
  ce = { fg = '#e3b341', bg = M.bg.dark3 },
  r = { fg = '#e3b341', bg = M.bg.dark3 },
  rm = { fg = '#e3b341', bg = M.bg.dark3 },
  ['r?'] = { fg = '#e3b341', bg = M.bg.dark3 },
  ['!'] = { fg = '#79c0ff', bg = M.bg.dark3 },
  t = { fg = '#79c0ff', bg = M.bg.dark3 },
  normal = { fg = '#6e40c9', bg = M.bg.dark3 },
  insert = { fg = '#79c0ff', bg = M.bg.dark3 },
  visual = { fg = '#a371f7', bg = M.bg.dark3 },
  select = { fg = '#a371f7', bg = M.bg.dark3 },
  replace = { fg = '#ff7b72', bg = M.bg.dark3 },
  command = { fg = '#e3b341', bg = M.bg.dark3 },
  terminal = { fg = '#79c0ff', bg = M.bg.dark3 },
  inactive = { fg = '#768390', bg = M.bg.dark3 },
}

M.git = { fg = '#79c0ff', bg = M.bg.main }
M.gitblame = { fg = '#768390', bg = M.bg.main }
M.githunks = { fg = '#6e40c9', bg = M.bg.main }
M.file = { fg = '#cdd9e5', bg = M.bg.light1 }
M.lsp = { fg = '#a371f7', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#ff7b72' },
  warn = { fg = '#d29922' },
  hint = { fg = '#54aeff' },
  info = { fg = '#8b949e' },
}
M.position = { fg = '#768390', bg = M.bg.main }

return M
