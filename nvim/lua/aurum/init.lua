-- aurum colorscheme loader.
-- Usage: `:colorscheme aurum`. Pick flavor with `vim.g.aurum_flavor`
-- ("slate" default | "onyx"). Transparent bg via `vim.g.aurum_transparent`.

local M = {}

local function apply(groups)
  local set = vim.api.nvim_set_hl
  for name, spec in pairs(groups) do
    set(0, name, spec)
  end
end

-- Rough perceived luminance of a "#rrggbb" string (0..1).
local function luminance(hex)
  hex = hex:gsub("#", "")
  local r = tonumber(hex:sub(1, 2), 16) or 0
  local g = tonumber(hex:sub(3, 4), 16) or 0
  local b = tonumber(hex:sub(5, 6), 16) or 0
  return (0.299 * r + 0.587 * g + 0.114 * b) / 255
end

function M.load(flavor)
  -- Prefer the active Omarchy theme; fall back to the static slate palette.
  local p
  local ok, omarchy = pcall(require, "aurum.omarchy")
  if ok then
    p = omarchy()
  end
  if not p then
    flavor = flavor or vim.g.aurum_flavor or "slate"
    local palettes = require("aurum.palette")
    p = palettes[flavor] or palettes.slate
  end

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = luminance(p.bg) < 0.5 and "dark" or "light"
  vim.g.colors_name = "aurum"

  p._transparent = vim.g.aurum_transparent == true or vim.g.aurum_transparent == 1

  local modules = { "editor", "syntax", "treesitter", "lsp", "plugins" }
  for _, m in ipairs(modules) do
    apply(require("aurum.groups." .. m)(p))
  end
end

-- Optional setup() for symmetry; only stores options.
function M.setup(opts)
  opts = opts or {}
  if opts.flavor then
    vim.g.aurum_flavor = opts.flavor
  end
  if opts.transparent ~= nil then
    vim.g.aurum_transparent = opts.transparent
  end
end

return M
