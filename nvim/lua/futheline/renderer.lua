local M = {}

local border = require('futheline.utils.border')

M.hl_counter = 1

function M.create_hl(name, fg, bg)
  vim.api.nvim_set_hl(0, 'Futheline' .. name, { fg = fg, bg = bg })
end

function M.setup_highlights(sections, theme)
  vim.api.nvim_set_hl(0, 'FuthelineDefault', { fg = '#c0caf5', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'FuthelineBorderStart', { link = 'FuthelineDefault' })
  vim.api.nvim_set_hl(0, 'FuthelineBorderEnd', { link = 'FuthelineDefault' })

  M.hl_counter = 1
  local all_comps = {}
  vim.list_extend(all_comps, sections.left or {})
  vim.list_extend(all_comps, sections.center or {})
  vim.list_extend(all_comps, sections.right or {})

  for _, comp in ipairs(all_comps) do
    if comp then
      if comp.hl then
        local name = 'Comp' .. M.hl_counter
        M.create_hl(name, comp.hl.fg, comp.hl.bg)
      end
      if comp.icon and comp.icon.hl then
        local icon_bg_name = 'IconBg' .. M.hl_counter
        local icon_fg_name = 'IconFg' .. M.hl_counter
        M.create_hl(icon_bg_name, 'NONE', comp.icon.hl.bg)
        M.create_hl(icon_fg_name, comp.icon.hl.fg, comp.icon.hl.bg)
      end
      M.hl_counter = M.hl_counter + 1
    end
  end
end

function M.render_component(comp, comp_index, prev_has_border, next_has_border, default_icon_hl)
  if not comp then return '' end

  local parts = {}
  local hl_name = 'FuthelineDefault'

  if comp.hl then
    hl_name = string.format('FuthelineComp%d', comp_index)
  end

  if comp.border and not prev_has_border then
    local border_chars = border.get(comp.border)
    table.insert(parts, '%#FuthelineBorderStart#' .. border_chars.left_start)
  end

  if comp.icon then
    local icon_hl = comp.icon.hl or default_icon_hl
    if icon_hl then
      local icon_bg_name = 'FuthelineIconBg' .. comp_index
      local icon_fg_name = 'FuthelineIconFg' .. comp_index
      table.insert(parts, '%#' .. icon_bg_name .. '#' .. ' ')
      table.insert(parts, '%#' .. icon_fg_name .. '#' .. comp.icon.text)
      table.insert(parts, '%#FuthelineDefault# ')
    end
  end

  table.insert(parts, '%#' .. hl_name .. '#' .. comp.content)

  if comp.border then
    if not next_has_border then
      local border_chars = border.get(comp.border)
      table.insert(parts, '%#FuthelineBorderEnd#' .. border_chars.right_end)
    else
      table.insert(parts, '%#FuthelineDefault#')
    end
  else
    table.insert(parts, '%#FuthelineDefault#')
  end

  return table.concat(parts)
end

function M.render(sections, config)
  local default_icon_hl = config.default_icon_hl

  local function render_section(comps, global_index)
    local parts = {}
    for i, comp in ipairs(comps) do
      if comp then
        local next_comp = comps[i + 1]
        local prev_has_border = i > 1 and comps[i - 1] and comps[i - 1].border
        local next_has_border = next_comp and next_comp.border
        local part = M.render_component(comp, global_index + i, prev_has_border, next_has_border, default_icon_hl)
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
