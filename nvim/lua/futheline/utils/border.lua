local M = {}

M.round = {
	left_start = '',
	left_end = '',
	right_start = '',
	right_end = '',
	mid = ' ',
	block = ' ',
}

M.arrow = {
	left_start = '',
	left_end = '',
	right_start = '',
	right_end = '',
	mid = ' ',
	block = ' ',
}

M.slant = {
	left_start = '',
	left_end = '',
	right_start = '',
	right_end = '',
	mid = ' ',
	block = ' ',
}

M.none = {
	left_start = '',
	left_end = '',
	right_start = '',
	right_end = '',
	mid = ' ',
	block = '',
}

M.minimal = {
	left_start = '│',
	left_end = '│',
	right_start = '│',
	right_end = '│',
	mid = '│',
	block = ' ',
}

function M.get(style)
	return M[style] or M.round
end

function M.render(component, style, is_first, is_last)
	local s = M.get(style)
	local parts = {}

	if not component.border then
		return ''
	end

	local hl = component.hl or {}
	local bg = hl.bg or '#1f2335'

	if is_first then
		table.insert(parts, '%#FuthelineBorderStart#' .. s.left_start)
	end

	if is_last then
		table.insert(parts, '%#FuthelineBorderEnd#' .. s.right_end)
	end

	return table.concat(parts)
end

return M
