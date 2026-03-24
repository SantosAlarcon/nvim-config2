local M = {}

M.mode = {
  n = { fg = '#8ccf7e', bg = '#141b1e' },
  no = { fg = '#8ccf7e', bg = '#141b1e' },
  nov = { fg = '#8ccf7e', bg = '#141b1e' },
  noV = { fg = '#8ccf7e', bg = '#141b1e' },
  ['no\22'] = { fg = '#8ccf7e', bg = '#141b1e' },
  niI = { fg = '#8ccf7e', bg = '#141b1e' },
  niR = { fg = '#8ccf7e', bg = '#141b1e' },
  niV = { fg = '#8ccf7e', bg = '#141b1e' },
  v = { fg = '#c47fd5', bg = '#141b1e' },
  V = { fg = '#c47fd5', bg = '#141b1e' },
  ['^V'] = { fg = '#c47fd5', bg = '#141b1e' },
  s = { fg = '#c47fd5', bg = '#141b1e' },
  S = { fg = '#c47fd5', bg = '#141b1e' },
  ['^S'] = { fg = '#c47fd5', bg = '#141b1e' },
  i = { fg = '#67b0e8', bg = '#141b1e' },
  ic = { fg = '#67b0e8', bg = '#141b1e' },
  ix = { fg = '#67b0e8', bg = '#141b1e' },
  R = { fg = '#e57474', bg = '#141b1e' },
  Rc = { fg = '#e57474', bg = '#141b1e' },
  Rv = { fg = '#e57474', bg = '#141b1e' },
  Rx = { fg = '#e57474', bg = '#141b1e' },
  c = { fg = '#e5c76b', bg = '#141b1e' },
  cv = { fg = '#e5c76b', bg = '#141b1e' },
  ce = { fg = '#e5c76b', bg = '#141b1e' },
  r = { fg = '#e5c76b', bg = '#141b1e' },
  rm = { fg = '#e5c76b', bg = '#141b1e' },
  ['r?'] = { fg = '#e5c76b', bg = '#141b1e' },
  ['!'] = { fg = '#6cbfbf', bg = '#141b1e' },
  t = { fg = '#6cbfbf', bg = '#141b1e' },
  normal = { fg = '#8ccf7e', bg = '#141b1e' },
  insert = { fg = '#67b0e8', bg = '#141b1e' },
  visual = { fg = '#c47fd5', bg = '#141b1e' },
  select = { fg = '#c47fd5', bg = '#141b1e' },
  replace = { fg = '#e57474', bg = '#141b1e' },
  command = { fg = '#e5c76b', bg = '#141b1e' },
  terminal = { fg = '#6cbfbf', bg = '#141b1e' },
  inactive = { fg = '#b3b9b8', bg = '#141b1e' },
}

M.git = { fg = '#6cbfbf', bg = '#141b1e' }
M.gitblame = { fg = '#6cbfbf', bg = '#141b1e' }
M.githunks = { fg = '#6cbfbf', bg = '#141b1e' }
M.file = { fg = '#dadada', bg = '#141b1e' }
M.lsp = { fg = '#c47fd5', bg = '#141b1e' }
M.diagnostic = { fg = '#e57474', bg = '#141b1e' }
M.position = { fg = '#b3b9b8', bg = '#141b1e' }

return M
