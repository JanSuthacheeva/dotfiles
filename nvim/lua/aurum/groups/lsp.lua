-- LSP diagnostics + semantic token highlight groups.
return function(p)
  return {
    DiagnosticError = { fg = p.error },
    DiagnosticWarn  = { fg = p.warn },
    DiagnosticInfo  = { fg = p.info },
    DiagnosticHint  = { fg = p.hint },
    DiagnosticOk    = { fg = p.green },

    DiagnosticVirtualTextError = { fg = p.error, bg = p.bg2 },
    DiagnosticVirtualTextWarn  = { fg = p.warn,  bg = p.bg2 },
    DiagnosticVirtualTextInfo  = { fg = p.info,  bg = p.bg2 },
    DiagnosticVirtualTextHint  = { fg = p.hint,  bg = p.bg2 },

    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.warn },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.hint },

    DiagnosticFloatingError = { fg = p.error },
    DiagnosticFloatingWarn  = { fg = p.warn },
    DiagnosticFloatingInfo  = { fg = p.info },
    DiagnosticFloatingHint  = { fg = p.hint },

    DiagnosticSignError = { fg = p.error },
    DiagnosticSignWarn  = { fg = p.warn },
    DiagnosticSignInfo  = { fg = p.info },
    DiagnosticSignHint  = { fg = p.hint },

    DiagnosticDeprecated = { strikethrough = true, sp = p.muted },
    DiagnosticUnnecessary = { fg = p.muted },

    LspReferenceText  = { bg = p.sel },
    LspReferenceRead  = { bg = p.sel },
    LspReferenceWrite = { bg = p.sel, underline = true },
    LspInlayHint      = { fg = p.muted, bg = p.bg2, italic = true },
    LspCodeLens       = { fg = p.muted, italic = true },
    LspCodeLensSeparator = { fg = p.bg3 },
    LspSignatureActiveParameter = { fg = p.gold, bold = true },

    -- semantic tokens -> link to tree-sitter captures
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.decorator"]     = { link = "@attribute" },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.enumMember"]    = { link = "@constant" },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.interface"]     = { link = "@type" },
    ["@lsp.type.macro"]         = { link = "@constant.macro" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.namespace"]     = { link = "@module" },
    ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"]      = { link = "@variable" },

    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.readonly"]       = { link = "@constant" },
    ["@lsp.mod.deprecated"]                  = { strikethrough = true },
  }
end
