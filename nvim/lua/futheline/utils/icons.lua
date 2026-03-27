local M = {}

M.icons = {
	mode = {
		vim = '',
		neovim = '',
		custom = '',
		none = ''
	},

	git = {
		branch = '󰘬',
		added = '',
		removed = '',
		changed = '',
		modified = '✎',
		untracked = '󰐕',
	},

	diagnostics = {
		error = '',
		warn = '',
		hint = '',
		info = '',
	},

	lsp = {
		attached = '  ',
		disconnected = '  ',
	},

	file = {
		default = '󰈙',
		modified = '●',
		readonly = '',
	},

	filetype = {
		default = '󰈙',
		lua = '󰢱',
		javascript = '󰌞',
		typescript = '󰛦',
		tsx = '',
		jsx = '',
		python = '󰌠',
		bash = '�坑',
		sh = '�坑',
		zsh = '�坑',
		fish = '󰊢',
		json = '󰘦',
		yaml = '󱘚',
		yml = '󱘚',
		toml = '',
		xml = '󰗊',
		html = '󰌝',
		css = '󰌜',
		scss = '󰌜',
		markdown = '󰍔',
		md = '󰍔',
		vim = '',
		neovim = '',
		go = '󰟓',
		rust = '�秩',
		c = '',
		cpp = '',
		java = '󰗣',
		php = '󰌟',
		ruby = '󰴭',
		r = '󰟔',
	},

	format = {
		unix = 'LF',
		dos = 'CRLF',
		mac = 'CR',
	},

	indent = {
		tab = '⇥',
		space = '·',
	},

	filesize = {
		byte = 'B',
		kb = 'KB',
		mb = 'MB',
		gb = 'GB',
	},

	spell = {
		on = 'spell',
	},

	paste = {
		on = 'PASTE',
	},

	macro = {
		recording = 'recording',
	},

	search = {
		match = '/',
	},

	selection = {
		count = 'sel',
	},

	quickfix = {
		list = 'qf',
		loc = 'loc',
	},

	position = {
		text = "",
		line = "󰗉"
	},

	separators = {
		vertical = '│',
		vertical_thin = '┆',
		space = ' ',
	},
}

function M.get_icon(category, name, fallback)
	if M.icons[category] then
		return M.icons[category][name] or fallback or ''
	end
	return fallback or ''
end

return M
