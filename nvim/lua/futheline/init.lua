local M = {}

local config = require('futheline.config')
local renderer = require('futheline.renderer')
local state = require('futheline.state')

M.config = nil
M.theme = nil

local component_modules = {
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

    local mod = component_modules[name]
    if mod then
      local rendered = mod.render(cfg, theme, comp_opts)
      if rendered then
        if comp_opts.border then
          rendered.border = comp_opts.border
        end
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
  renderer.setup_highlights(components, M.theme)
  renderer.render(components, M.config)
end

function M.get()
  if not M.config then return '' end

  state.update_all()
  local components = get_components(M.config, M.theme)
  renderer.setup_highlights(components, M.theme)
  return renderer.render(components, M.config)
end

function M.setup(user_config)
  M.config = config.get_config(user_config)

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
      vim.schedule(refresh)
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
