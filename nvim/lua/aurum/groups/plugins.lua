-- Plugin highlight groups for what's installed: mini.pick.
-- (lualine has its own theme file: lua/lualine/themes/aurum.lua)
return function(p)
  return {
    -- mini.pick
    MiniPickBorder        = { fg = p.bg3, bg = p._transparent and p.none or p.bg_float },
    MiniPickBorderBusy    = { fg = p.warn, bg = p._transparent and p.none or p.bg_float },
    MiniPickBorderText    = { fg = p.gold, bg = p._transparent and p.none or p.bg_float },
    MiniPickNormal        = { fg = p.fg, bg = p._transparent and p.none or p.bg_float },
    MiniPickPrompt        = { fg = p.gold, bg = p._transparent and p.none or p.bg_float, bold = true },
    MiniPickPromptCaret   = { fg = p.gold },
    MiniPickMatchCurrent  = { bg = p.sel },
    MiniPickMatchMarked   = { fg = p.gold_pale, bold = true },
    MiniPickMatchRanges   = { fg = p.gold },
    MiniPickPreviewLine   = { bg = p.bg2 },
    MiniPickPreviewRegion = { bg = p.sel },
    MiniPickHeader        = { fg = p.teal },
    MiniPickIconDirectory = { fg = p.blue },
    MiniPickIconFile      = { fg = p.fg },

    -- generic mini.nvim (harmless if other mini modules added later)
    MiniIconsAzure  = { fg = p.blue },
    MiniIconsBlue   = { fg = p.blue },
    MiniIconsCyan   = { fg = p.teal },
    MiniIconsGreen  = { fg = p.green },
    MiniIconsGrey   = { fg = p.muted },
    MiniIconsOrange = { fg = p.red },
    MiniIconsPurple = { fg = p.mauve },
    MiniIconsRed    = { fg = p.red },
    MiniIconsYellow = { fg = p.gold },
  }
end
