local M = {}

M.mode = {
  n = { fg = '#88c0d0', bg = '#2e3440' },
  no = { fg = '#88c0d0', bg = '#2e3440' },
  nov = { fg = '#88c0d0', bg = '#2e3440' },
  noV = { fg = '#88c0d0', bg = '#2e3440' },
  ['no\22'] = { fg = '#88c0d0', bg = '#2e3440' },
  niI = { fg = '#88c0d0', bg = '#2e3440' },
  niR = { fg = '#88c0d0', bg = '#2e3440' },
  niV = { fg = '#88c0d0', bg = '#2e3440' },
  v = { fg = '#81a1c1', bg = '#2e3440' },
  V = { fg = '#81a1c1', bg = '#2e3440' },
  ['^V'] = { fg = '#81a1c1', bg = '#2e3440' },
  s = { fg = '#5e81ac', bg = '#2e3440' },
  S = { fg = '#5e81ac', bg = '#2e3440' },
  ['^S'] = { fg = '#5e81ac', bg = '#2e3440' },
  i = { fg = '#a3be8c', bg = '#2e3440' },
  ic = { fg = '#a3be8c', bg = '#2e3440' },
  ix = { fg = '#a3be8c', bg = '#2e3440' },
  R = { fg = '#bf616a', bg = '#2e3440' },
  Rc = { fg = '#bf616a', bg = '#2e3440' },
  Rv = { fg = '#bf616a', bg = '#2e3440' },
  Rx = { fg = '#bf616a', bg = '#2e3440' },
  c = { fg = '#d08770', bg = '#2e3440' },
  cv = { fg = '#d08770', bg = '#2e3440' },
  ce = { fg = '#d08770', bg = '#2e3440' },
  r = { fg = '#d08770', bg = '#2e3440' },
  rm = { fg = '#d08770', bg = '#2e3440' },
  ['r?'] = { fg = '#d08770', bg = '#2e3440' },
  ['!'] = { fg = '#8fbcbb', bg = '#2e3440' },
  t = { fg = '#8fbcbb', bg = '#2e3440' },
  normal = { fg = '#88c0d0', bg = '#2e3440' },
  insert = { fg = '#a3be8c', bg = '#2e3440' },
  visual = { fg = '#81a1c1', bg = '#2e3440' },
  select = { fg = '#5e81ac', bg = '#2e3440' },
  replace = { fg = '#bf616a', bg = '#2e3440' },
  command = { fg = '#d08770', bg = '#2e3440' },
  terminal = { fg = '#8fbcbb', bg = '#2e3440' },
  inactive = { fg = '#4c566a', bg = '#2e3440' },
}

M.git = { fg = '#8fbcbb', bg = '#2e3440' }
M.gitblame = { fg = '#8fbcbb', bg = '#2e3440' }
M.githunks = { fg = '#8fbcbb', bg = '#2e3440' }
M.file = { fg = '#d8dee9', bg = '#2e3440' }
M.lsp = { fg = '#81a1c1', bg = '#2e3440' }
M.diagnostic = { fg = '#bf616a', bg = '#2e3440' }
M.position = { fg = '#eceff4', bg = '#2e3440' }

return M
