local M = {}

M.mode = {
  n = { fg = '#6e40c9', bg = '#1c2128' },
  no = { fg = '#6e40c9', bg = '#1c2128' },
  nov = { fg = '#6e40c9', bg = '#1c2128' },
  noV = { fg = '#6e40c9', bg = '#1c2128' },
  ['no\22'] = { fg = '#6e40c9', bg = '#1c2128' },
  niI = { fg = '#6e40c9', bg = '#1c2128' },
  niR = { fg = '#6e40c9', bg = '#1c2128' },
  niV = { fg = '#6e40c9', bg = '#1c2128' },
  v = { fg = '#a371f7', bg = '#1c2128' },
  V = { fg = '#a371f7', bg = '#1c2128' },
  ['^V'] = { fg = '#a371f7', bg = '#1c2128' },
  s = { fg = '#a371f7', bg = '#1c2128' },
  S = { fg = '#a371f7', bg = '#1c2128' },
  ['^S'] = { fg = '#a371f7', bg = '#1c2128' },
  i = { fg = '#79c0ff', bg = '#1c2128' },
  ic = { fg = '#79c0ff', bg = '#1c2128' },
  ix = { fg = '#79c0ff', bg = '#1c2128' },
  R = { fg = '#ff7b72', bg = '#1c2128' },
  Rc = { fg = '#ff7b72', bg = '#1c2128' },
  Rv = { fg = '#ff7b72', bg = '#1c2128' },
  Rx = { fg = '#ff7b72', bg = '#1c2128' },
  c = { fg = '#e3b341', bg = '#1c2128' },
  cv = { fg = '#e3b341', bg = '#1c2128' },
  ce = { fg = '#e3b341', bg = '#1c2128' },
  r = { fg = '#e3b341', bg = '#1c2128' },
  rm = { fg = '#e3b341', bg = '#1c2128' },
  ['r?'] = { fg = '#e3b341', bg = '#1c2128' },
  ['!'] = { fg = '#79c0ff', bg = '#1c2128' },
  t = { fg = '#79c0ff', bg = '#1c2128' },
  normal = { fg = '#6e40c9', bg = '#1c2128' },
  insert = { fg = '#79c0ff', bg = '#1c2128' },
  visual = { fg = '#a371f7', bg = '#1c2128' },
  select = { fg = '#a371f7', bg = '#1c2128' },
  replace = { fg = '#ff7b72', bg = '#1c2128' },
  command = { fg = '#e3b341', bg = '#1c2128' },
  terminal = { fg = '#79c0ff', bg = '#1c2128' },
  inactive = { fg = '#768390', bg = '#1c2128' },
}

M.git = { fg = '#79c0ff', bg = '#1c2128' }
M.gitblame = { fg = '#768390', bg = '#1c2128' }
M.githunks = { fg = '#6e40c9', bg = '#1c2128' }
M.file = { fg = '#cdd9e5', bg = '#1c2128' }
M.lsp = { fg = '#a371f7', bg = '#1c2128' }
M.diagnostic = { fg = '#ff7b72', bg = '#1c2128' }
M.position = { fg = '#768390', bg = '#1c2128' }

return M
