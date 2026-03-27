local M = {}

local renderer = require('futheline.renderer')
local state = require('futheline.state')

M.config = nil
M.theme = nil

local function load_presets()
	local presets_dir = vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':h') .. '/presets'
	local presets = {}
	local preset_names = { 'standard', 'rounded', 'sharp', 'minimal', 'soft', 'vscode' }
	for _, name in ipairs(preset_names) do
		local ok, preset = pcall(dofile, presets_dir .. '/' .. name .. '.lua')
		if ok then
			presets[name] = preset
		end
	end
	return presets
end

local presets = load_presets()

M.presets = presets

local default_config = {
	theme = 'tokyonight',
	git = { show_diff = true },
	mode = {
		icon_style = 'vim',
		custom_icon = '',
		mode_style = 'icon_long',
		labels = {},
		colors = {},
	},
	components = { left = {}, center = {}, right = {} },
	separators = { left = ' ', right = ' ' },
}

local function get_config(user_config)
	local preset_name = user_config and user_config.preset or 'standard'
	local preset = presets[preset_name] or presets.standard

	local cfg = vim.deepcopy(default_config)
	cfg.preset = preset_name
	cfg.border = preset.border
	cfg.icons = preset.icons
	cfg.padding = preset.padding
	cfg.separators = { left = preset.separator, right = preset.separator }

	local preset_comps = preset.components or {}
	local user_comps = user_config and user_config.components or {}
	cfg.components = {
		left = {},
		center = {},
		right = {},
	}
	for _, comp in ipairs(preset_comps.left or {}) do
		table.insert(cfg.components.left, vim.deepcopy(comp))
	end
	for _, comp in ipairs(user_comps.left or {}) do
		table.insert(cfg.components.left, vim.deepcopy(comp))
	end
	for _, comp in ipairs(preset_comps.center or {}) do
		table.insert(cfg.components.center, vim.deepcopy(comp))
	end
	for _, comp in ipairs(user_comps.center or {}) do
		table.insert(cfg.components.center, vim.deepcopy(comp))
	end
	for _, comp in ipairs(preset_comps.right or {}) do
		table.insert(cfg.components.right, vim.deepcopy(comp))
	end
	for _, comp in ipairs(user_comps.right or {}) do
		table.insert(cfg.components.right, vim.deepcopy(comp))
	end

	if user_config then
		local user_copy = vim.deepcopy(user_config)
		user_copy.preset = nil
		user_copy.components = nil
		for k, v in pairs(user_copy) do
			cfg[k] = v
		end
	end

	return cfg
end

M.component_modules = {
	mode = require('futheline.components.mode'),
	git = require('futheline.components.git'),
	file = require('futheline.components.file'),
	filetype = require('futheline.components.filetype'),
	encoding = require('futheline.components.encoding'),
	format = require('futheline.components.format'),
	indent = require('futheline.components.indent'),
	filesize = require('futheline.components.filesize'),
	diagnostics = require('futheline.components.diagnostics'),
	lsp = require('futheline.components.lsp'),
	lspservers = require('futheline.components.lspservers'),
	lspprogress = require('futheline.components.lspprogress'),
	position = require('futheline.components.position'),
	spell = require('futheline.components.spell'),
	paste = require('futheline.components.paste'),
	macro = require('futheline.components.macro'),
	search = require('futheline.components.search'),
	selection = require('futheline.components.selection'),
	gitblame = require('futheline.components.gitblame'),
	githunks = require('futheline.components.githunks'),
	gitcommit = require('futheline.components.gitcommit'),
	treesitter = require('futheline.components.treesitter'),
	bufname = require('futheline.components.bufname'),
	quickfix = require('futheline.components.quickfix'),
}

local function get_components_for_section(cfg, theme, section)
	local components = {}
	local section_comps = cfg.components[section] or {}
	for _, comp_def in ipairs(section_comps) do
		local name = type(comp_def) == 'table' and (comp_def[1] or comp_def.name) or comp_def
		local comp_opts = type(comp_def) == 'table' and vim.deepcopy(comp_def) or {}
		comp_opts.name = nil

		local mod = M.component_modules[name]
		if mod then
			local rendered = mod.render(cfg, theme, comp_opts)
			if rendered then
				rendered._index = #components + 1
				table.insert(components, rendered)
			end
		end
	end
	return components
end

local function get_components(cfg, theme)
	return {
		left = get_components_for_section(cfg, theme, 'left'),
		center = get_components_for_section(cfg, theme, 'center'),
		right = get_components_for_section(cfg, theme, 'right'),
	}
end

local function refresh()
	if not M.config then return end

	state.update_all()
	local components = get_components(M.config, M.theme)
	renderer.setup_statusline_hl(M.theme)
	renderer.setup_highlights(components, M.theme, state.state.mode)
	renderer.render(components, M.config)
end

function M.get()
	if not M.config then return '' end

	state.update_all()
	local components = get_components(M.config, M.theme)
	renderer.setup_statusline_hl(M.theme)
	renderer.setup_highlights(components, M.theme, state.state.mode)
	return renderer.render(components, M.config)
end

function M.setup(user_config)
	M.config = get_config(user_config)

	if type(M.config.theme) == 'string' then
		local ok, theme_mod = pcall(require, 'futheline.themes.' .. M.config.theme)
		if ok then
			M.theme = theme_mod
		else
			vim.notify('futheline: theme "' .. M.config.theme .. '" not found, using default', vim.log.levels.WARN)
			M.theme = require('futheline.themes.tokyonight')
		end
	else
		M.theme = M.config.theme or require('futheline.themes.tokyonight')
	end

	renderer.setup_statusline_hl(M.theme)
	vim.opt.laststatus = 3

	vim.api.nvim_create_autocmd({
		'ModeChanged',
		'BufEnter',
		'WinEnter',
		'BufWinEnter',
		'FileType',
		'DiagnosticChanged',
	}, {
		pattern = '*',
		callback = function()
			vim.schedule(refresh)
		end,
	})

	vim.api.nvim_create_autocmd('BufWinEnter', {
		pattern = '*',
		callback = function()
			vim.wo.statusline = '%!v:lua.futheline_get()'
		end,
	})

	vim.api.nvim_create_autocmd({
		'LspAttach',
		'LspDetach',
	}, {
		pattern = '*',
		callback = function()
			state.update_lsp()
			vim.schedule(refresh)
		end,
	})

	vim.api.nvim_create_autocmd({
		'User',
	}, {
		pattern = 'GitSignsUpdate',
		callback = function()
			state.update_git()
			vim.schedule(refresh)
		end,
	})

	vim.api.nvim_create_autocmd({
		'VimResized',
		'WinScrolled',
	}, {
		pattern = '*',
		callback = function()
			state.update_position()
			vim.schedule(refresh)
		end,
	})

	vim.api.nvim_create_autocmd('ColorScheme', {
		pattern = '*',
		callback = function()
			vim.schedule(function()
				renderer.setup_statusline_hl(M.theme)
				refresh()
			end)
		end,
	})

	_G.futheline_get = function()
		local ok, result = pcall(M.get)
		if ok then
			return result
		else
			vim.notify('futheline error: ' .. tostring(result), vim.log.levels.ERROR)
			return ''
		end
	end
	vim.wo.statusline = '%!v:lua.futheline_get()'

	vim.g.loaded_futheline = 1
end

_G.futheline = M

return M
