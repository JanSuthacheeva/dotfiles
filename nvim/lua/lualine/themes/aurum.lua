-- lualine theme for aurum. Follows the active flavor (vim.g.aurum_flavor).
-- Mode = gold-forward; section b/c stay calm slate.
local flavor = vim.g.aurum_flavor or "slate"
local c = require("aurum.palette")[flavor] or require("aurum.palette").slate

local b = { fg = c.gold, bg = c.bg3 }
local cc = { fg = c.fg, bg = c.bg2 }

return {
  normal = {
    a = { fg = c.bg, bg = c.gold, gui = "bold" },
    b = b,
    c = cc,
  },
  insert = {
    a = { fg = c.bg, bg = c.green, gui = "bold" },
    b = b,
    c = cc,
  },
  visual = {
    a = { fg = c.bg, bg = c.mauve, gui = "bold" },
    b = b,
    c = cc,
  },
  replace = {
    a = { fg = c.bg, bg = c.red, gui = "bold" },
    b = b,
    c = cc,
  },
  command = {
    a = { fg = c.bg, bg = c.teal, gui = "bold" },
    b = b,
    c = cc,
  },
  inactive = {
    a = { fg = c.muted, bg = c.bg2 },
    b = { fg = c.muted, bg = c.bg2 },
    c = { fg = c.muted, bg = c.bg2 },
  },
}
