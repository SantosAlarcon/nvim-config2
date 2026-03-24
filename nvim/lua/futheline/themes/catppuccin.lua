local M = {}

M.mode = {
  n = { fg = '#a6e3a1', bg = '#1e1e2e' },
  no = { fg = '#a6e3a1', bg = '#1e1e2e' },
  nov = { fg = '#a6e3a1', bg = '#1e1e2e' },
  noV = { fg = '#a6e3a1', bg = '#1e1e2e' },
  ['no\22'] = { fg = '#a6e3a1', bg = '#1e1e2e' },
  niI = { fg = '#a6e3a1', bg = '#1e1e2e' },
  niR = { fg = '#a6e3a1', bg = '#1e1e2e' },
  niV = { fg = '#a6e3a1', bg = '#1e1e2e' },
  v = { fg = '#f5c2e7', bg = '#1e1e2e' },
  V = { fg = '#f5c2e7', bg = '#1e1e2e' },
  ['^V'] = { fg = '#f5c2e7', bg = '#1e1e2e' },
  s = { fg = '#cba6f7', bg = '#1e1e2e' },
  S = { fg = '#cba6f7', bg = '#1e1e2e' },
  ['^S'] = { fg = '#cba6f7', bg = '#1e1e2e' },
  i = { fg = '#89b4fa', bg = '#1e1e2e' },
  ic = { fg = '#89b4fa', bg = '#1e1e2e' },
  ix = { fg = '#89b4fa', bg = '#1e1e2e' },
  R = { fg = '#f38ba8', bg = '#1e1e2e' },
  Rc = { fg = '#f38ba8', bg = '#1e1e2e' },
  Rv = { fg = '#f38ba8', bg = '#1e1e2e' },
  Rx = { fg = '#f38ba8', bg = '#1e1e2e' },
  c = { fg = '#fab387', bg = '#1e1e2e' },
  cv = { fg = '#fab387', bg = '#1e1e2e' },
  ce = { fg = '#fab387', bg = '#1e1e2e' },
  r = { fg = '#fab387', bg = '#1e1e2e' },
  rm = { fg = '#fab387', bg = '#1e1e2e' },
  ['r?'] = { fg = '#fab387', bg = '#1e1e2e' },
  ['!'] = { fg = '#89dceb', bg = '#1e1e2e' },
  t = { fg = '#89dceb', bg = '#1e1e2e' },
  normal = { fg = '#a6e3a1', bg = '#1e1e2e' },
  insert = { fg = '#89b4fa', bg = '#1e1e2e' },
  visual = { fg = '#f5c2e7', bg = '#1e1e2e' },
  select = { fg = '#cba6f7', bg = '#1e1e2e' },
  replace = { fg = '#f38ba8', bg = '#1e1e2e' },
  command = { fg = '#fab387', bg = '#1e1e2e' },
  terminal = { fg = '#89dceb', bg = '#1e1e2e' },
  inactive = { fg = '#6c7086', bg = '#1e1e2e' },
}

M.git = { fg = '#89b4fa', bg = '#1e1e2e' }
M.gitblame = { fg = '#89b4fa', bg = '#1e1e2e' }
M.githunks = { fg = '#89b4fa', bg = '#1e1e2e' }
M.file = { fg = '#cdd6f4', bg = '#1e1e2e' }
M.lsp = { fg = '#cba6f7', bg = '#1e1e2e' }
M.diagnostic = { fg = '#f38ba8', bg = '#1e1e2e' }
M.position = { fg = '#bac2de', bg = '#1e1e2e' }

return M
