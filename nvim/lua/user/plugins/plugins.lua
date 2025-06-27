return {
  -- For reference searching
  ({
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  }),
  -- Packer can manage itself.
  ('wbthomason/packer.nvim'),
  -- Commenting support.
  ('tpope/vim-commentary'),
  -- Add, change, and delete surrounding text.
  ('tpope/vim-surround'),
  -- Useful commands like :Rename and :SudoWrite.
  ('tpope/vim-eunuch'),
  -- Pairs of handy bracket mappings, like [b and ]b.
  ('tpope/vim-unimpaired'),
  -- Indent autodetection with editorconfig support.
  ('tpope/vim-sleuth'),
  -- Allow plugins to enable repeating of commands.
  ('tpope/vim-repeat'),
  -- Add more languages.
  -- ('sheerun/vim-polyglot')
  -- Navigate seamlessly between Vim windows and Tmux panes.
  ('christoomey/vim-tmux-navigator'),
  -- Jump to the last location when opening a file.
  ('farmergreg/vim-lastplace'),
  -- Enable * searching with visually selected text.
  ('nelstrom/vim-visual-star-search'),
  -- Automatically create parent dirs when saving.
  ('jessarcher/vim-heritage'),
  -- Text objects for HTML attributes.
  ('whatyouhide/vim-textobj-xmlattr'),
  -- Buffer Deletion Handling
  ('ojroques/nvim-bufdel'),
  -- Automatically set the working directory to the project root.
({
    'airblade/vim-rooter',
    init = function()
      -- Instead of this running every time we open a file, we'll just buildit once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  }),
--  -- Automatically add closing brackets, quotes, etc.
  ({
    'windwp/nvim-autopairs',
    config = true }),
--  -- Add smooth scrolling to avoid jarring jumps
 ({
   'karb94/neoscroll.nvim',
   config = function()
     require('neoscroll').setup({})
   end,
 }),
--  -- All closing buffers without closing the split window.
 ({
   'famiu/bufdelete.nvim',
   config = function()
     vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
   end,
  }),
--  -- Split arrays and methods onto multiple lines, or join them back up.
 ({
   'AndrewRadev/splitjoin.vim',
   config = function()
     vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
     vim.g.splitjoin_trailing_comma = 1
     vim.g.splitjoin_php_method_chain_full = 1
   end,
 }),
--  -- Automatically fix indentation when pasting code.
 ({
   'sickill/vim-pasta',
   config = function()
     vim.g.pasta_disabled_filetypes = { 'fugitive' }
   end,
 }),
--  -- Markdown preview
--  -- install without yarn or npm
 ({
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  init = function()
     local g = vim.g
     g.mkdp_page_title = "${name}.md"
     g.mkdp_theme = 'light'
     g.mkdp_auto_close = 0
   end,
   ft = "markdown",
  }),
 ({
   'nvim-lualine/lualine.nvim',
   dependencies = 'kyazdani42/nvim-web-devicons',
   config = function()
     require('lualine').setup({})
   end,
  }),
 ({
   'lukas-reineke/indent-blankline.nvim',
   config = function()
     require("ibl").setup({
       exclude = {
        filetypes = {
         'dashboard',
       }
     ,}})
   end,
  }),
 ({
   'lewis6991/gitsigns.nvim',
   config = function()
     require('gitsigns').setup({})
     vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
     vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
     vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
     vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
     vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
     vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
   end,
  }),
--  -- Git commands.
 ({
   'tpope/vim-fugitive',
   dependencies = 'tpope/vim-rhubarb',
  }),
--  --- Floating terminal.
 ({
   'voldikss/vim-floaterm',
   config = function()
     vim.g.floaterm_width = 0.8
     vim.g.floaterm_height = 0.8
     vim.g.floaterm_borderchars = '        '
     vim.keymap.set('n', '<Leader>tt', ':FloatermToggle<CR>')
     vim.keymap.set('t', '<Leader>tt', '<C-\\><C-n>:FloatermToggle<CR>')
   end
  }),
--  -- Go Debugging
 ({
   'leoluz/nvim-dap-go',
   ft = "go",
   dependencies = "mfussenegger/nvim-dap",
   config = function(_, opts)
     require("dap-go").setup(opts)
   end
  }),
--  -- PHP Refactoring Tools
 ({
   'phpactor/phpactor',
   ft = 'php',
   build= 'composer install --no-dev --optimize-autoloader',
   config = function()
     vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
     vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
   end,
 }),
 ({
   'MeanderingProgrammer/markdown.nvim',
   name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
   'nvim-treesitter',
   config = function()
       require('render-markdown').setup({})
   end,
  }),

 ({
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
        copilot_model = "gpt-4.1",
      })
  end,
  })
}
