-- aurum palette — slate + gold, two flavors.
-- Origin: wallpapers/cpu-1.png. Body fg is COOL to match the cool bg;
-- gold is an accent only (see .local/plans/colortheme/palette.md).

local M = {}

M.slate = {
  -- base
  bg       = "#262b33",
  bg_dark  = "#1f242b", -- statusline / darker panels
  bg_float = "#1a1e24", -- floats, popups
  bg2      = "#2e333c", -- cursorline, pmenu
  bg3      = "#383f49", -- raised, borders
  sel      = "#434b57", -- visual / selection
  fg       = "#d4d8e2", -- cool body text
  fg_dim   = "#a8acb6",
  muted    = "#938b78",
  comment  = "#7a7563",
  line_nr  = "#525a66",
  -- gold (primary = the pastel slate-gold; deeper mustard reserved for warn)
  gold      = "#ecd693",
  gold_pale = "#f3e4b0",
  gold_dark = "#a17e1f",
  -- accents
  red   = "#cf6a48", -- terracotta
  green = "#a6b262", -- olive
  teal  = "#88b0a2",
  blue  = "#849ec2", -- steel
  mauve = "#b894c2",
  -- diagnostics
  error = "#cf6a48",
  warn  = "#d8ab2e",
  info  = "#88b0a2",
  hint  = "#849ec2",
  -- git
  add    = "#a6b262",
  change = "#d8ab2e",
  delete = "#cf6a48",
  none   = "NONE",
}

M.onyx = {
  bg       = "#1d2127",
  bg_dark  = "#191c22",
  bg_float = "#16191e",
  bg2      = "#23272e",
  bg3      = "#2e333b",
  sel      = "#353b45",
  fg       = "#d4d8e2",
  fg_dim   = "#a4a8b2",
  muted    = "#8a8270",
  comment  = "#6f6a5a",
  line_nr  = "#454c57",
  gold      = "#e8d18a",
  gold_pale = "#f0e0ad",
  gold_dark = "#a17e1f",
  red   = "#c96342",
  green = "#9ba65a",
  teal  = "#82a89b",
  blue  = "#7a93b8",
  mauve = "#b08cba",
  error = "#c96342",
  warn  = "#d4a72c",
  info  = "#82a89b",
  hint  = "#7a93b8",
  add    = "#9ba65a",
  change = "#d4a72c",
  delete = "#c96342",
  none   = "NONE",
}

-- Omarchy Spectra palette, mapped onto aurum's keys. No native gold; the accent
-- role is blue, warnings use yellow. Source: abhijeet-swami/omarchy-spectra-theme.
M.spectra = {
  bg       = "#1a1b1e",
  bg_dark  = "#151619",
  bg_float = "#121316",
  bg2      = "#2b2d31",
  bg3      = "#3a3d42",
  sel      = "#434650",
  fg       = "#eaeaef",
  fg_dim   = "#b8bcc4",
  muted    = "#7f8288",
  comment  = "#6b6e74",
  line_nr  = "#4a4d53",
  gold      = "#f7c553", -- "gold" role = spectra yellow
  gold_pale = "#ffd86f",
  gold_dark = "#a9863a",
  red   = "#ef5d67",
  green = "#8edb73",
  teal  = "#7dd8d3", -- cyan
  blue  = "#7ca5ff",
  mauve = "#e29ef3", -- magenta
  error = "#ef5d67",
  warn  = "#f7c553",
  info  = "#7dd8d3",
  hint  = "#7ca5ff",
  add    = "#8edb73",
  change = "#f7c553",
  delete = "#ef5d67",
  none   = "NONE",
}

return M
