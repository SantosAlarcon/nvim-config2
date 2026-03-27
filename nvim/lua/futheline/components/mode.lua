local M = {}

local state = require('futheline.state').state
local icons = require('futheline.utils.icons')

local mode_info = {
	['n']     = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['no']    = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['nov']   = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['noV']   = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['no\22'] = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['niI']   = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['niR']   = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['niV']   = { long = 'NORMAL', short = 'N', mode = 'normal' },
	['v']     = { long = 'VISUAL', short = 'V', mode = 'visual' },
	['V']     = { long = 'V-LINE', short = 'VL', mode = 'visual' },
	['^V']    = { long = 'V-BLOCK', short = 'VB', mode = 'visual' },
	['s']     = { long = 'SELECT', short = 'S', mode = 'visual' },
	['S']     = { long = 'S-LINE', short = 'SL', mode = 'visual' },
	['^S']    = { long = 'S-BLOCK', short = 'SB', mode = 'visual' },
	['i']     = { long = 'INSERT', short = 'I', mode = 'insert' },
	['ic']    = { long = 'INSERT', short = 'I', mode = 'insert' },
	['ix']    = { long = 'INSERT', short = 'I', mode = 'insert' },
	['R']     = { long = 'REPLACE', short = 'R', mode = 'replace' },
	['Rc']    = { long = 'REPLACE', short = 'R', mode = 'replace' },
	['Rv']    = { long = 'V-REPLACE', short = 'R', mode = 'replace' },
	['Rx']    = { long = 'REPLACE', short = 'R', mode = 'replace' },
	['c']     = { long = 'COMMAND', short = 'C', mode = 'command' },
	['cv']    = { long = 'EX', short = 'EX', mode = 'command' },
	['ce']    = { long = 'EX', short = 'EX', mode = 'command' },
	['r']     = { long = 'PROMPT', short = 'P', mode = 'prompt' },
	['rm']    = { long = 'MORE', short = 'M', mode = 'prompt' },
	['r?']    = { long = 'CONFIRM', short = 'C', mode = 'prompt' },
	['!']     = { long = 'SHELL', short = 'T', mode = 'terminal' },
	['t']     = { long = 'TERMINAL', short = 'T', mode = 'terminal' },
}

function M.render(config, theme, opts)
	local current_mode = state.mode or 'n'
	local mode_config = config.mode
	local style = opts.mode_style or mode_config.mode_style or 'icon_long'
	local icon_style = opts.icon_style or mode_config.icon_style or 'vim'
	local labels = mode_config.labels or {}
	local colors = mode_config.colors or {}

	local show_icon = opts.show_icon
	if show_icon == nil then
		show_icon = config.icons
	end

	local info = mode_info[current_mode]
	local mode_key = labels[current_mode] and current_mode or info.mode
	local label = labels[current_mode]
		or (style == 'short' and info.short)
		or info.long

	local icon = ''
	if show_icon then
		local icon_map = {
			vim = icons.get_icon('mode', 'vim'),
			neovim = icons.get_icon('mode', 'neovim'),
			custom = mode_config.custom_icon,
		}
		icon = icon_map[icon_style] or ''
	end

	local show_label = style ~= 'icon'

	local mode_colors = colors[current_mode] or theme.mode[mode_key]

	local component_hl = { fg = mode_colors.fg, bg = mode_colors.bg }
	if opts.hl then
		if opts.hl.fg then component_hl.fg = opts.hl.fg end
		if opts.hl.bg then component_hl.bg = opts.hl.bg end
		if opts.hl.bold then component_hl.bold = true end
	end

	return {
		content = show_label and label or '',
		icon = { text = icon, pos = 'left' },
		icon_hl = opts.icon_hl or config.default_icon_hl,
		hl = component_hl,
		border_left = opts.border_left or config.default_border,
		border_right = opts.border_right or config.default_border,
	}
end

return M
