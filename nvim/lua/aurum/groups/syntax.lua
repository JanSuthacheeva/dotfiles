-- Legacy syntax groups (vim regex syntax, rust.vim, fallbacks).
return function(p)
  return {
    Comment        = { fg = p.comment, italic = true },

    Constant       = { fg = p.mauve },
    String         = { fg = p.green },
    Character      = { fg = p.green },
    Number         = { fg = p.mauve },
    Boolean        = { fg = p.mauve },
    Float          = { fg = p.mauve },

    Identifier     = { fg = p.fg },
    Function       = { fg = p.gold },

    Statement      = { fg = p.red },
    Conditional    = { fg = p.red },
    Repeat         = { fg = p.red },
    Label          = { fg = p.red },
    Operator       = { fg = p.blue },
    Keyword        = { fg = p.red },
    Exception      = { fg = p.red },

    PreProc        = { fg = p.mauve },
    Include        = { fg = p.red },
    Define         = { fg = p.mauve },
    Macro          = { fg = p.mauve },
    PreCondit      = { fg = p.mauve },

    Type           = { fg = p.teal },
    StorageClass   = { fg = p.teal },
    Structure      = { fg = p.teal },
    Typedef        = { fg = p.teal },

    Special        = { fg = p.gold_pale },
    SpecialChar    = { fg = p.gold_pale },
    Tag            = { fg = p.red },
    Delimiter      = { fg = p.blue },
    SpecialComment = { fg = p.muted, italic = true },
    Debug          = { fg = p.red },
  }
end
