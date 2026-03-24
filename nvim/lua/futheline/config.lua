local M = {}

M.default_config = {
	theme = 'tokyonight',

	mode = {
		icon_style = 'vim',
		custom_icon = '',
		mode_style = 'icon_long',
		colors = {},
	},

	default_icon_hl = {
		fg = '#7aa2f7',
		bg = '#1a1b26',
	},

	default_border = 'round',

	components = {
		left = {
			{ 'mode', border = 'round' },
			{ 'git', border = 'round' },
			{ 'file', border = 'arrow' },
			{ 'indent' },
		},
		center = {},
		right = {
			{ 'diagnostics', border = 'slant' },
			{ 'lsp' },
			{ 'position' },
		},
	},

	separators = {
		left = ' ',
		right = ' ',
	},
}

function M.merge(base, override)
	if override == nil then return base end
	if type(base) ~= 'table' then return override end
	if type(override) ~= 'table' then return override end

	local replace_keys = { components = true }

	local result = {}
	for k, v in pairs(base) do
		if replace_keys[k] and override[k] ~= nil then
			result[k] = override[k]
		else
			result[k] = M.merge(v, override[k])
		end
	end
	for k, v in pairs(override) do
		if result[k] == nil then
			result[k] = v
		end
	end
	return result
end

function M.get_config(user_config)
	local config = vim.deepcopy(M.default_config)
	return M.merge(config, user_config)
end

return M
