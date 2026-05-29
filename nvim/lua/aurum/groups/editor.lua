-- Core editor / UI highlight groups.
return function(p)
  local bg = p._transparent and p.none or p.bg
  local bg_sign = p._transparent and p.none or p.bg

  return {
    Normal       = { fg = p.fg, bg = bg },
    NormalNC     = { fg = p.fg, bg = bg },
    NormalFloat  = { fg = p.fg, bg = p._transparent and p.none or p.bg_float },
    FloatBorder  = { fg = p.bg3, bg = p._transparent and p.none or p.bg_float },
    FloatTitle   = { fg = p.gold, bg = p._transparent and p.none or p.bg_float, bold = true },

    Cursor       = { fg = p.bg, bg = p.gold },
    lCursor      = { fg = p.bg, bg = p.gold },
    CursorLine   = { bg = p.bg2 },
    CursorColumn = { bg = p.bg2 },
    ColorColumn  = { bg = p.bg2 },
    CursorLineNr = { fg = p.gold, bold = true },
    LineNr       = { fg = p.line_nr },
    LineNrAbove  = { fg = p.line_nr },
    LineNrBelow  = { fg = p.line_nr },
    SignColumn   = { fg = p.muted, bg = bg_sign },
    FoldColumn   = { fg = p.line_nr, bg = bg_sign },
    Folded       = { fg = p.muted, bg = p.bg2 },

    VertSplit    = { fg = p.bg3 },
    WinSeparator = { fg = p.bg3 },
    WinBar       = { fg = p.fg, bg = bg },
    WinBarNC     = { fg = p.muted, bg = bg },

    StatusLine   = { fg = p.fg, bg = p.bg3 },
    StatusLineNC = { fg = p.muted, bg = p.bg2 },

    Pmenu        = { fg = p.fg, bg = p.bg2 },
    PmenuSel     = { fg = p.bg, bg = p.gold, bold = true },
    PmenuKind    = { fg = p.teal, bg = p.bg2 },
    PmenuKindSel = { fg = p.bg, bg = p.gold },
    PmenuExtra   = { fg = p.muted, bg = p.bg2 },
    PmenuExtraSel= { fg = p.bg, bg = p.gold },
    PmenuSbar    = { bg = p.bg2 },
    PmenuThumb   = { bg = p.bg3 },

    Visual       = { bg = p.sel },
    VisualNOS    = { bg = p.sel },
    Search       = { fg = p.bg, bg = p.gold_pale },
    IncSearch    = { fg = p.bg, bg = p.gold },
    CurSearch    = { fg = p.bg, bg = p.gold },
    Substitute   = { fg = p.bg, bg = p.red },
    MatchParen   = { fg = p.gold, bold = true, underline = true },

    NonText      = { fg = p.bg3 },
    Whitespace   = { fg = p.bg3 },
    SpecialKey   = { fg = p.bg3 },
    EndOfBuffer  = { fg = bg == p.none and p.bg3 or p.bg },
    Conceal      = { fg = p.muted },
    Directory    = { fg = p.blue },
    Title        = { fg = p.gold, bold = true },
    QuickFixLine = { bg = p.sel, bold = true },
    WildMenu     = { fg = p.bg, bg = p.gold },

    ErrorMsg     = { fg = p.error, bold = true },
    WarningMsg   = { fg = p.warn },
    ModeMsg      = { fg = p.fg, bold = true },
    MoreMsg      = { fg = p.teal },
    Question     = { fg = p.teal },
    MsgArea      = { fg = p.fg, bg = bg },
    MsgSeparator = { fg = p.bg3 },

    TabLine      = { fg = p.muted, bg = p.bg2 },
    TabLineSel   = { fg = p.bg, bg = p.gold, bold = true },
    TabLineFill  = { bg = p.bg_dark },

    -- diffs
    DiffAdd      = { bg = "#2e3a2e" },
    DiffChange   = { bg = "#33342a" },
    DiffDelete   = { fg = p.delete, bg = "#3a2a2a" },
    DiffText     = { bg = "#454a2e" },
    diffAdded    = { fg = p.add },
    diffRemoved  = { fg = p.delete },
    diffChanged  = { fg = p.change },

    -- spell
    SpellBad     = { undercurl = true, sp = p.error },
    SpellCap     = { undercurl = true, sp = p.warn },
    SpellRare    = { undercurl = true, sp = p.info },
    SpellLocal   = { undercurl = true, sp = p.hint },

    Underlined   = { underline = true },
    Ignore       = { fg = p.muted },
    Error        = { fg = p.error },
    Todo         = { fg = p.bg, bg = p.gold, bold = true },
  }
end
