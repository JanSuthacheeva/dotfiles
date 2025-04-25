return {
  -- {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
        vim.g.zenbones_darken_comments = 45
        vim.cmd('set background=dark')
        vim.cmd.colorscheme('nordbones')
    end
  }
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
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
  -- }
