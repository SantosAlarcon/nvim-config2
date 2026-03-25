local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

local mode_labels = {
	n = 'NORMAL',
	no = 'NORMAL',
	nov = 'NORMAL',
	noV = 'NORMAL',
	['no\22'] = 'NORMAL',
	niI = 'NORMAL',
	niR = 'NORMAL',
	niV = 'NORMAL',
	v = 'VISUAL',
	V = 'V-LINE',
	['^V'] = 'V-BLOCK',
	s = 'SELECT',
	S = 'S-LINE',
	['^S'] = 'S-BLOCK',
	i = 'INSERT',
	ic = 'INSERT',
	ix = 'INSERT',
	R = 'REPLACE',
	Rc = 'REPLACE',
	Rv = 'V-REPLACE',
	Rx = 'REPLACE',
	c = 'COMMAND',
	cv = 'EX',
	ce = 'EX',
	r = 'PROMPT',
	rm = 'MORE',
	['r?'] = 'CONFIRM',
	['!'] = 'SHELL',
	t = 'TERMINAL',
}

local mode_short_labels = {
	n = 'N',
	no = 'N',
	nov = 'N',
	noV = 'N',
	['no\22'] = 'N',
	niI = 'N',
	niR = 'N',
	niV = 'N',
	v = 'V',
	V = 'VL',
	['^V'] = 'VB',
	s = 'S',
	S = 'SL',
	['^S'] = 'SB',
	i = 'I',
	ic = 'I',
	ix = 'I',
	R = 'R',
	Rc = 'R',
	Rv = 'R',
	Rx = 'R',
	c = 'C',
	cv = 'EX',
	ce = 'EX',
	r = 'P',
	rm = 'M',
	['r?'] = 'C',
	['!'] = 'T',
	t = 'T',
}

function M.render(config, theme, opts)
	local current_mode = state.mode or 'n'
	local mode_config = config.mode or {}
	local mode_style = opts.mode_style or mode_config.mode_style or 'icon_long'
	local icon_style = opts.icon_style or mode_config.icon_style or 'vim'
	local custom_icon = mode_config.custom_icon or ''
	local user_labels = mode_config.labels or {}
	local user_colors = mode_config.colors or {}

	local label
	if user_labels[current_mode] then
		label = user_labels[current_mode]
	elseif mode_style == 'short' then
		label = mode_short_labels[current_mode] or current_mode:upper()
	elseif mode_style == 'long' then
		label = mode_labels[current_mode] or current_mode:upper()
	else
		label = mode_short_labels[current_mode] or current_mode:upper()
	end

	local icon
	if icon_style == 'vim' then
		icon = icons.get_icon('mode', 'vim')
	elseif icon_style == 'neovim' then
		icon = icons.get_icon('mode', 'neovim')
	elseif icon_style == 'custom' then
		icon = custom_icon
	else
		icon = ''
	end

	local content
	if mode_style == 'icon' then
		content = ''
	elseif mode_style == 'icon_long' then
		content = label
	elseif mode_style == 'icon_short' then
		content = label
	else
		content = label
	end

	local color_key = user_colors[current_mode] and current_mode or 'normal'
	local mode_colors = user_colors[current_mode] or theme.mode[current_mode] or theme.mode.normal

	local default_icon_hl = config.default_icon_hl
	local default_border = config.default_border

	local hl_opts = opts and opts.hl
	local component_hl = {
		fg = mode_colors.fg,
		bg = mode_colors.bg,
	}
	if hl_opts then
		if hl_opts.fg then component_hl.fg = hl_opts.fg end
		if hl_opts.bg then component_hl.bg = hl_opts.bg end
		if hl_opts.bold then component_hl.bold = true end
	end

	local icon_hl_opts = opts and opts.icon_hl
	local component_icon_hl = icon_hl_opts or default_icon_hl

	local component = {
		content = content,
		icon = {
			text = icon,
			pos = 'left',
		},
		icon_hl = component_icon_hl,
		hl = component_hl,
		border_left = (opts and opts.border_left) or default_border,
		border_right = (opts and opts.border_right) or default_border,
	}

	return component
end

return M
