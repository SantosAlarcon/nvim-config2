local M = {}

M.mode = {
  n = { fg = '#9ece6a', bg = '#1f2335' },
  no = { fg = '#9ece6a', bg = '#1f2335' },
  nov = { fg = '#9ece6a', bg = '#1f2335' },
  noV = { fg = '#9ece6a', bg = '#1f2335' },
  ['no\22'] = { fg = '#9ece6a', bg = '#1f2335' },
  niI = { fg = '#9ece6a', bg = '#1f2335' },
  niR = { fg = '#9ece6a', bg = '#1f2335' },
  niV = { fg = '#9ece6a', bg = '#1f2335' },
  v = { fg = '#bb9af7', bg = '#1f2335' },
  V = { fg = '#bb9af7', bg = '#1f2335' },
  ['^V'] = { fg = '#bb9af7', bg = '#1f2335' },
  s = { fg = '#ff9e64', bg = '#1f2335' },
  S = { fg = '#ff9e64', bg = '#1f2335' },
  ['^S'] = { fg = '#ff9e64', bg = '#1f2335' },
  i = { fg = '#7aa2f7', bg = '#1f2335' },
  ic = { fg = '#7aa2f7', bg = '#1f2335' },
  ix = { fg = '#7aa2f7', bg = '#1f2335' },
  R = { fg = '#f7768e', bg = '#1f2335' },
  Rc = { fg = '#f7768e', bg = '#1f2335' },
  Rv = { fg = '#f7768e', bg = '#1f2335' },
  Rx = { fg = '#f7768e', bg = '#1f2335' },
  c = { fg = '#e0af68', bg = '#1f2335' },
  cv = { fg = '#e0af68', bg = '#1f2335' },
  ce = { fg = '#e0af68', bg = '#1f2335' },
  r = { fg = '#e0af68', bg = '#1f2335' },
  rm = { fg = '#e0af68', bg = '#1f2335' },
  ['r?'] = { fg = '#e0af68', bg = '#1f2335' },
  ['!'] = { fg = '#7dcfff', bg = '#1f2335' },
  t = { fg = '#7dcfff', bg = '#1f2335' },
  normal = { fg = '#9ece6a', bg = '#1f2335' },
  insert = { fg = '#7aa2f7', bg = '#1f2335' },
  visual = { fg = '#bb9af7', bg = '#1f2335' },
  select = { fg = '#ff9e64', bg = '#1f2335' },
  replace = { fg = '#f7768e', bg = '#1f2335' },
  command = { fg = '#e0af68', bg = '#1f2335' },
  terminal = { fg = '#7dcfff', bg = '#1f2335' },
  inactive = { fg = '#565f89', bg = '#1f2335' },
}

M.git = {
  fg = '#7dcfff',
  bg = '#1f2335',
}

M.gitblame = {
  fg = '#7dcfff',
  bg = '#1f2335',
}

M.githunks = {
  fg = '#7dcfff',
  bg = '#1f2335',
}

M.file = {
  fg = '#c0caf5',
  bg = '#1f2335',
}

M.lsp = {
  fg = '#7aa2f7',
  bg = '#1f2335',
}

M.diagnostic = {
  fg = '#f7768e',
  bg = '#1f2335',
}

M.position = {
  fg = '#a9b1d6',
  bg = '#1f2335',
}

return M
