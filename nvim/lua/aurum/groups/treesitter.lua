-- Tree-sitter capture groups (@-prefixed). Modern highlight surface.
return function(p)
  return {
    ["@variable"]              = { fg = p.fg },
    ["@variable.builtin"]      = { fg = p.red },
    ["@variable.parameter"]    = { fg = p.fg },
    ["@variable.member"]       = { fg = p.gold_pale }, -- struct/record fields

    ["@constant"]              = { fg = p.mauve },
    ["@constant.builtin"]      = { fg = p.mauve },
    ["@constant.macro"]        = { fg = p.mauve },

    ["@module"]                = { fg = p.teal },
    ["@module.builtin"]        = { fg = p.teal },
    ["@label"]                 = { fg = p.red },

    ["@string"]                = { fg = p.green },
    ["@string.documentation"]  = { fg = p.green },
    ["@string.regexp"]         = { fg = p.gold_pale },
    ["@string.escape"]         = { fg = p.gold_pale },
    ["@string.special"]        = { fg = p.gold_pale },
    ["@string.special.symbol"] = { fg = p.mauve },
    ["@string.special.url"]    = { fg = p.blue, underline = true },
    ["@character"]             = { fg = p.green },
    ["@character.special"]     = { fg = p.gold_pale },

    ["@boolean"]               = { fg = p.mauve },
    ["@number"]                = { fg = p.mauve },
    ["@number.float"]          = { fg = p.mauve },

    ["@type"]                  = { fg = p.teal },
    ["@type.builtin"]          = { fg = p.teal },
    ["@type.definition"]       = { fg = p.teal },
    ["@attribute"]             = { fg = p.mauve },
    ["@attribute.builtin"]     = { fg = p.mauve },
    ["@property"]              = { fg = p.gold_pale },

    ["@function"]              = { fg = p.gold },
    ["@function.builtin"]      = { fg = p.gold },
    ["@function.call"]         = { fg = p.gold },
    ["@function.macro"]        = { fg = p.mauve },
    ["@function.method"]       = { fg = p.gold },
    ["@function.method.call"]  = { fg = p.gold },
    ["@constructor"]           = { fg = p.teal },

    ["@operator"]              = { fg = p.blue },

    ["@keyword"]               = { fg = p.red },
    ["@keyword.function"]      = { fg = p.red },
    ["@keyword.operator"]      = { fg = p.red },
    ["@keyword.import"]        = { fg = p.red },
    ["@keyword.type"]          = { fg = p.red },
    ["@keyword.modifier"]      = { fg = p.red },
    ["@keyword.repeat"]        = { fg = p.red },
    ["@keyword.return"]        = { fg = p.red },
    ["@keyword.debug"]         = { fg = p.red },
    ["@keyword.exception"]     = { fg = p.red },
    ["@keyword.conditional"]   = { fg = p.red },
    ["@keyword.directive"]     = { fg = p.mauve },

    ["@punctuation.delimiter"] = { fg = p.blue },
    ["@punctuation.bracket"]   = { fg = p.muted },
    ["@punctuation.special"]   = { fg = p.gold_pale },

    ["@comment"]               = { fg = p.comment, italic = true },
    ["@comment.documentation"] = { fg = p.comment, italic = true },
    ["@comment.error"]         = { fg = p.bg, bg = p.error, bold = true },
    ["@comment.warning"]       = { fg = p.bg, bg = p.warn, bold = true },
    ["@comment.todo"]          = { fg = p.bg, bg = p.gold, bold = true },
    ["@comment.note"]          = { fg = p.bg, bg = p.info, bold = true },

    -- markup (markdown, help, etc.)
    ["@markup.heading"]        = { fg = p.gold, bold = true },
    ["@markup.heading.1"]      = { fg = p.gold, bold = true },
    ["@markup.heading.2"]      = { fg = p.gold_pale, bold = true },
    ["@markup.heading.3"]      = { fg = p.teal, bold = true },
    ["@markup.heading.4"]      = { fg = p.blue, bold = true },
    ["@markup.strong"]         = { bold = true },
    ["@markup.italic"]         = { italic = true },
    ["@markup.strikethrough"]  = { strikethrough = true },
    ["@markup.underline"]      = { underline = true },
    ["@markup.quote"]          = { fg = p.muted, italic = true },
    ["@markup.math"]           = { fg = p.mauve },
    ["@markup.link"]           = { fg = p.blue },
    ["@markup.link.label"]     = { fg = p.teal },
    ["@markup.link.url"]       = { fg = p.blue, underline = true },
    ["@markup.raw"]            = { fg = p.green },
    ["@markup.raw.block"]      = { fg = p.green },
    ["@markup.list"]           = { fg = p.red },
    ["@markup.list.checked"]   = { fg = p.green },
    ["@markup.list.unchecked"] = { fg = p.muted },

    ["@tag"]                   = { fg = p.red },
    ["@tag.builtin"]           = { fg = p.red },
    ["@tag.attribute"]         = { fg = p.gold_pale },
    ["@tag.delimiter"]         = { fg = p.muted },

    ["@diff.plus"]             = { fg = p.add },
    ["@diff.minus"]            = { fg = p.delete },
    ["@diff.delta"]            = { fg = p.change },

    ["@none"]                  = { fg = p.fg },
  }
end
