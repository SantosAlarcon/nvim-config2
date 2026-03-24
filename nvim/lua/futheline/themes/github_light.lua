local M = {}

M.mode = {
  n = { fg = '#116329', bg = '#ffffff' },
  no = { fg = '#116329', bg = '#ffffff' },
  nov = { fg = '#116329', bg = '#ffffff' },
  noV = { fg = '#116329', bg = '#ffffff' },
  ['no\22'] = { fg = '#116329', bg = '#ffffff' },
  niI = { fg = '#116329', bg = '#ffffff' },
  niR = { fg = '#116329', bg = '#ffffff' },
  niV = { fg = '#116329', bg = '#ffffff' },
  v = { fg = '#8250df', bg = '#ffffff' },
  V = { fg = '#8250df', bg = '#ffffff' },
  ['^V'] = { fg = '#8250df', bg = '#ffffff' },
  s = { fg = '#8250df', bg = '#ffffff' },
  S = { fg = '#8250df', bg = '#ffffff' },
  ['^S'] = { fg = '#8250df', bg = '#ffffff' },
  i = { fg = '#0969da', bg = '#ffffff' },
  ic = { fg = '#0969da', bg = '#ffffff' },
  ix = { fg = '#0969da', bg = '#ffffff' },
  R = { fg = '#cf222e', bg = '#ffffff' },
  Rc = { fg = '#cf222e', bg = '#ffffff' },
  Rv = { fg = '#cf222e', bg = '#ffffff' },
  Rx = { fg = '#cf222e', bg = '#ffffff' },
  c = { fg = '#bf8700', bg = '#ffffff' },
  cv = { fg = '#bf8700', bg = '#ffffff' },
  ce = { fg = '#bf8700', bg = '#ffffff' },
  r = { fg = '#bf8700', bg = '#ffffff' },
  rm = { fg = '#bf8700', bg = '#ffffff' },
  ['r?'] = { fg = '#bf8700', bg = '#ffffff' },
  ['!'] = { fg = '#0969da', bg = '#ffffff' },
  t = { fg = '#0969da', bg = '#ffffff' },
  normal = { fg = '#116329', bg = '#ffffff' },
  insert = { fg = '#0969da', bg = '#ffffff' },
  visual = { fg = '#8250df', bg = '#ffffff' },
  select = { fg = '#8250df', bg = '#ffffff' },
  replace = { fg = '#cf222e', bg = '#ffffff' },
  command = { fg = '#bf8700', bg = '#ffffff' },
  terminal = { fg = '#0969da', bg = '#ffffff' },
  inactive = { fg = '#6e7781', bg = '#ffffff' },
}

M.git = { fg = '#0969da', bg = '#ffffff' }
M.gitblame = { fg = '#6e7781', bg = '#ffffff' }
M.githunks = { fg = '#116329', bg = '#ffffff' }
M.file = { fg = '#1f2328', bg = '#ffffff' }
M.lsp = { fg = '#8250df', bg = '#ffffff' }
M.diagnostic = { fg = '#cf222e', bg = '#ffffff' }
M.position = { fg = '#6e7781', bg = '#ffffff' }

return M
