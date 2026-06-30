-- Builds an aurum-shaped palette from the active Omarchy theme.
-- Reads ~/.config/omarchy/current/theme/colors.toml (16 ANSI colors plus
-- background/foreground/cursor/accent/selection_*) and maps it onto the slots
-- the aurum highlight groups expect, so Neovim follows `omarchy theme set`.
-- Returns nil if the file is missing/unreadable, letting init.lua fall back to
-- the static slate palette.

local function read_colors(path)
  local f = io.open(path, "r")
  if not f then
    return nil
  end
  local c = {}
  for line in f:lines() do
    local key, hex = line:match('^%s*([%w_]+)%s*=%s*"(#%x+)"')
    if key and hex then
      c[key] = hex
    end
  end
  f:close()
  return c
end

local function to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function to_hex(r, g, b)
  local clamp = function(v) return math.max(0, math.min(255, math.floor(v + 0.5))) end
  return string.format("#%02x%02x%02x", clamp(r), clamp(g), clamp(b))
end

-- Linear blend of two hex colors; t=0 -> a, t=1 -> b.
local function mix(a, b, t)
  local ar, ag, ab = to_rgb(a)
  local br, bg, bb = to_rgb(b)
  return to_hex(ar + (br - ar) * t, ag + (bg - ag) * t, ab + (bb - ab) * t)
end

local function luminance(hex)
  local r, g, b = to_rgb(hex)
  return (0.299 * r + 0.587 * g + 0.114 * b) / 255
end

return function()
  local home = os.getenv("HOME")
  if not home then
    return nil
  end
  local c = read_colors(home .. "/.config/omarchy/current/theme/colors.toml")
  if not c or not c.background or not c.foreground then
    return nil
  end

  local bg = c.background
  local fg = c.foreground
  local accent = c.accent or c.color4 or fg
  local dark = luminance(bg) < 0.5

  -- Surfaces: raise toward fg for panels above the bg, lower away from fg for
  -- darker panels. Works for both light and dark themes.
  local raise = function(t) return mix(bg, fg, t) end
  local lower = function(t) return dark and mix(bg, "#000000", t) or mix(bg, "#ffffff", t) end

  return {
    bg       = bg,
    bg_dark  = lower(0.18),
    bg_float = lower(0.10),
    bg2      = raise(0.06),
    bg3      = raise(0.13),
    sel      = c.selection_background or raise(0.22),
    fg       = fg,
    fg_dim   = mix(fg, bg, 0.20),
    muted    = mix(c.color8 or fg, fg, 0.20),
    comment  = c.color8 or mix(fg, bg, 0.45),
    line_nr  = mix(bg, fg, 0.35),
    -- gold == Omarchy accent
    gold      = accent,
    gold_pale = mix(accent, fg, 0.25),
    gold_dark = mix(accent, bg, 0.30),
    -- accents from the ANSI ramp
    red   = c.color1 or fg,
    green = c.color2 or fg,
    teal  = c.color6 or fg,
    blue  = c.color4 or fg,
    mauve = c.color5 or fg,
    -- diagnostics
    error = c.color1 or fg,
    warn  = c.color3 or fg,
    info  = c.color6 or fg,
    hint  = c.color4 or fg,
    -- git
    add    = c.color2 or fg,
    change = c.color3 or fg,
    delete = c.color1 or fg,
    none   = "NONE",
  }
end
