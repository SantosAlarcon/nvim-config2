local M = {}

M.mode = {
  n = { fg = '#3fb950', bg = '#0d1117' },
  no = { fg = '#3fb950', bg = '#0d1117' },
  nov = { fg = '#3fb950', bg = '#0d1117' },
  noV = { fg = '#3fb950', bg = '#0d1117' },
  ['no\22'] = { fg = '#3fb950', bg = '#0d1117' },
  niI = { fg = '#3fb950', bg = '#0d1117' },
  niR = { fg = '#3fb950', bg = '#0d1117' },
  niV = { fg = '#3fb950', bg = '#0d1117' },
  v = { fg = '#a371f7', bg = '#0d1117' },
  V = { fg = '#a371f7', bg = '#0d1117' },
  ['^V'] = { fg = '#a371f7', bg = '#0d1117' },
  s = { fg = '#a371f7', bg = '#0d1117' },
  S = { fg = '#a371f7', bg = '#0d1117' },
  ['^S'] = { fg = '#a371f7', bg = '#0d1117' },
  i = { fg = '#58a6ff', bg = '#0d1117' },
  ic = { fg = '#58a6ff', bg = '#0d1117' },
  ix = { fg = '#58a6ff', bg = '#0d1117' },
  R = { fg = '#f85149', bg = '#0d1117' },
  Rc = { fg = '#f85149', bg = '#0d1117' },
  Rv = { fg = '#f85149', bg = '#0d1117' },
  Rx = { fg = '#f85149', bg = '#0d1117' },
  c = { fg = '#d29922', bg = '#0d1117' },
  cv = { fg = '#d29922', bg = '#0d1117' },
  ce = { fg = '#d29922', bg = '#0d1117' },
  r = { fg = '#d29922', bg = '#0d1117' },
  rm = { fg = '#d29922', bg = '#0d1117' },
  ['r?'] = { fg = '#d29922', bg = '#0d1117' },
  ['!'] = { fg = '#58a6ff', bg = '#0d1117' },
  t = { fg = '#58a6ff', bg = '#0d1117' },
  normal = { fg = '#3fb950', bg = '#0d1117' },
  insert = { fg = '#58a6ff', bg = '#0d1117' },
  visual = { fg = '#a371f7', bg = '#0d1117' },
  select = { fg = '#a371f7', bg = '#0d1117' },
  replace = { fg = '#f85149', bg = '#0d1117' },
  command = { fg = '#d29922', bg = '#0d1117' },
  terminal = { fg = '#58a6ff', bg = '#0d1117' },
  inactive = { fg = '#8b949e', bg = '#0d1117' },
}

M.git = { fg = '#58a6ff', bg = '#0d1117' }
M.gitblame = { fg = '#8b949e', bg = '#0d1117' }
M.githunks = { fg = '#3fb950', bg = '#0d1117' }
M.file = { fg = '#e6edf3', bg = '#0d1117' }
M.lsp = { fg = '#a371f7', bg = '#0d1117' }
M.diagnostic = { fg = '#f85149', bg = '#0d1117' }
M.position = { fg = '#8b949e', bg = '#0d1117' }

return M
