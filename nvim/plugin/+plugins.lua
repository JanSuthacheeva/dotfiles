vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { src = "https://github.com/vim-test/vim-test",
    config = function()
      vim.cmd[[
        let test#php#pest#executable = 'php artisan test'
        let test#php#pest#options = '--colors=always'
        let test#php#pest#options = '-v'
        let test#strategy = 'vimterminal'
      ]]
    end
  },
})

require "mason".setup()
require "mini.pick".setup()
require "nvim-treesitter".setup()
require "lualine".setup()

vim.cmd [[colorscheme tokyonight-storm]]
