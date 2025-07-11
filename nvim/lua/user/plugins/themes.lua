return {
  -- {
  --   'zenbones-theme/zenbones.nvim',
  --   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --   -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --   dependencies = 'rktjmp/lush.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   transparent = true,
  --   -- you can set set configuration options here
  --   config = function()
  --       vim.g.zenbones_darken_comments = 45
  --       vim.cmd('set background=dark')
  --       vim.cmd.colorscheme('nordbones')
  --   end
  -- },
  -- {
  --  'xiyaowong/transparent.nvim'
  -- }
  -- {
  --   'andreasvc/vim-256noir',
  --   lazy = false,
  --   config = function()
  --     vim.cmd[[colorscheme 256_noir]]
  --     end,
  -- }
  {
    'alligator/accent.vim',
    lazy = false,
    config = function()
      vim.cmd[[
      let g:accent_colour = 'green'
      let g:accent_darken = 1
      colorscheme accent
      ]]
      end,
  }
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   transparent = true,
  --   styles = {
  --   sidebars = "transparent",
  --   floats = "transparent",
  --   },
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd[[colorscheme tokyonight-storm]]
  --     end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- config = function()
  --     require("catppuccin").setup({
  --       -- Add your Catppuccin configuration options here
  --       flavour = "latte", -- Example option
  --       -- Other configuration options
  --     })
  --     vim.cmd("colorscheme catppuccin")
  --   end,
  -- },
   -- "neanias/everforest-nvim",
   -- version = false,
   -- lazy = false,
   -- priority = 1000, -- make sure to load this before all the other start plugins
  -- -- Optional; default configuration will be used if setup isn't called.
   -- config = function()
   --   require("everforest").setup({
   --     -- Your config here
   --   })
   -- end,
  }
