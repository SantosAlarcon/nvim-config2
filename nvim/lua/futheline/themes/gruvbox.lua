local M = {}

M.mode = {
  n = { fg = '#b8bb26', bg = '#282828' },
  no = { fg = '#b8bb26', bg = '#282828' },
  nov = { fg = '#b8bb26', bg = '#282828' },
  noV = { fg = '#b8bb26', bg = '#282828' },
  ['no\22'] = { fg = '#b8bb26', bg = '#282828' },
  niI = { fg = '#b8bb26', bg = '#282828' },
  niR = { fg = '#b8bb26', bg = '#282828' },
  niV = { fg = '#b8bb26', bg = '#282828' },
  v = { fg = '#83a598', bg = '#282828' },
  V = { fg = '#83a598', bg = '#282828' },
  ['^V'] = { fg = '#83a598', bg = '#282828' },
  s = { fg = '#d3869b', bg = '#282828' },
  S = { fg = '#d3869b', bg = '#282828' },
  ['^S'] = { fg = '#d3869b', bg = '#282828' },
  i = { fg = '#fabd2f', bg = '#282828' },
  ic = { fg = '#fabd2f', bg = '#282828' },
  ix = { fg = '#fabd2f', bg = '#282828' },
  R = { fg = '#fb4934', bg = '#282828' },
  Rc = { fg = '#fb4934', bg = '#282828' },
  Rv = { fg = '#fb4934', bg = '#282828' },
  Rx = { fg = '#fb4934', bg = '#282828' },
  c = { fg = '#fe8019', bg = '#282828' },
  cv = { fg = '#fe8019', bg = '#282828' },
  ce = { fg = '#fe8019', bg = '#282828' },
  r = { fg = '#fe8019', bg = '#282828' },
  rm = { fg = '#fe8019', bg = '#282828' },
  ['r?'] = { fg = '#fe8019', bg = '#282828' },
  ['!'] = { fg = '#8ec07c', bg = '#282828' },
  t = { fg = '#8ec07c', bg = '#282828' },
  normal = { fg = '#b8bb26', bg = '#282828' },
  insert = { fg = '#fabd2f', bg = '#282828' },
  visual = { fg = '#83a598', bg = '#282828' },
  select = { fg = '#d3869b', bg = '#282828' },
  replace = { fg = '#fb4934', bg = '#282828' },
  command = { fg = '#fe8019', bg = '#282828' },
  terminal = { fg = '#8ec07c', bg = '#282828' },
  inactive = { fg = '#928374', bg = '#282828' },
}

M.git = { fg = '#8ec07c', bg = '#282828' }
M.gitblame = { fg = '#8ec07c', bg = '#282828' }
M.githunks = { fg = '#8ec07c', bg = '#282828' }
M.file = { fg = '#ebdbb2', bg = '#282828' }
M.lsp = { fg = '#d3869b', bg = '#282828' }
M.diagnostic = { fg = '#fb4934', bg = '#282828' }
M.position = { fg = '#d5c4a1', bg = '#282828' }

return M
