local M = {}

local border = require('futheline.utils.border')

local function resolve_color(color, theme, mode, color_type)
	if color == 'mode' then
		local mode_colors = theme.mode and theme.mode[mode]
		if mode_colors then
			return mode_colors[color_type] or '#c0caf5'
		end
		return '#c0caf5'
	end
	return color
end

function M.create_hl(name, fg, bg, bold)
	local opts = { fg = fg, bg = bg }
	if bold then
		opts.bold = true
	end
	vim.api.nvim_set_hl(0, 'Futheline' .. name, opts)
end

function M.setup_highlights(sections, theme, mode)
	vim.api.nvim_set_hl(0, 'FuthelineDefault', { fg = '#c0caf5', bg = 'NONE' })

	local all_comps = {}
	vim.list_extend(all_comps, sections.left or {})
	vim.list_extend(all_comps, sections.center or {})
	vim.list_extend(all_comps, sections.right or {})

	for _, comp in ipairs(all_comps) do
		if comp then
			local idx = comp._index or 1

			if comp.hl then
				local fg = resolve_color(comp.hl.fg, theme, mode, 'fg')
				local bg = resolve_color(comp.hl.bg, theme, mode, 'bg')
				M.create_hl('Comp' .. idx, fg, bg, comp.hl.bold)
			end
			if comp.icon_hl then
				local fg = resolve_color(comp.icon_hl.fg, theme, mode, 'fg')
				local bg = resolve_color(comp.icon_hl.bg, theme, mode, 'bg')
				M.create_hl('IconFg' .. idx, fg, bg, comp.icon_hl.bold)
			elseif comp.icon and comp.icon.hl then
				local fg = resolve_color(comp.icon.hl.fg, theme, mode, 'fg')
				local bg = resolve_color(comp.icon.hl.bg, theme, mode, 'bg')
				M.create_hl('IconFg' .. idx, fg, bg)
			end
			if comp.border_left and comp.border_left.hl then
				local fg = resolve_color(comp.border_left.hl.fg, theme, mode, 'fg')
				local bg = resolve_color(comp.border_left.hl.bg, theme, mode, 'bg')
				M.create_hl('BorderLeft' .. idx, fg, bg, comp.border_left.hl.bold)
			end
			if comp.border_right and comp.border_right.hl then
				local fg = resolve_color(comp.border_right.hl.fg, theme, mode, 'fg')
				local bg = resolve_color(comp.border_right.hl.bg, theme, mode, 'bg')
				M.create_hl('BorderRight' .. idx, fg, bg, comp.border_right.hl.bold)
			end
		end
	end
end

function M.render_component(comp, comp_index, default_icon_hl, default_border)
	if not comp then return '' end

	local idx = comp._index or comp_index
	local parts = {}

	local border_left = comp.border_left or
		(comp.border and { style = comp.border, hl = default_border and default_border.hl })
	local border_right = comp.border_right or
		(comp.border and { style = comp.border, hl = default_border and default_border.hl })

	local border_left_style = border_left and border.get(border_left.style or 'round')
	local border_right_style = border_right and border.get(border_right.style or 'round')

	if border_left then
		local hl_name = 'FuthelineDefault'
		if border_left.hl then
			hl_name = 'FuthelineBorderLeft' .. idx
		end
		table.insert(parts, '%#' .. hl_name .. '#' .. border_left_style.left_start)
	end

	if comp.icon then
		local icon_hl = comp.icon_hl or default_icon_hl
		if icon_hl then
			local icon_fg_name = 'FuthelineIconFg' .. idx
			table.insert(parts, '%#' .. icon_fg_name .. '#' .. comp.icon.text .. ' ')
			table.insert(parts, '%#FuthelineDefault#')
		end
	end

	local content_hl = comp.hl and ('FuthelineComp' .. idx) or 'FuthelineDefault'
	table.insert(parts, '%#' .. content_hl .. '#' .. ' ' .. comp.content)

	if border_right then
		local hl_name = 'FuthelineDefault'
		if border_right.hl then
			hl_name = 'FuthelineBorderRight' .. idx
		end
		table.insert(parts, '%#' .. hl_name .. '#' .. border_right_style.right_end)
	end

	return table.concat(parts)
end

function M.render(sections, config)
	local default_icon_hl = config.default_icon_hl
	local default_border = config.default_border

	local function render_section(comps, global_index)
		local parts = {}
		for i, comp in ipairs(comps) do
			if comp then
				local part = M.render_component(comp, global_index + i, default_icon_hl, default_border)
				if part ~= '' then
					table.insert(parts, part)
				end
			end
		end
		return table.concat(parts, ' ')
	end

	local left_str = render_section(sections.left or {}, 0)
	local center_str = render_section(sections.center or {}, #sections.left)
	local right_str = render_section(sections.right or {}, #sections.left + #sections.center)

	local result = left_str
	if center_str ~= '' then
		result = result .. '%=' .. center_str .. '%='
	end
	if right_str ~= '' then
		result = result .. '%=' .. right_str
	end

	return result
end

return M
