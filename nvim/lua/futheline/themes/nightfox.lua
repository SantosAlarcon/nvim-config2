local M = {}

M.mode = {
  n = { fg = '#a3be8c', bg = '#232831' },
  no = { fg = '#a3be8c', bg = '#232831' },
  nov = { fg = '#a3be8c', bg = '#232831' },
  noV = { fg = '#a3be8c', bg = '#232831' },
  ['no\22'] = { fg = '#a3be8c', bg = '#232831' },
  niI = { fg = '#a3be8c', bg = '#232831' },
  niR = { fg = '#a3be8c', bg = '#232831' },
  niV = { fg = '#a3be8c', bg = '#232831' },
  v = { fg = '#81a1c1', bg = '#232831' },
  V = { fg = '#81a1c1', bg = '#232831' },
  ['^V'] = { fg = '#81a1c1', bg = '#232831' },
  s = { fg = '#b48ead', bg = '#232831' },
  S = { fg = '#b48ead', bg = '#232831' },
  ['^S'] = { fg = '#b48ead', bg = '#232831' },
  i = { fg = '#f6c177', bg = '#232831' },
  ic = { fg = '#f6c177', bg = '#232831' },
  ix = { fg = '#f6c177', bg = '#232831' },
  R = { fg = '#bf616a', bg = '#232831' },
  Rc = { fg = '#bf616a', bg = '#232831' },
  Rv = { fg = '#bf616a', bg = '#232831' },
  Rx = { fg = '#bf616a', bg = '#232831' },
  c = { fg = '#c9826b', bg = '#232831' },
  cv = { fg = '#c9826b', bg = '#232831' },
  ce = { fg = '#c9826b', bg = '#232831' },
  r = { fg = '#c9826b', bg = '#232831' },
  rm = { fg = '#c9826b', bg = '#232831' },
  ['r?'] = { fg = '#c9826b', bg = '#232831' },
  ['!'] = { fg = '#88c0d0', bg = '#232831' },
  t = { fg = '#88c0d0', bg = '#232831' },
  normal = { fg = '#a3be8c', bg = '#232831' },
  insert = { fg = '#f6c177', bg = '#232831' },
  visual = { fg = '#81a1c1', bg = '#232831' },
  select = { fg = '#b48ead', bg = '#232831' },
  replace = { fg = '#bf616a', bg = '#232831' },
  command = { fg = '#c9826b', bg = '#232831' },
  terminal = { fg = '#88c0d0', bg = '#232831' },
  inactive = { fg = '#60728a', bg = '#232831' },
}

M.git = { fg = '#88c0d0', bg = '#232831' }
M.gitblame = { fg = '#88c0d0', bg = '#232831' }
M.githunks = { fg = '#88c0d0', bg = '#232831' }
M.file = { fg = '#c7cdd9', bg = '#232831' }
M.lsp = { fg = '#b48ead', bg = '#232831' }
M.diagnostic = { fg = '#bf616a', bg = '#232831' }
M.position = { fg = '#abb1bb', bg = '#232831' }

return M
