local M = {}

local colors = require('futheline.utils.colors')

local main = '#ffffff'
local shades = colors.generate_shades(main, 10)

M.shades = {
	shades[1],
	shades[2],
	shades[3],
	shades[4],
	shades[5],
	shades[6],
	shades[7],
	shades[8],
	shades[9],
	shades[10],
}

M.bg = {
	main = shades[5],
	dark1 = shades[1],
	dark2 = shades[2],
	dark3 = shades[3],
	dark4 = shades[4],
	light1 = shades[6],
	light2 = shades[7],
	light3 = shades[8],
	light4 = shades[9],
	lightest = shades[10],
}

M.mode = {
	n = { fg = '#116329', bg = M.bg.dark3 },
	no = { fg = '#116329', bg = M.bg.dark3 },
	nov = { fg = '#116329', bg = M.bg.dark3 },
	noV = { fg = '#116329', bg = M.bg.dark3 },
	['no\22'] = { fg = '#116329', bg = M.bg.dark3 },
	niI = { fg = '#116329', bg = M.bg.dark3 },
	niR = { fg = '#116329', bg = M.bg.dark3 },
	niV = { fg = '#116329', bg = M.bg.dark3 },
	v = { fg = '#8250df', bg = M.bg.dark3 },
	V = { fg = '#8250df', bg = M.bg.dark3 },
	['^V'] = { fg = '#8250df', bg = M.bg.dark3 },
	s = { fg = '#8250df', bg = M.bg.dark3 },
	S = { fg = '#8250df', bg = M.bg.dark3 },
	['^S'] = { fg = '#8250df', bg = M.bg.dark3 },
	i = { fg = '#0969da', bg = M.bg.dark3 },
	ic = { fg = '#0969da', bg = M.bg.dark3 },
	ix = { fg = '#0969da', bg = M.bg.dark3 },
	R = { fg = '#cf222e', bg = M.bg.dark3 },
	Rc = { fg = '#cf222e', bg = M.bg.dark3 },
	Rv = { fg = '#cf222e', bg = M.bg.dark3 },
	Rx = { fg = '#cf222e', bg = M.bg.dark3 },
	c = { fg = '#bf8700', bg = M.bg.dark3 },
	cv = { fg = '#bf8700', bg = M.bg.dark3 },
	ce = { fg = '#bf8700', bg = M.bg.dark3 },
	r = { fg = '#bf8700', bg = M.bg.dark3 },
	rm = { fg = '#bf8700', bg = M.bg.dark3 },
	['r?'] = { fg = '#bf8700', bg = M.bg.dark3 },
	['!'] = { fg = '#0969da', bg = M.bg.dark3 },
	t = { fg = '#0969da', bg = M.bg.dark3 },
	normal = { fg = '#116329', bg = M.bg.dark3 },
	insert = { fg = '#0969da', bg = M.bg.dark3 },
	visual = { fg = '#8250df', bg = M.bg.dark3 },
	select = { fg = '#8250df', bg = M.bg.dark3 },
	replace = { fg = '#cf222e', bg = M.bg.dark3 },
	command = { fg = '#bf8700', bg = M.bg.dark3 },
	terminal = { fg = '#0969da', bg = M.bg.dark3 },
	inactive = { fg = '#6e7781', bg = M.bg.dark3 },
}

M.git = { fg = '#0969da', bg = M.bg.main }
M.gitblame = { fg = '#6e7781', bg = M.bg.main }
M.githunks = { fg = '#116329', bg = M.bg.main }
M.file = { fg = '#1f2328', bg = M.bg.light1 }
M.lsp = { fg = '#8250df', bg = M.bg.main }
M.diagnostics = {
  error = { fg = '#cf222e' },
  warn = { fg = '#9a6700' },
  hint = { fg = '#0969da' },
  info = { fg = '#1a7c37' },
}
M.position = { fg = '#6e7781', bg = M.bg.main }

return M
