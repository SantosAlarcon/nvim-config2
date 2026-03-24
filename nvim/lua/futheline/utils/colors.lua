local M = {}

function M.blend(fg, bg, alpha)
  fg = M.hex_to_rgb(fg)
  bg = M.hex_to_rgb(bg)
  alpha = alpha or 0.5

  local function blend_channel(f, b)
    return math.floor(f * alpha + b * (1 - alpha))
  end

  return string.format('#%02x%02x%02x',
    blend_channel(fg[1], bg[1]),
    blend_channel(fg[2], bg[2]),
    blend_channel(fg[3], bg[3])
  )
end

function M.lighten(hex, amount)
  local rgb = M.hex_to_rgb(hex)
  return string.format('#%02x%02x%02x',
    math.min(255, rgb[1] + amount),
    math.min(255, rgb[2] + amount),
    math.min(255, rgb[3] + amount)
  )
end

function M.darken(hex, amount)
  return M.lighten(hex, -amount)
end

function M.hex_to_rgb(hex)
  hex = hex:gsub('#', '')
  return {
    tonumber(hex:sub(1, 2), 16),
    tonumber(hex:sub(3, 4), 16),
    tonumber(hex:sub(5, 6), 16),
  }
end

function M.rgb_to_hex(rgb)
  return string.format('#%02x%02x%02x', rgb[1], rgb[2], rgb[3])
end

function M.is_bright(hex)
  local rgb = M.hex_to_rgb(hex)
  local brightness = (rgb[1] * 299 + rgb[2] * 587 + rgb[3] * 114) / 1000
  return brightness > 128
end

return M
