vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/AlexvZyl/nordic.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/vim-test/vim-test" },
  { src = "https://github.com/nvim-lualine/lualine.nvim"},
})

require "mason".setup()
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
require "nvim-treesitter.configs".setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
        enable = true,
  },
})

require("nordic").setup({
    on_palette = function(palette)
        palette.gray4 = palette.white0
        palette.gray5 = palette.white3
        palette.white0 = "#FFFFFF"
    end,
    italic_comments = true,
    transparent = {
        -- Enable transparent background.
        bg = true,
        -- Enable transparent background for floating windows.
        float = true,
    },
})

local palette = require('nordic.colors')
local nordic = require'lualine.themes.nordic'

nordic.normal.a.bg = palette.white0
nordic.insert.a.fg = palette.white0
nordic.insert.a.bg = "black"
nordic.visual.a.bg = palette.white1
nordic.command.a.bg = palette.white2

require('lualine').setup({
    options = {
        theme = nordic
    }
})


-- vim test config
vim.cmd([[
  let test#php#pest#executable = 'php artisan test'
  let test#php#pest#options = '--colors=always'
  let test#php#pest#options = '-v'
  let test#strategy = 'terminal'
]])


vim.cmd [[colorscheme nordic]]
