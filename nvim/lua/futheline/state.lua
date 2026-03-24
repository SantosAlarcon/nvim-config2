local M = {}

local border = require('futheline.utils.border')
local colors = require('futheline.utils.colors')
local icons = require('futheline.utils.icons')

local state = {
	mode = 'n',
	git = {
		branch = '',
		added = 0,
		removed = 0,
		changed = 0,
	},
	diagnostics = {
		errors = 0,
		warnings = 0,
		hints = 0,
		info = 0,
	},
	lsp = {
		attached = false,
		servers = {},
	},
	file = {
		path = '',
		modified = false,
		readonly = false,
	},
	position = {
		line = 1,
		column = 1,
		percentage = 0,
	},
}

M.state = state

function M.update_mode()
	local mode = vim.api.nvim_get_mode().mode
	M.state.mode = mode
	return mode
end

function M.update_git()
	local gitsigns = package.loaded.gitsigns
	if gitsigns and vim.b.gitsigns_status_dict then
		local status = vim.b.gitsigns_status_dict
		M.state.git.branch = status.head or ''
		M.state.git.added = status.added or 0
		M.state.git.removed = status.removed or 0
		M.state.git.changed = status.changed or 0
	else
		M.state.git.branch = ''
		M.state.git.added = 0
		M.state.git.removed = 0
		M.state.git.changed = 0
	end
end

function M.update_diagnostics()
	local diags = vim.diagnostic.get(0)
	M.state.diagnostics = {
		errors = 0,
		warnings = 0,
		hints = 0,
		info = 0,
	}
	for _, diag in ipairs(diags) do
		local severity = diag.severity
		if severity == vim.diagnostic.severity.ERROR then
			M.state.diagnostics.errors = M.state.diagnostics.errors + 1
		elseif severity == vim.diagnostic.severity.WARN then
			M.state.diagnostics.warnings = M.state.diagnostics.warnings + 1
		elseif severity == vim.diagnostic.severity.HINT then
			M.state.diagnostics.hints = M.state.diagnostics.hints + 1
		elseif severity == vim.diagnostic.severity.INFO then
			M.state.diagnostics.info = M.state.diagnostics.info + 1
		end
	end
end

function M.update_lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	M.state.lsp.attached = #clients > 0
	M.state.lsp.servers = vim.tbl_map(function(c)
		return c.name
	end, clients)
end

function M.update_file()
	local buf = vim.api.nvim_get_current_buf()
	M.state.file.path = vim.api.nvim_buf_get_name(buf)
	M.state.file.modified = vim.api.nvim_buf_get_option(buf, 'modified')
	M.state.file.readonly = vim.api.nvim_buf_get_option(buf, 'readonly')
end

function M.update_position()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1]
	local col = cursor[2] + 1
	local total = vim.api.nvim_buf_line_count(0)
	local percentage = math.floor((line / total) * 100)

	M.state.position = {
		line = line,
		column = col,
		percentage = percentage,
	}
end

function M.update_all()
	M.update_mode()
	M.update_git()
	M.update_diagnostics()
	M.update_lsp()
	M.update_file()
	M.update_position()
end

return M
