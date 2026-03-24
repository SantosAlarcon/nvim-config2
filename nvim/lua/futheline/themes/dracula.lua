local M = {}

M.mode = {
  n = { fg = '#50fa7b', bg = '#282a36' },
  no = { fg = '#50fa7b', bg = '#282a36' },
  nov = { fg = '#50fa7b', bg = '#282a36' },
  noV = { fg = '#50fa7b', bg = '#282a36' },
  ['no\22'] = { fg = '#50fa7b', bg = '#282a36' },
  niI = { fg = '#50fa7b', bg = '#282a36' },
  niR = { fg = '#50fa7b', bg = '#282a36' },
  niV = { fg = '#50fa7b', bg = '#282a36' },
  v = { fg = '#bd93f9', bg = '#282a36' },
  V = { fg = '#bd93f9', bg = '#282a36' },
  ['^V'] = { fg = '#bd93f9', bg = '#282a36' },
  s = { fg = '#ff79c6', bg = '#282a36' },
  S = { fg = '#ff79c6', bg = '#282a36' },
  ['^S'] = { fg = '#ff79c6', bg = '#282a36' },
  i = { fg = '#ff79c6', bg = '#282a36' },
  ic = { fg = '#ff79c6', bg = '#282a36' },
  ix = { fg = '#ff79c6', bg = '#282a36' },
  R = { fg = '#ff5555', bg = '#282a36' },
  Rc = { fg = '#ff5555', bg = '#282a36' },
  Rv = { fg = '#ff5555', bg = '#282a36' },
  Rx = { fg = '#ff5555', bg = '#282a36' },
  c = { fg = '#ffb86c', bg = '#282a36' },
  cv = { fg = '#ffb86c', bg = '#282a36' },
  ce = { fg = '#ffb86c', bg = '#282a36' },
  r = { fg = '#ffb86c', bg = '#282a36' },
  rm = { fg = '#ffb86c', bg = '#282a36' },
  ['r?'] = { fg = '#ffb86c', bg = '#282a36' },
  ['!'] = { fg = '#8be9fd', bg = '#282a36' },
  t = { fg = '#8be9fd', bg = '#282a36' },
  normal = { fg = '#50fa7b', bg = '#282a36' },
  insert = { fg = '#ff79c6', bg = '#282a36' },
  visual = { fg = '#bd93f9', bg = '#282a36' },
  select = { fg = '#ff79c6', bg = '#282a36' },
  replace = { fg = '#ff5555', bg = '#282a36' },
  command = { fg = '#ffb86c', bg = '#282a36' },
  terminal = { fg = '#8be9fd', bg = '#282a36' },
  inactive = { fg = '#6272a4', bg = '#282a36' },
}

M.git = { fg = '#8be9fd', bg = '#282a36' }
M.gitblame = { fg = '#8be9fd', bg = '#282a36' }
M.githunks = { fg = '#8be9fd', bg = '#282a36' }
M.file = { fg = '#f8f8f2', bg = '#282a36' }
M.lsp = { fg = '#bd93f9', bg = '#282a36' }
M.diagnostic = { fg = '#ff5555', bg = '#282a36' }
M.position = { fg = '#d8dee9', bg = '#282a36' }

return M
