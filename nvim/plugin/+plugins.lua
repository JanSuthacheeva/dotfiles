vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/AlexvZyl/nordic.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/vim-test/vim-test" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/rust-lang/rust.vim" }
})

require "mason".setup()
-- Auto-install LSP servers. Names are lspconfig server names (see plugin/lsp.lua).
-- sourcekit is omitted: it ships with the Swift/Xcode toolchain, not Mason.
-- automatic_enable is off because servers are enabled explicitly in plugin/lsp.lua.
require "mason-lspconfig".setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "intelephense",
    "pyright",
    "tailwindcss",
    "gopls",
    "html",
    "ts_ls",
    "rust_analyzer",
  },
  automatic_enable = false,
})
require "mini.pick".setup()
require "nvim-treesitter".setup({
  ensure_installed = {"blade", "css", "go", "gomod", "html", "lua", "php", "python", "swift", "sql"},
  auto_install = true,
    highlight = {
      enable = true,
  },

  config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = {"src/parser.c"},
          branch = "main",
        },
        filetype = "blade"
      }
      vim.filetype.add({
        pattern = {
          ['.*%.blade%.php'] = 'blade',
        },
      })
    end
})

-- require "nvim-treesitter.configs".setup({
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
--   indent = {
--         enable = true,
--   },
-- })

-- aurum colorscheme (local plugin, see nvim/lua/aurum/ + nvim/colors/aurum.lua).
-- Colors follow the active Omarchy theme (read from
-- ~/.config/omarchy/current/theme/colors.toml). Falls back to the static slate
-- palette when that file is absent; set vim.g.aurum_flavor = "onyx" to pick the
-- other static flavor for the fallback.
-- vim.g.aurum_transparent = true  -- uncomment for a transparent background

require('lualine').setup({
    options = {
        theme = 'aurum'
    }
})


-- vim test config
vim.cmd([[
  let test#php#pest#executable = 'php artisan test'
  let test#php#pest#options = '--colors=always'
  let test#php#pest#options = '-v'
  let test#strategy = 'terminal'
]])


vim.cmd [[colorscheme aurum]]
