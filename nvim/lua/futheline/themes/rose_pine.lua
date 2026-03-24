local M = {}

M.mode = {
  n = { fg = '#9ccfd8', bg = '#191724' },
  no = { fg = '#9ccfd8', bg = '#191724' },
  nov = { fg = '#9ccfd8', bg = '#191724' },
  noV = { fg = '#9ccfd8', bg = '#191724' },
  ['no\22'] = { fg = '#9ccfd8', bg = '#191724' },
  niI = { fg = '#9ccfd8', bg = '#191724' },
  niR = { fg = '#9ccfd8', bg = '#191724' },
  niV = { fg = '#9ccfd8', bg = '#191724' },
  v = { fg = '#f6c177', bg = '#191724' },
  V = { fg = '#f6c177', bg = '#191724' },
  ['^V'] = { fg = '#f6c177', bg = '#191724' },
  s = { fg = '#c4a7e7', bg = '#191724' },
  S = { fg = '#c4a7e7', bg = '#191724' },
  ['^S'] = { fg = '#c4a7e7', bg = '#191724' },
  i = { fg = '#eb6f92', bg = '#191724' },
  ic = { fg = '#eb6f92', bg = '#191724' },
  ix = { fg = '#eb6f92', bg = '#191724' },
  R = { fg = '#31748f', bg = '#191724' },
  Rc = { fg = '#31748f', bg = '#191724' },
  Rv = { fg = '#31748f', bg = '#191724' },
  Rx = { fg = '#31748f', bg = '#191724' },
  c = { fg = '#c4a7e7', bg = '#191724' },
  cv = { fg = '#c4a7e7', bg = '#191724' },
  ce = { fg = '#c4a7e7', bg = '#191724' },
  r = { fg = '#c4a7e7', bg = '#191724' },
  rm = { fg = '#c4a7e7', bg = '#191724' },
  ['r?'] = { fg = '#c4a7e7', bg = '#191724' },
  ['!'] = { fg = '#9ccfd8', bg = '#191724' },
  t = { fg = '#9ccfd8', bg = '#191724' },
  normal = { fg = '#9ccfd8', bg = '#191724' },
  insert = { fg = '#eb6f92', bg = '#191724' },
  visual = { fg = '#f6c177', bg = '#191724' },
  select = { fg = '#c4a7e7', bg = '#191724' },
  replace = { fg = '#31748f', bg = '#191724' },
  command = { fg = '#c4a7e7', bg = '#191724' },
  terminal = { fg = '#9ccfd8', bg = '#191724' },
  inactive = { fg = '#6e6a86', bg = '#191724' },
}

M.git = { fg = '#9ccfd8', bg = '#191724' }
M.gitblame = { fg = '#9ccfd8', bg = '#191724' }
M.githunks = { fg = '#9ccfd8', bg = '#191724' }
M.file = { fg = '#e0def4', bg = '#191724' }
M.lsp = { fg = '#c4a7e7', bg = '#191724' }
M.diagnostic = { fg = '#eb6f92', bg = '#191724' }
M.position = { fg = '#908caa', bg = '#191724' }

return M
